package dao;

import Model1.DBConnection;
import Model1.User;
import java.sql.*;

public class UserDAO {

    public static User getUserByEmail(String email) {
    try (Connection conn = DBConnection.getConnection()) {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new User(
                rs.getInt("user_id"),                 // ⚠️ fix from "id"
                rs.getString("username"),
                rs.getString("password_hash"),        // ⚠️ fix from "password"
                rs.getString("email"),
                rs.getString("role")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

  public static void updatePassword(String email, String newPassword) {
    try (Connection conn = DBConnection.getConnection()) {
        PreparedStatement ps = conn.prepareStatement("UPDATE users SET password_hash = ? WHERE email = ?");
        ps.setString(1, newPassword); // You can hash this if needed
        ps.setString(2, email);
        int rows = ps.executeUpdate();
        System.out.println("✅ Password updated rows: " + rows);
    } catch (Exception e) {
        e.printStackTrace();
    }
}

}
