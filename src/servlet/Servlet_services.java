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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet_services.doGet()");
		Dao_service servicelist = new Dao_service();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");

		try {		
			
			ArrayList <Services>services = servicelist.haeServices(user.getId());
			request.setAttribute("services", services);	
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/services.jsp");
			dispatcher.forward(request, response);	
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
