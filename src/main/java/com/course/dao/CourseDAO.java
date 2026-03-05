package com.course.dao;

import com.course.dto.Course;
import com.course.util.DbConnection;

import java.sql.*;
import java.util.*;

public class CourseDAO {
    private Connection conn;

    // ✅ Constructor to initialize connection
    public CourseDAO() {
        try {
            this.conn = DbConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addCourse(Course course) {
        try {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO course (name, description, duration) VALUES (?, ?, ?)");
            ps.setString(1, course.getName());
            ps.setString(2, course.getDescription());
            ps.setString(3, course.getDuration());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Course> getAllCourses() {
        List<Course> list = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM course");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setDuration(rs.getString("duration"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Course getCourseById(int id) {
        Course course = null;
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM course WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                course = new Course();
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
                course.setDescription(rs.getString("description"));
                course.setDuration(rs.getString("duration"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return course;
    }

    public void updateCourse(Course course) {
        try {
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE course SET title = ?, description = ?, duration = ? WHERE id = ?");
            ps.setString(1, course.getName());
            ps.setString(2, course.getDescription());
            ps.setString(3, course.getDuration());
            ps.setInt(4, course.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCourse(int id) {
        try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM course WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
