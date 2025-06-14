package model;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class MailUtil {

    public static void sendEmail(String recipientEmail, String subject, String content) {
        final String fromEmail = "s72568@ocean.umt.edu.my";  // Sender email
        final String password = "ydbr xxss mksb epuv";  // Your App Password (NOT your Gmail password)

        // Setup email properties
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.port", "587"); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.starttls.enable", "true");  // Enable STARTTLS for security

        // Establish session
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            // Compose email message
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(fromEmail)); // Sender's email
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail)); // Recipient's email
            msg.setSubject(subject); // Email subject
            msg.setText(content);  // Email body

            // Send email
            Transport.send(msg);
            System.out.println("✅ Email sent to " + recipientEmail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
