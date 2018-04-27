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
		

				
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("Servlet_NewCompany.doPost()");

		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");
		String id = request.getParameter("business_id");
		String name = request.getParameter("name");
		String alias = request.getParameter("alias");
		String phone = request.getParameter("phone");
		String description = request.getParameter("description");
		String address = request.getParameter("address");
		
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		Dao_business dao = new Dao_business();
		Company company = new Company();
		company.setId(id);
		company.setName(name);
		company.setAlias(alias);
		company.setPhone(phone);
		company.setAddress(address);
		company.setDescription(description);
		company.setOwner(user.getId());
		company.setLat(lat);
		company.setLng(lng);
		System.out.println(company.toString());
		try {
			
			if(dao.updateCompany(company)) {
				dao.vahvistaTunnit(company);
				
			
			}else{
				
				System.out.println("Service NO OK");
			}
		} catch (Exception e) {			
			e.printStackTrace();
		} 
		

	}

}
