package com.course.servlets;

import com.course.dao.UserDAO;
import com.course.dto.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = UserDAO.authenticate(email, password);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user); // 'user' is the User object
			session.setAttribute("role", user.getRole()); // optional
			session.setAttribute("studentId", user.getId()); // for student enrollment

			if ("admin".equals(user.getRole())) {
				//            	HttpSession session = request.getSession();
				// OR "admin"
				response.sendRedirect("admin-dashboard.jsp");
			} else {

				response.sendRedirect("student-dashboard.jsp");
			}
		} else {
			response.getWriter().println("Invalid email or password.");
		}
	}
}