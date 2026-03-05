package com.course.servlets;

import com.course.dao.UserDAO;
import com.course.dto.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ViewStudents")
public class ViewStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    UserDAO dao = new UserDAO();
	    List<User> students = dao.getAllStudents();

	    request.setAttribute("students", students);
	    RequestDispatcher rd = request.getRequestDispatcher("view-students.jsp");
	    rd.forward(request, response);
	}
}
