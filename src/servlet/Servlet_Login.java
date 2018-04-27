package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao_order;
import dao.Dao_user;
import dao.dao;
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
			
			User user = (User)session.getAttribute("session");
			
			if (user!=null) {
				dao dao=new dao();
				
				try {
					if(dao.iftrue("service_id", "business_service", "temp", "1", "user_id", user.getId())) {
						
						dao.rowDelete("business_service",user.getId());
						
					}
					
					
					if(dao.iftrue("id", "hours_service", "temp", "1", "user_id", user.getId())) {
						
						dao.rowDelete("hours_service",user.getId());
						
					}
					
					
					if(dao.iftrue("business_id", "business", "temp", "1", "user_id", user.getId())) {
						
						dao.rowDelete("business",user.getId());
						
					}
					
					if(dao.iftrue("id", "hours", "temp", "1", "user_id", user.getId())) {
						
						dao.rowDelete("hours",user.getId());
						
					}
					

					
			} catch (Exception e) {
				
				e.printStackTrace();
			}
				
			}
		
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
			
				response.sendRedirect("dash.jsp");	

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
