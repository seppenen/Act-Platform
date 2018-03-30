package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.dao;

/**
 * Servlet implementation class Servlet_tilaukset
 */
@WebServlet("/Servlet_tilauksetJSON")
public class Servlet_tilauksetJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("Servlet_tilauksetJSON.doGet()");
	String id= request.getParameter("id");

	try {
		
		String[] sarakkeet={"id", "title","start"};
		String strJSON = dao.haeTiedotJSON(sarakkeet,"orders","business_id",id,0);
		PrintWriter out = response.getWriter(  );
	    response.setContentType("text/html"); 
	    System.out.println(strJSON);
	    out.println(strJSON);	
		
	} catch (Exception e) {			
		e.printStackTrace();
	} 
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet_tilaukset.doPost()");
		
		

	}

}
