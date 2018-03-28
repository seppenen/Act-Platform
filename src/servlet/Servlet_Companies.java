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

import dao.Dao_user;
import dao.dao;
import model.User;

/**
 * Servlet implementation class Servlet_ravintolat
 */
@WebServlet("/Servlet_Companies")
public class Servlet_Companies extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet_Companies.doGet()");
		dao dao = new dao();
		Dao_user dao_user= new Dao_user(); 
		User user= dao_user.haeAsiakas(request.getParameter("user"));

		
		try {		
			String[] sarakkeet={"business_id","business_name"};
			@SuppressWarnings("static-access")
			String strJSON=dao.haeTiedotJSON(sarakkeet,"business","user_id",String.valueOf(user.getId()),0);	
			if(user.getStatus()==1) 	
			strJSON=dao.haeTiedotJSON(sarakkeet,"business","","",0);		
			PrintWriter out = response.getWriter();
		    response.setContentType("text/html"); 
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
