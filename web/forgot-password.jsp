<%-- 
    Document   : forgot-password
    Created on : 14 Jun 2025, 7:03:11 pm
    Author     : ACER
--%>



<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Forgot Password</title></head>
<body>
    <h2>Forgot Password</h2>
    <form action="ForgotPasswordServlet" method="post">
        <label>Enter your email:</label>
        <input type="email" name="email" required /><br><br>
        <input type="submit" value="Send Reset Link" />
    </form>
    <p style="color:red;"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
</body>
</html>