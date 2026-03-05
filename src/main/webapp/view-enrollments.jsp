<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.course.dto.Enrollment" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Enrollments - Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4 text-center text-primary">All Student Enrollments</h2>
    
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Enrollment ID</th>
                    <th>Student Name</th>
                    <th>Email</th>
                    <th>Course Name</th>
                    <th>Duration</th>
                    <th>Enrolled Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Enrollment> enrollments = (List<Enrollment>) request.getAttribute("enrollments");
                    if (enrollments != null && !enrollments.isEmpty()) {
                        for (Enrollment e : enrollments) {
                %>
                <tr>
                    <td><%= e.getEnrollmentId() %></td>
                    <td><%= e.getStudentName() %></td>
                    <td><%= e.getStudentEmail() %></td>
                    <td><%= e.getCourseName() %></td>
                    <td><%= e.getCourseDuration() %></td>
                    <td><%= e.getEnrolledDate() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6" class="text-center text-muted">No enrollments found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-4">
        <a href="admin-dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
</div>

<!-- Bootstrap JS Bundle (Optional if you need dropdowns/modals) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
