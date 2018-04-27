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
import model.Hour;
import model.Services;
import model.User;




/**
 * Servlet implementation class Servlet_newService
 */
@WebServlet("/Servlet_newService")
public class Servlet_newService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet_newService.doPost()");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session");
		
		try {
			String str = request.getParameter("image").trim();
		
		Dao_service dao= new Dao_service();
		Services service=new Services();
		service.setId(request.getParameter("service_id"));
		service.setTitle(request.getParameter("title"));		
		service.setBusiness_id(request.getParameter("business_id"));
		service.setPrice(request.getParameter("price"));
		service.setHour(request.getParameter("hours"));
		service.setOwner(user.getId());
		
		
		service.setImage(str);
		service.setDescription(request.getParameter("description"));
		
		if(dao.updateService(service)) {
			dao.vahvistaTunnit(service);
		
		    
		}else{
			
			System.out.println("Service NO OK");
		}
	
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
