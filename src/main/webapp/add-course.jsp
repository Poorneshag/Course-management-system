<%@ page import="com.course.dto.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Course</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h3>Add New Course</h3>
            </div>
            <div class="card-body">
                <form action="AddCourse" method="post">
                    <div class="mb-3">
                        <label class="form-label">Course Name:</label>
                        <input type="text" class="form-control" name="name" required />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description:</label>
                        <textarea class="form-control" name="description" rows="4" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Instructor:</label>
                        <input type="text" class="form-control" name="instructor" required />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Duration:</label>
                        <input type="text" class="form-control" name="duration" placeholder="e.g. 6 weeks" required />
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-success">Add Course</button>
                        <a href="admin-dashboard.jsp" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle (optional for dropdowns, modals, etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
