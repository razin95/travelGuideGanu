package LoginJe;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */



import Model1.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(username == null || password == null || username.isEmpty() || password.isEmpty()) {
            request.setAttribute("errorMessage", "Username and password are required.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            // Check if username exists
            String checkQuery = "SELECT id FROM users WHERE username = ?";
            try (PreparedStatement ps = conn.prepareStatement(checkQuery)) {
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                    request.setAttribute("errorMessage", "Username already taken. Choose another.");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                    return;
                }
            }

            // Insert new user
            String insertQuery = "INSERT INTO users (username, password) VALUES (?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(insertQuery)) {
                ps.setString(1, username);
                ps.setString(2, password); // In production, hash passwords!
                int inserted = ps.executeUpdate();
                if(inserted > 0) {
                    request.setAttribute("successMessage", "Registration successful! You can now log in.");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Registration failed. Please try again.");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}

