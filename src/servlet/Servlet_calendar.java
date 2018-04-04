package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.dao;
import model.User;

/**
 * Servlet implementation class Servlet_calendar
 */
@WebServlet("/Servlet_calendar")
public class Servlet_calendar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");

		dao dao= new dao();

		try {

			String[] sarakkeet={"title","id","start","end"};
			String strJSON=dao.haeTiedotJSON(sarakkeet,"orders","owner",user.getId(),"id");	
	
			PrintWriter out = response.getWriter();
		    response.setContentType("text/html"); 
		
		    out.println(strJSON);
		    System.out.println("Calndar: "+ strJSON);

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
