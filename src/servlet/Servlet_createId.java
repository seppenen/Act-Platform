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
import dao.Dao_service;
import dao.dao;
import model.Company;
import model.Services;
import model.User;

/**
 * Servlet implementation class Servlet_createId
 */
@WebServlet("/Servlet_createId")
public class Servlet_createId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("servöet_Createid");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");
		
		if(user!=null) {
			
			String param = request.getParameter("param");
			
			if(param.equals("1")) {
							
			Dao_service dao = new Dao_service();
			Services service= new Services();
				
				dao.newServiceID(user, service);
				PrintWriter out = response.getWriter();
			    response.setContentType("text/html"); 			
			    out.println(service.getId());
			}else {
				
				Dao_business dao = new Dao_business();
				Company company= new Company();
					
					dao.newCompanyID(user, company);
					PrintWriter out = response.getWriter();
				    response.setContentType("text/html"); 			
				    out.println(company.getId());
				
			}
			
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
