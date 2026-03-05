package com.course.servlets;

import com.course.dao.UserDAO;
import com.course.dto.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(name, email, password, "student");
        boolean success = UserDAO.registerUser(user);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration failed. Try again.");
        }
    }
}
