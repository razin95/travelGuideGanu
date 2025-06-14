<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
        request.setAttribute("errorMessage", "All fields are required.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    // Hardcoded admin login
    if ("admin".equals(username) && "admin123".equals(password)) {
        session.setAttribute("username", username);
        response.sendRedirect("managerDashboard.jsp");
        return;
    }

    // Customer login from users table (no role column used)
    String dbURL = "jdbc:mysql://localhost:3306/visit_terengganu";
    String dbUser = "root";
    String dbPass = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        PreparedStatement pst = conn.prepareStatement(
            "SELECT * FROM users WHERE username = ? AND password_hash = ?"
        );
        pst.setString(1, username);
        pst.setString(2, password);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            session.setAttribute("username", username);
            response.sendRedirect("customerDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        rs.close();
        pst.close();
        conn.close();

    } catch (Exception e) {
        out.println("Database error: " + e.getMessage());
    }
%>
