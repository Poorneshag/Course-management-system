package com.course.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/course_db"; // Change as per your DB name
    private static final String USER = "root"; // Change to your MySQL username
    private static final String PASSWORD = "Poorna@2004"; // Change to your MySQL password

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 8+ driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
