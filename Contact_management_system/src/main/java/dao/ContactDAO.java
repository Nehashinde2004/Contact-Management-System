package dao;

import model.Contact;
import database.DBConnection;
import java.sql.*;
import java.util.*;

public class ContactDAO {
    public int addContact(Contact contact) throws SQLException {
        String sql = "INSERT INTO contacts (first_name, last_name, address, email, phone) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, contact.getFirstName());
            stmt.setString(2, contact.getLastName());
            stmt.setString(3, contact.getAddress());
            stmt.setString(4, contact.getEmail());
            stmt.setString(5, contact.getPhone());
            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return -1;
    }

    public List<Contact> getAllContacts() throws SQLException {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT * FROM contacts WHERE is_deleted = 0";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Contact contact = new Contact(
                    rs.getInt("id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("address"),
                    rs.getString("email"),
                    rs.getString("phone")
                );
                contacts.add(contact);
            }
        }
        return contacts;
    }

    public Contact getContactById(int id) throws SQLException {
        String sql = "SELECT * FROM contacts WHERE id = ? AND is_deleted = 0";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Contact(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone")
                    );
                }
            }
        }
        return null;
    }

    public void updateContact(Contact contact) throws SQLException {
        String sql = "UPDATE contacts SET first_name=?, last_name=?, address=?, email=?, phone=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, contact.getFirstName());
            stmt.setString(2, contact.getLastName());
            stmt.setString(3, contact.getAddress());
            stmt.setString(4, contact.getEmail());
            stmt.setString(5, contact.getPhone());
            stmt.setInt(6, contact.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteContact(int id) throws SQLException {
        String sql = "UPDATE contacts SET is_deleted = 1 WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public boolean emailExists(String email) throws SQLException {
        String sql = "SELECT COUNT(*) FROM contacts WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public boolean emailExistsForOtherId(String email, int id) throws SQLException {
        String sql = "SELECT COUNT(*) FROM contacts WHERE email = ? AND id <> ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setInt(2, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public int getTotalContacts() throws SQLException {
        String sql = "SELECT COUNT(*) FROM contacts";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    public List<Contact> getRecentContacts(int limit) throws SQLException {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT * FROM contacts ORDER BY id DESC LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, limit);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Contact contact = new Contact(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone")
                    );
                    contacts.add(contact);
                }
            }
        }
        return contacts;
    }

    public List<Contact> getDeletedContacts() throws SQLException {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT * FROM contacts WHERE is_deleted = 1";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Contact contact = new Contact(
                    rs.getInt("id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("address"),
                    rs.getString("email"),
                    rs.getString("phone")
                );
                contacts.add(contact);
            }
        }
        return contacts;
    }
} 