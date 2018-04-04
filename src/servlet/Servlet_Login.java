package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao_order;
import dao.Dao_user;
import model.Order;
import model.User;

/**
 * Servlet implementation class Login
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet_login.doPost()");
		Dao_user dao = new Dao_user();
		

		String email = (request.getParameter("inputEmail"));
		String password = (request.getParameter("inputPassword"));
		
		System.out.println(email+password);
		try {
			User user = dao.haeAsiakas(email, password);
			
			if (user != null) {
				
				Dao_order tilaus = new Dao_order();
				ArrayList<Order> tilaukset = tilaus.haeTilaukset(user.getId());

				HttpSession session = request.getSession(true);
				session.setAttribute("session", user);
				request.setAttribute("tilaukset", tilaukset);
			
				request.getRequestDispatcher("/dash.jsp").forward(request, response);


			} else {
				request.setAttribute("errMsg", "Invalid login cidentials");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
