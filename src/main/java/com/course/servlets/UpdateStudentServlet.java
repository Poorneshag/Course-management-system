package com.course.servlets;

import com.course.dao.UserDAO;
import com.course.dto.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateStudent")
public class UpdateStudentServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO(); // DAO instance
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get form parameters
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");

            // Set data to DTO
            User student = new User();
            student.setId(id);
            student.setName(name);
            student.setEmail(email);

            // Update via DAO
            boolean result = userDAO.updateStudent(student);

            if (result) {
                response.sendRedirect("ViewStudents");
            } else {
                request.setAttribute("error", "Unable to update student.");
                request.getRequestDispatcher("edit-student.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("edit-student.jsp").forward(request, response);
        }
    }
}
