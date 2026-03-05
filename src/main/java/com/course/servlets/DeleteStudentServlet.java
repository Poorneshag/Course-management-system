package com.course.servlets;

import com.course.dao.UserDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteStudent")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));

	    UserDAO dao = new UserDAO();
	    dao.deleteUser(id);

	    response.sendRedirect("ViewStudents");
	}
}
