<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*, com.course.dto.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('images/bg-student.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.95);
        }

        /* Hover effect for list-group items */
        .list-group-item {
            transition: all 0.3s ease;
        }

        .list-group-item:hover {
            background-color: #f0f8ff;
            color: #000;
            transform: scale(1.02);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h3>Welcome, <%= user.getName() %> 🎓</h3>
                </div>
                <div class="card-body">
                    <p class="lead text-center">This is your student dashboard.</p>
                    <div class="list-group mt-4">
                        <a href="enrollment.jsp" class="list-group-item list-group-item-action">
                            📘 Enroll in a Course
                        </a>
                        <a href="StudentViewEnrollmentsServlet" class="list-group-item list-group-item-action">
                            📄 View My Enrolled Courses
                        </a>
                        <a href="Logout" class="list-group-item list-group-item-action text-danger">
                            🚪 Logout
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
