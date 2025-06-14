package LoginJe;

import Model1.DBConnection;
import Model1.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember");

        // If username and password are empty, show an error
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorMessage", "Username and password are required.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // ✅ Admin login (for testing purposes)
        if (username.equals("admin") && password.equals("admin123")) {
            HttpSession session = request.getSession();
            User admin = new User();
            admin.setUsername("admin");
            admin.setRole("admin");
            session.setAttribute("user", admin);
            session.setAttribute("userId", 0); // optional
            response.sendRedirect("managerDashboard.jsp");
            return;
        }

        // ✅ Customer login
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM users WHERE username = ?";
            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String storedPwd = rs.getString("password_hash");

                    // If the password matches
                    if (password.equals(storedPwd)) {
                        User user = new User();
                        user.setUserId(rs.getInt("user_id"));
                        user.setUsername(rs.getString("username"));
                        user.setPassword(rs.getString("password_hash"));
                        user.setEmail(rs.getString("email"));
                        user.setRole(rs.getString("role"));

                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);
                        session.setAttribute("userId", user.getUserId());

                        // Handle Remember Me functionality
                        if ("on".equals(rememberMe)) {
                            // Store the username and password in cookies for 7 days
                            Cookie usernameCookie = new Cookie("username", username);
                            Cookie passwordCookie = new Cookie("password", password);
                            usernameCookie.setMaxAge(60 * 60 * 24 * 7); // 7 days
                            passwordCookie.setMaxAge(60 * 60 * 24 * 7); // 7 days
                            response.addCookie(usernameCookie);
                            response.addCookie(passwordCookie);
                        } else {
                            // If "Remember Me" is not checked, clear cookies
                            Cookie usernameCookie = new Cookie("username", "");
                            Cookie passwordCookie = new Cookie("password", "");
                            usernameCookie.setMaxAge(0); // Expire immediately
                            passwordCookie.setMaxAge(0); // Expire immediately
                            response.addCookie(usernameCookie);
                            response.addCookie(passwordCookie);
                        }

                        // Redirect to customer dashboard
                        response.sendRedirect("customerDashboard.jsp");
                    } else {
                        request.setAttribute("errorMessage", "Invalid username or password.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("errorMessage", "Invalid username or password.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // Handle GET request to pre-fill the login form with cookies if available
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check if cookies for username and password are available
        Cookie[] cookies = request.getCookies();
        String savedUsername = null;
        String savedPassword = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    savedUsername = cookie.getValue();
                }
                if ("password".equals(cookie.getName())) {
                    savedPassword = cookie.getValue();
                }
            }
        }

        // If cookies are available, pre-fill the login form
        if (savedUsername != null && savedPassword != null) {
            request.setAttribute("savedUsername", savedUsername);
            request.setAttribute("savedPassword", savedPassword);
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
