package com.course.dao;

import com.course.dto.User;
import com.course.util.DbConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public static User authenticate(String email, String password) {
        User user = null;
        try (Connection conn = DbConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM users WHERE email = ? AND password = ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static boolean registerUser(User user) {
        boolean result = false;
        try (Connection conn = DbConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)");
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());

            int rows = ps.executeUpdate();
            result = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public boolean updateStudent(User student) {
        boolean updated = false;

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "UPDATE users SET name = ?, email = ? WHERE id = ?")) {

            stmt.setString(1, student.getName());
            stmt.setString(2, student.getEmail());
            stmt.setInt(3, student.getId());

            updated = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }

    public List<User> getAllStudents() {
        List<User> list = new ArrayList<>();
        try (Connection conn = DbConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE role = 'student'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                list.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean deleteUser(int id) {
        try (Connection conn = DbConnection.getConnection()) {
            String sql = "DELETE FROM users WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public User getUserById(int id) {
        try (Connection conn = DbConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateUser(User user) {
        try (Connection conn = DbConnection.getConnection()) {
            String sql = "UPDATE users SET name = ?, email = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setInt(3, user.getId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
