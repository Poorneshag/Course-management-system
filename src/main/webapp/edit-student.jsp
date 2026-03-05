<%@ page import="com.course.dto.User" %>
<%
    User student = (User) request.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
    
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background: #f8f9fa;
        }
        .edit-card {
            max-width: 500px;
            margin: auto;
            margin-top: 60px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="card edit-card">
            <div class="card-header">
                Edit Student
            </div>
            <div class="card-body">
                <form action="UpdateStudent" method="post">
                    <!-- Hidden field for student ID -->
                    <input type="hidden" name="id" value="<%= student.getId() %>" />

                    <!-- Name -->
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" 
                               value="<%= student.getName() %>" required>
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" 
                               value="<%= student.getEmail() %>" required>
                    </div>

                    <!-- Action Buttons -->
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-success">Update</button>
                        <a href="ViewStudents" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle JS (optional for interactive components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
