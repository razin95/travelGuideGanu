<%-- 
    Document   : reset-password
    Created on : 14 Jun 2025, 7:04:22 pm
    Author     : ACER
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Reset Password</title></head>
<body>
    <h2>Reset Your Password</h2>
    <form action="ResetPasswordServlet" method="post">
        <input type="hidden" name="token" value="<%= request.getParameter("token") %>" />
        <label>New Password:</label>
        <input type="password" name="password" required /><br><br>
        <input type="submit" value="Reset Password" />
    </form>
    <p style="color:red;"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
</body>
</html>