package com.course.dao;

import java.sql.*;

public class AdminDAO {
    private Connection conn;

    public AdminDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean validateAdmin(String email, String password) {
        boolean isValid = false;
        try {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=? AND role='admin'");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }
}
