package dao;

import java.sql.*;
import java.util.*;
import model.Attraction;

public class AttractionDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/visit_terengganu";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Attraction> listAll() throws SQLException {
        List<Attraction> list = new ArrayList<>();
        String sql = "SELECT * FROM attractions";

        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql); 
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Attraction a = new Attraction();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setType(rs.getString("type"));
                a.setDescription(rs.getString("description"));
                a.setImage(rs.getString("image"));
                a.setImageUrl(rs.getString("image_url")); // Added image URL
                list.add(a);
            }
        }
        return list;
    }

    public Attraction get(int id) throws SQLException {
        Attraction a = new Attraction();
        String sql = "SELECT * FROM attractions WHERE id = ?";
        
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setType(rs.getString("type"));
                a.setDescription(rs.getString("description"));
                a.setImage(rs.getString("image"));
                a.setImageUrl(rs.getString("image_url")); // Added image URL
            }
        }
        return a;
    }

    public void save(Attraction a) throws SQLException {
        String sql = a.getId() > 0 ?
            "UPDATE attractions SET name=?, type=?, description=?, image=?, image_url=? WHERE id=?" :
            "INSERT INTO attractions (name, type, description, image, image_url) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, a.getName());
            ps.setString(2, a.getType());
            ps.setString(3, a.getDescription());
            ps.setString(4, a.getImage());
            ps.setString(5, a.getImageUrl()); // Added image URL

            if (a.getId() > 0) {
                ps.setInt(6, a.getId());
            }

            ps.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM attractions WHERE id=?";
        try (Connection conn = getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}