package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.Dao_business;
import model.User;

/**
 * Servlet implementation class Servlet_poistaTunti
 */
@WebServlet("/Servlet_poistaTunti")
public class Servlet_poistaTunti extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet_PoistaTunti.doGet()");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");
		if(user == null) {
			
			response.sendRedirect("index.jsp");			
		}
		String id = request.getParameter("id");
	
		Dao_business dao = new Dao_business();
		try {
			if(dao.poistaTunti(id)) {
				
				PrintWriter out = response.getWriter();
			    response.setContentType("text/html"); 
			   
			    out.println("1");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
