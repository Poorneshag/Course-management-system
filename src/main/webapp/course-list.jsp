<%@ page import="java.util.*, com.course.dto.Course" %>
<%
    List<Course> courses = (List<Course>) request.getAttribute("courses");
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Courses</title>
</head>
<body>
    <h2>Available Courses</h2>
    <table border="1">
        <tr>
            <th>ID</th><th>Name</th><th>Description</th><th>Duration</th>
            <% if ("admin".equals(role)) { %>
                <th>Actions</th>
            <% } %>
        </tr>
        <%
            for (Course course : courses) {
        %>
        <tr>
            <td><%= course.getId() %></td>
            <td><%= course.getName() %></td>
            <td><%= course.getDescription() %></td>
            <td><%= course.getDuration() %></td>
            <% if ("admin".equals(role)) { %>
            <td>
                <a href="EditCourseServlet?id=<%= course.getId() %>">Edit</a> |
                <a href="DeleteCourseServlet?id=<%= course.getId() %>" onclick="return confirm('Are you sure?');">Delete</a>
            </td>
            <% } %>
        </tr>
        <%
            }
        %>
    </table>
    <a href="index.jsp">Back to Home</a>
</body>
</html>
