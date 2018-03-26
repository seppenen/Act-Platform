package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.dao;
import model.User;

/**
 * Servlet implementation class Servlet_Login
 */
@WebServlet("/Servlet_Login")
public class Servlet_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Servlet_login.doGet()");
		if (request.getParameter("out") != null) {
			HttpSession session = request.getSession(true);
			session.removeAttribute("session");
			response.sendRedirect("index.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet_login.doPost()");
		dao dao = new dao();

		HttpSession session = request.getSession(true);
		
		String username = (request.getParameter("username"));
		String password = (request.getParameter("password"));
		try {
			if (dao.dataCheck("username", "users", "username", username, "password", password)) {
				User user = dao.loginData(username);
				session.setAttribute("session", user);
				response.sendRedirect("main.jsp");

			} else {
				request.setAttribute("errMsg", "invalid login cidentials");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
