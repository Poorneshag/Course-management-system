<%@ page import="java.util.*, com.course.dto.Enrollment" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Enrolled Courses</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Your Enrolled Courses</h4>
        </div>
        <div class="card-body">
            <%
                List<Enrollment> enrollments = (List<Enrollment>) request.getAttribute("enrollments");
                if (enrollments == null || enrollments.isEmpty()) {
            %>
                <p class="text-danger">You are not enrolled in any courses yet.</p>
            <%
                } else {
            %>
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>Enrollment ID</th>
                            <th>Course Name</th>
                            <th>Duration</th>
                            <th>Enrolled Date</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        for (Enrollment e : enrollments) {
                    %>
                        <tr>
                            <td><%= e.getEnrollmentId() %></td>
                            <td><%= e.getCourseName() %></td>
                            <td><%= e.getCourseDuration() %></td>
                            <td><%= e.getEnrolledDate() %></td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
