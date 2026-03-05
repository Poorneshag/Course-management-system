<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
    String userName = (String) session.getAttribute("userName");
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Management System</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Optional custom CSS -->
    <style>
        body {
            background-image: url('https://as1.ftcdn.net/v2/jpg/07/91/33/34/1000_F_791333469_gU9CYK86F5vw5qF1oPDgL7GakvlxC5nA.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            color: #fff;
            min-height: 100vh;
        }

        .nav-link.custom-hover:hover {
            background-color: rgba(255, 255, 255, 0.2);
            color: #ffc107 !important;
            border-radius: 0.25rem;
            transition: all 0.3s ease-in-out;
        }

        .navbar-brand, .nav-link, .navbar-text {
            color: white !important;
        }

        .content-wrapper {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 2rem;
            border-radius: 1rem;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Course Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <% if (userName != null) { %>
                        <li class="nav-item">
                            <span class="navbar-text me-3">
                                Welcome, <%= userName %> (<%= role %>)
                            </span>
                        </li>
                        <% if ("admin".equals(role)) { %>
                            <li class="nav-item">
                                <a class="nav-link custom-hover" href="add-course.jsp">Add Course</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link custom-hover" href="ViewCoursesServlet">View All Courses</a>
                            </li>
                        <% } else { %>
                            <li class="nav-item">
                                <a class="nav-link custom-hover" href="ViewCoursesServlet">View Available Courses</a>
                            </li>
                        <% } %>
                        <li class="nav-item">
                            <a class="nav-link custom-hover" href="LogoutServlet">Logout</a>
                        </li>
                    <% } else { %>
                        <li class="nav-item">
                            <a class="nav-link custom-hover" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link custom-hover" href="register.jsp">Register</a>
                        </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 content-wrapper text-center">
                <h1 class="display-5">Welcome to Course Management System</h1>
                <p class="lead">Manage your courses, enrollments, and progress all in one place.</p>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
