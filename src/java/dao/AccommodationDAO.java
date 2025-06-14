package dao;

import model.Accommodation;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;

public class AccommodationDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/visit_terengganu";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Accommodation> listAll() throws SQLException {
        List<Accommodation> list = new ArrayList<>();
        String sql = "SELECT * FROM accommodations";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Accommodation a = new Accommodation();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setType(rs.getString("type"));
                a.setDescription(rs.getString("description"));
                a.setPrice(rs.getDouble("price"));
                a.setImage(rs.getString("image"));
                a.setImageUrl(rs.getString("image_url")); // Added image URL field

                java.sql.Date fromDate = rs.getDate("available_from");
                java.sql.Date toDate = rs.getDate("available_to");

                a.setAvailableFrom(fromDate != null ? fromDate.toLocalDate() : null);
                a.setAvailableTo(toDate != null ? toDate.toLocalDate() : null);

                list.add(a);
            }
        }
        return list;
    }

    public Accommodation get(int id) throws SQLException {
        Accommodation a = new Accommodation();
        String sql = "SELECT * FROM accommodations WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setType(rs.getString("type"));
                a.setDescription(rs.getString("description"));
                a.setPrice(rs.getDouble("price"));
                a.setImage(rs.getString("image"));
                a.setImageUrl(rs.getString("image_url")); // Added image URL field

                java.sql.Date fromDate = rs.getDate("available_from");
                java.sql.Date toDate = rs.getDate("available_to");

                a.setAvailableFrom(fromDate != null ? fromDate.toLocalDate() : null);
                a.setAvailableTo(toDate != null ? toDate.toLocalDate() : null);
            }
        }
        return a;
    }

    public void save(Accommodation a) throws SQLException {
        String sql = a.getId() > 0 ?
            "UPDATE accommodations SET name=?, type=?, description=?, price=?, image=?, image_url=?, available_from=?, available_to=? WHERE id=?" :
            "INSERT INTO accommodations (name, type, description, price, image, image_url, available_from, available_to) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, a.getName());
            ps.setString(2, a.getType());
            ps.setString(3, a.getDescription());
            ps.setDouble(4, a.getPrice());
            ps.setString(5, a.getImage());
            ps.setString(6, a.getImageUrl()); // Added image URL field

            if (a.getAvailableFrom() != null) {
                ps.setDate(7, java.sql.Date.valueOf(a.getAvailableFrom()));
            } else {
                ps.setNull(7, java.sql.Types.DATE);
            }

            if (a.getAvailableTo() != null) {
                ps.setDate(8, java.sql.Date.valueOf(a.getAvailableTo()));
            } else {
                ps.setNull(8, java.sql.Types.DATE);
            }

            if (a.getId() > 0) {
                ps.setInt(9, a.getId());
            }

            ps.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM accommodations WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}