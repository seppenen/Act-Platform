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
 * Servlet implementation class Servlet_tilaukset
 */
@WebServlet("/Servlet_tilaukset")
public class Servlet_tilaukset extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings({ "null", "unchecked" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet_tilaukset.doGet()");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");
		dao dao= new dao();
		try {
			String[] sarakkeet={"id","title","start","status"};
			String strJSON=dao.haeTiedotJSON(sarakkeet,"orders","owner",user.getId(),"id");	
	
			PrintWriter out = response.getWriter();
		    response.setContentType("text/html"); 
		
		    out.println(strJSON);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet_tilaukset.doPost()");

	}

}
