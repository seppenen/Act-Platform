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

import dao.Dao_service;
import dao.dao;
import model.Services;
import model.User;


@WebServlet("/Servlet_services")
public class Servlet_services extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings({ "null", "unchecked" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet_services.doGet()");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");
		dao dao= new dao();
		try {		
			
			String[] sarakkeet={"service_id","title","picture"};
			String strJSON=dao.haeTiedotJSON(sarakkeet,"business_service","owner",user.getId(),"business_id");	
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html"); 
		    System.out.println(strJSON);
		    out.println(strJSON);		
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
