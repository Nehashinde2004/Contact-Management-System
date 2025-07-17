package dao;

import java.sql.*;
import model.Admin;
import database.DBConnection;

public class AdminDAO {
    public boolean registerAdmin(Admin admin) {
        String sql = "INSERT INTO admin (username, password) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Admin loginAdmin(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username=? AND password=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Admin(rs.getInt("id"), rs.getString("username"), rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
} 