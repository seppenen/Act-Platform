package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.dao;
import model.Services;




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
		
		try {
			
			dao dao = new dao();
		Services service=new Services();
		service.setTitle(request.getParameter("title"));		
		service.setBusiness_id(Integer.parseInt(request.getParameter("business_id")));
		service.setPrice(Integer.parseInt(request.getParameter("updatePrice")));
		service.setTag(request.getParameter("tags"));
		service.setDescription(request.getParameter("updateDescription"));
		if(dao.newService(service)){
			response.sendRedirect("dashboard.jsp");
			System.out.println("Service OK");
		}else{
			response.sendRedirect("dashboard.jsp?ok=0");
			System.out.println("service NOt OK");
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
