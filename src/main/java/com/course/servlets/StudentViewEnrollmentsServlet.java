package com.course.servlets;

import com.course.dao.EnrollmentDAO;
import com.course.dto.Enrollment;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/StudentViewEnrollmentsServlet")
public class StudentViewEnrollmentsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int studentId = (Integer) session.getAttribute("studentId");

        EnrollmentDAO dao = new EnrollmentDAO();
        List<Enrollment> enrollments = dao.getEnrollmentsByStudent(studentId);

        request.setAttribute("enrollments", enrollments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student_enrollments.jsp");
        dispatcher.forward(request, response);
    }
}
