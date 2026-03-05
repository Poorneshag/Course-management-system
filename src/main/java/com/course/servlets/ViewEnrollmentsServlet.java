package com.course.servlets;

import com.course.dao.EnrollmentDAO;
import com.course.dto.Enrollment;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ViewEnrollments")
public class ViewEnrollmentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    EnrollmentDAO dao = new EnrollmentDAO();
	    List<Enrollment> enrollmentList = dao.getAllEnrollments();
	    System.out.println(enrollmentList);
	    request.setAttribute("enrollments", enrollmentList);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("view-enrollments.jsp");
	    dispatcher.forward(request, response);
	}
}
