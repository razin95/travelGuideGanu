package Servlet;

import dao.UserDAO;
import model.PasswordResetDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = request.getParameter("token");
        String newPassword = request.getParameter("password");

        String email = PasswordResetDAO.getEmailByToken(token);
        if (email != null) {
            UserDAO.updatePassword(email, newPassword);
            PasswordResetDAO.invalidateToken(token);
            request.setAttribute("message", "Password successfully reset!");
        } else {
            request.setAttribute("message", "Invalid or expired token.");
        }

        request.getRequestDispatcher("reset-password.jsp").forward(request, response);
    }
}