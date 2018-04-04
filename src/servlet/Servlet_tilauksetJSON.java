package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao_service;
import dao.dao;
import model.User;

/**
 * Servlet implementation class Servlet_tilaukset
 */
@WebServlet("/Servlet_tilauksetJSON")
public class Servlet_tilauksetJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("Servlet_tilauksetJSON.doGet()");
	HttpSession session = request.getSession();
	User user = (User)session.getAttribute("session");
	Dao_service dao = new Dao_service();
	try {
		
		String[] sarakkeet={"service_id"};
		String strJSON = dao.haeTiedotJSON(sarakkeet,"business_service","owner",user.getId(),"");
		PrintWriter out = response.getWriter(  );
	    response.setContentType("text/html"); 
	    
	    out.println(strJSON);	
		
	} catch (Exception e) {			
		e.printStackTrace();
	} 
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet_tilaukset.doPost()");
		
		

	}

}
