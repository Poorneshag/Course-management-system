package com.course.servlets;

import com.course.dao.CourseDAO;
import com.course.dto.Course;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AddCourse")
public class AddCourseServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Getting form parameters
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String duration = request.getParameter("duration");

		// Populating DTO
		Course course = new Course();
		course.setName(name);
		course.setDescription(description);
		course.setDuration(duration);

		// Saving to DB using DAO
		CourseDAO dao = new CourseDAO();
		dao.addCourse(course);

		// Redirect to admin dashboard
		response.sendRedirect("admin-dashboard.jsp");
	}
}
