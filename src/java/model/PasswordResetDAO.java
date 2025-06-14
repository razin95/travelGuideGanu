package model;

import Model1.DBConnection;
import java.sql.*;

public class PasswordResetDAO {

    public static void saveToken(String email, String token, long expiryTime) {
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO password_resets (email, token, expiry) VALUES (?, ?, ?)");
            ps.setString(1, email);
            ps.setString(2, token);
            ps.setTimestamp(3, new Timestamp(expiryTime));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getEmailByToken(String token) {
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT email, expiry FROM password_resets WHERE token = ?");
            ps.setString(1, token);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Timestamp expiry = rs.getTimestamp("expiry");
                if (expiry.after(new Timestamp(System.currentTimeMillis()))) {
                    return rs.getString("email");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void invalidateToken(String token) {
        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM password_resets WHERE token = ?");
            ps.setString(1, token);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}