<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("adminObj") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
    <h2>Admin Login</h2>
    
    <form method="post" action="Admin">
        Username: <input type="text" name="username" required><br><br>
        Password: <input type="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
    <p style="color:red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
</body>
</html>
