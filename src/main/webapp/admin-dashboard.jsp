<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.course.dto.*" %>
<%@ page import="com.course.dao.CourseDAO" %>
<%
    CourseDAO dao = new CourseDAO();
    List<Course> courseList = dao.getAllCourses();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="text-primary">Admin Dashboard</h1>
            <a href="Logout" class="btn btn-danger">Logout</a>
        </div>

        <div class="mb-4">
            <a href="add-course.jsp" class="btn btn-success me-2">➕ Add New Course</a>
            <a href="ViewEnrollments" class="btn btn-info me-2">📋 View All Enrollments</a>
            <a href="ViewStudents" class="btn btn-secondary">👥 View All Students</a>
        </div>

        <div class="card">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">📚 Course List</h5>
            </div>
            <div class="card-body p-0">
                <table class="table table-striped table-bordered m-0">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Course Name</th>
                            <th>Description</th>
                            <th>Duration</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (courseList.isEmpty()) { %>
                            <tr>
                                <td colspan="5" class="text-center text-muted">No courses available.</td>
                            </tr>
                        <% } else { 
                            for(Course c : courseList) { %>
                            <tr>
                                <td><%= c.getId() %></td>
                                <td><%= c.getName() %></td>
                                <td><%= c.getDescription() %></td>
                                <td><%= c.getDuration() %></td>
                                <td>
                                    <a href="edit-course.jsp?id=<%= c.getId() %>" class="btn btn-sm btn-warning">Edit</a>
                                    <a href="DeleteCourse?id=<%= c.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this course?');">Delete</a>
                                </td>
                            </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
