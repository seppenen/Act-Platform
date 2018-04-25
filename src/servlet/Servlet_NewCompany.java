package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao_business;
import dao.Dao_user;
import model.Company;
import model.User;



/**
 * Servlet implementation class Servlet_uusirestaurant
 */
@WebServlet("/Servlet_NewCompany")
public class Servlet_NewCompany extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Servlet_NewCompany.doGet()");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");
		 if (user!=null) {
			 
			 Dao_user dao = new Dao_user();
			 
			 if(dao.haeCompany(user)) {
				 
				 Dao_business dao_business = new Dao_business();
				  
				 String id = request.getParameter("id");
				 try {
					 Company company =dao_business.haeCompany(id);
					System.out.println(id + " " + company.toString());	
					 request.setAttribute("company", company);
					 String jsp = "/newCompanyHours.jsp"; 
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
						dispatcher.forward(request, response);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			 }
			 
			 
			 
		 }
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("Servlet_NewCompany.doPost()");

		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");
		String name = request.getParameter("name");
		String alias = request.getParameter("alias");
		String phone = request.getParameter("phone");
		String description = request.getParameter("description");
		String address = request.getParameter("address");
		
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		Dao_business dao = new Dao_business();
		Company company = new Company();
		
		company.setName(name);
		company.setAlias(alias);
		company.setPhone(phone);
		company.setAddress(address);
		company.setDescription(description);
		company.setOwner(user.getId());
		company.setLat(lat);
		company.setLng(lng);
		try {
			
			if(dao.newCompany(company)) {
				
				PrintWriter out = response.getWriter();
			    response.setContentType("text/html"); 
			
			    out.println(company.getId());
			}
			
		} catch (Exception e) {			
			e.printStackTrace();
		} 
		

	}

}
