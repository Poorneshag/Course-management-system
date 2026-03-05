<%@ page import="java.util.*, com.course.dto.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Students</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4 text-center">All Students</h2>

    <table class="table table-bordered table-striped shadow-sm">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th class="text-center">Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<User> students = (List<User>) request.getAttribute("students");
            if (students != null && !students.isEmpty()) {
                for (User s : students) {
        %>
            <tr>
                <td><%= s.getId() %></td>
                <td><%= s.getName() %></td>
                <td><%= s.getEmail() %></td>
                <td class="text-center">
                    <a href="EditStudent?id=<%= s.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                    <a href="DeleteStudent?id=<%= s.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="4" class="text-center text-muted">No students found.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
