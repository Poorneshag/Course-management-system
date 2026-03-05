package com.course.servlets;

import com.course.dao.AdminDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/Admin")
public class AdminLoginServlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/course_db", "root", "penta@123");

            AdminDAO dao = new AdminDAO(conn);
            if (dao.validateAdmin(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", username);
                response.sendRedirect("admin-dashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid credentials");
                RequestDispatcher rd = request.getRequestDispatcher("admin-login.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
