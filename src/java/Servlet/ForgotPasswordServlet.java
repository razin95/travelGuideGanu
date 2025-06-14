package Servlet;

import dao.UserDAO;
import model.PasswordResetDAO;
import model.MailUtil;
import Model1.User;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        User user = UserDAO.getUserByEmail(email);

        if (user != null) {
            String token = UUID.randomUUID().toString();
            long expiry = System.currentTimeMillis() + 30 * 60 * 1000;

            PasswordResetDAO.saveToken(email, token, expiry);

            String resetLink = "http://localhost:8080/TouristAttractions/reset-password.jsp?token=" + token;

            String subject = "Reset Your Password";
            String body = "Click the link below to reset your password:\n" + resetLink +
                          "\n\nThis link expires in 30 minutes.";

            MailUtil.sendEmail(email, subject, body);

            request.setAttribute("message", "Reset link sent! Please check your email.");
        } else {
            request.setAttribute("message", "❌ Email not found.");
        }

        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }
}