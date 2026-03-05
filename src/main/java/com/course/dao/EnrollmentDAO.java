package com.course.dao;

import com.course.dto.Enrollment;
import com.course.util.DbConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EnrollmentDAO {
	public List<Enrollment> getAllEnrollments() {
	    List<Enrollment> list = new ArrayList<>();

	    String sql = "SELECT e.id AS enrollmentId, e.user_id AS studentId, " +
	                 "u.name AS studentName, u.email AS studentEmail, " +
	                 "c.name AS courseName, c.duration, e.enrollment_date " +
	                 "FROM enrollments e " +
	                 "JOIN users u ON e.user_id = u.id " +
	                 "JOIN course c ON e.course_id = c.id";

	    try (Connection conn = DbConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql);
	         ResultSet rs = stmt.executeQuery()) {

	        while (rs.next()) {
	            Enrollment e = new Enrollment();
	            e.setEnrollmentId(rs.getInt("enrollmentId"));
	            e.setStudentId(rs.getInt("studentId"));  // ✅ FIXED
	            e.setStudentName(rs.getString("studentName"));
	            e.setStudentEmail(rs.getString("studentEmail"));
	            e.setCourseName(rs.getString("courseName"));
	            e.setCourseDuration(rs.getString("duration"));
	            e.setEnrolledDate(rs.getTimestamp("enrollment_date"));
	            list.add(e);
	        }

	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }

	    return list;
	}
 // Check if student is already enrolled
    public boolean isStudentEnrolled(int studentId, int courseId) {
        String sql = "SELECT * FROM enrollments WHERE user_id = ? AND course_id = ?";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, studentId);
            stmt.setInt(2, courseId);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next(); // true if found
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Enroll student
    public boolean enrollStudent(int studentId, int courseId) {
        if (isStudentEnrolled(studentId, courseId)) return false;

        String sql = "INSERT INTO enrollments(user_id, course_id, enrollment_date) VALUES (?, ?, ?)";

        try (Connection conn = DbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

        	stmt.setInt(1, studentId);
        	stmt.setInt(2, courseId);
        	stmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

 public List<Enrollment> getEnrollmentsByStudent(int studentId) {
	    List<Enrollment> list = new ArrayList<>();
	    String sql = "SELECT e.id, u.name, u.email, c.name AS course_name, c.duration, e.enrollment_date " +
	                 "FROM enrollments e " +
	                 "JOIN users u ON e.user_id = u.id " +
	                 "JOIN course c ON e.course_id = c.id " +
	                 "WHERE u.id = ?";

	    try (Connection conn = DbConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setInt(1, studentId);
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                Enrollment dto = new Enrollment();
	                dto.setEnrollmentId(rs.getInt("id"));
	                dto.setStudentName(rs.getString("name"));
	                dto.setStudentEmail(rs.getString("email"));
	                dto.setCourseName(rs.getString("course_name"));
	                dto.setCourseDuration(rs.getString("duration")); // ✅ Fix here
	                dto.setEnrolledDate(rs.getTimestamp("enrollment_date")); // ✅ Fix here
	                list.add(dto);
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}

}
