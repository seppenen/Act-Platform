package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao_business;
import dao.Dao_service;
import dao.Dao_user;
import dao.dao;
import model.Company;
import model.Services;
import model.User;

/**
 * Servlet implementation class editService
 */
@WebServlet("/Servlet_editService")
public class Servlet_editService extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet_editService.doGet()");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");
		String id = request.getParameter("id");
		 if (user!=null) {
			 
			 dao dao = new dao();
			 
			 try {
				if(dao.iftrue("service_id", "business_service", "service_id", id, "business_id", user.getId()) || user.getStatus()==1) {
					 
					
					
					Dao_service dao_service= new Dao_service();
					
					Services service = dao_service.haeService(id);
					request.setAttribute("service", service);
				
					String jsp = "/editService.jsp"; 
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
					dispatcher.forward(request, response);	
					 
				 }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 }else {
				 
				 response.sendRedirect("index.jsp");
			 }
		 
		 
	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		System.out.println("Servlet_editService.doPost()");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");
		
		try {
			String str = request.getParameter("image").trim();
	
		Dao_service dao= new Dao_service();
		Services service=new Services();
		service.setTitle(request.getParameter("title"));		
		service.setId(request.getParameter("service_id"));
		service.setPrice(request.getParameter("price"));
		service.setOwner(user.getId());	
		service.setImage(str);
		service.setHour(request.getParameter("hour"));
		service.setDescription(request.getParameter("description"));
		
		if(dao.updateService(service)) {
			
			System.out.println("Service update OK");
		}else{
			
			System.out.println("Service NO OK");
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	
	}

}
