<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.course.dao.*, com.course.dto.Course, com.course.dto.Enrollment, com.course.dto.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enrollment Page</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
%>
    <div class="container mt-5">
        <div class="alert alert-danger">Unauthorized access. Please <a href="login.jsp">login</a>.</div>
    </div>
<%
    return;
    }

    String role = user.getRole(); // "admin" or "student"
    CourseDAO dao = new CourseDAO();
    List<Course> courses = dao.getAllCourses();
    List<Enrollment> enrollments = (List<Enrollment>) request.getAttribute("enrollments");
%>

<div class="container mt-4">
    <% if ("admin".equals(role)) { %>
        <h2 class="mb-4">📋 All Enrollments (Admin View)</h2>
        <table class="table table-bordered table-hover table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Enrollment ID</th>
                    <th>Student Name</th>
                    <th>Student Email</th>
                    <th>Course Name</th>
                    <th>Duration</th>
                    <th>Enrolled Date</th>
                </tr>
            </thead>
            <tbody>
            <%
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
                <tr><td colspan="6" class="text-center">No enrollments found.</td></tr>
            <%
                }
            %>
            </tbody>
        </table>

    <% } else if ("student".equals(role)) { %>
        <div class="card shadow p-4">
            <h2 class="mb-4">🎓 Enroll in a Course</h2>
            <form action="StudentEnrollCourseServlet" method="post">
                <div class="mb-3">
                    <label for="course" class="form-label">Select Course:</label>
                    <select name="courseId" class="form-select" required>
                        <% for (Course course : courses) { %>
                            <option value="<%= course.getId() %>">
                                <%= course.getName() %> - <%= course.getDuration() %>
                            </option>
                        <% } %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Enroll</button>
            </form>
        </div>
    <% } else { %>
        <div class="alert alert-warning mt-4">Unauthorized role. Access denied.</div>
    <% } %>

    <div class="mt-4">
        <a href="student-dashboard.jsp" class="btn btn-secondary">⬅️ Back to Dashboard</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
