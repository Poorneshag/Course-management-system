package com.course.dto;

import java.sql.Timestamp;

public class Enrollment {
    private int enrollmentId;
    private int studentId;
    private String studentName;
    private String studentEmail;
    private int courseId;
    private String courseName;
    private String courseDuration;
    private Timestamp enrolledDate;

    // Getters and Setters
    public int getEnrollmentId() { return enrollmentId; }
    public void setEnrollmentId(int enrollmentId) { this.enrollmentId = enrollmentId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getStudentEmail() { return studentEmail; }
    public void setStudentEmail(String studentEmail) { this.studentEmail = studentEmail; }

    public int getCourseId() { return courseId; }
    public void setCourseId(int courseId) { this.courseId = courseId; }

    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }

    public String getCourseDuration() { return courseDuration; }
    public void setCourseDuration(String courseDuration) { this.courseDuration = courseDuration; }

    public Timestamp getEnrolledDate() { return enrolledDate; }
    public void setEnrolledDate(Timestamp enrolledDate) { this.enrolledDate = enrolledDate; }
}
