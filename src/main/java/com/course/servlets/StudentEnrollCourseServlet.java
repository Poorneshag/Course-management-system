package com.course.servlets;

import com.course.dao.EnrollmentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/StudentEnrollCourseServlet")
public class StudentEnrollCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int studentId = (Integer) session.getAttribute("studentId");

        try {
            int courseId = Integer.parseInt(request.getParameter("courseId"));

            EnrollmentDAO dao = new EnrollmentDAO();
            boolean success = dao.enrollStudent(studentId, courseId);

            if (success) {
                response.sendRedirect("StudentViewEnrollmentsServlet");
            } else {
                request.setAttribute("error", "Enrollment failed or already enrolled in this course.");
                request.getRequestDispatcher("enrollment.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid course ID.");
            request.getRequestDispatcher("enrollment.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Something went wrong during enrollment.");
            request.getRequestDispatcher("enrollment.jsp").forward(request, response);
        }
    }
}
