package com.course.servlets;

import com.course.dao.UserDAO;
import com.course.dto.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/EditStudent")
public class EditStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));

	    UserDAO dao = new UserDAO();
	    User student = dao.getUserById(id);

	    request.setAttribute("student", student);
	    RequestDispatcher rd = request.getRequestDispatcher("edit-student.jsp");
	    rd.forward(request, response);
	}
}
