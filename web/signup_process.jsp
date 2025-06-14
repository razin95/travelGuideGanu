<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");

    // Basic input validation
    if (username == null || email == null || password == null || confirmPassword == null
            || username.isEmpty() || email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
        out.println("<p style='color:red;'>All fields are required.</p>");
        return;
    }

    if (!password.equals(confirmPassword)) {
        out.println("<p style='color:red;'>Passwords do not match.</p>");
        return;
    }

    // DB connection variables
    String dbURL = "jdbc:mysql://localhost:3306/visit_terengganu";  // Update DB name
    String dbUser = "root";  // Change as needed
    String dbPass = "";      // Change as needed

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Check for existing username
        pst = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
        pst.setString(1, username);
        rs = pst.executeQuery();

        if (rs.next()) {
            out.println("<p style='color:red;'>Username already exists. Please choose another.</p>");
        } else {
            // Insert new user
            pst = conn.prepareStatement("INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)");
            pst.setString(1, username);
            pst.setString(2, email);
            pst.setString(3, password); // Anda boleh tambahkan hash jika perlu

            int rowsInserted = pst.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("login.jsp");
            } else {
                out.println("<p style='color:red;'>Signup failed. Please try again.</p>");
            }
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try {
            rs.close();
        } catch (Exception e) {
        }
        if (pst != null) try {
            pst.close();
        } catch (Exception e) {
        }
        if (conn != null) try {
            conn.close();
        } catch (Exception e) {
        }
    }
%>
