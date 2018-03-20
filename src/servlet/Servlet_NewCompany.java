package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.dao;
import model.Company;



/**
 * Servlet implementation class Servlet_uusirestaurant
 */
@WebServlet("/Servlet_NewCompany")
public class Servlet_NewCompany extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("Servlet_NewCompany.doPost()");
		try {
			
		dao dao = new dao();
		Company company = new Company();	
		System.out.println();
		company.setLat(request.getParameter("lat"));
		company.setLng(request.getParameter("lng"));
		company.setName(request.getParameter("newCompany"));
		company.setOwner(request.getParameter("user"));
		
		if(dao.newCompany(company)){
			response.sendRedirect("dashboard.jsp");
			System.out.println("Company OK");
		}else{
			response.sendRedirect("dashboard.jsp?ok=0");
			System.out.println("Company NO OK");
		}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
