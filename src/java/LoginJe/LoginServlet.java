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

        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorMessage", "Username and password are required.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // ✅ Admin login
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

                    if (password.equals(storedPwd)) {
                        User user = new User();
                        user.setUserId(rs.getInt("user_id"));
                        user.setUsername(rs.getString("username"));
                        user.setPassword(rs.getString("password_hash"));
                        user.setEmail(rs.getString("email"));
                        user.setRole(rs.getString("role"));

                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);
                        session.setAttribute("userId", user.getUserId()); // ✅ DITAMBAH
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
}

