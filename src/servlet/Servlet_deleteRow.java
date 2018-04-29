package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao_business;
import dao.Dao_hour;
import dao.Dao_service;
import dao.dao;
import model.Services;
import model.User;

/**
 * Servlet implementation class Servlet_deleteRow
 */
@WebServlet("/Servlet_deleteRow")
public class Servlet_deleteRow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Delete_row()");

		HttpSession session = request.getSession(true);

		User user = (User) session.getAttribute("session");

		String company = request.getParameter("param");
		String id = request.getParameter("id");

		if (user != null) {
			dao dao = new dao();

			try {

				if (company.equals("1")) {
					Dao_service service = new Dao_service();

					if (dao.iftrue("business_id", "business", "business_id", id, "user_id", user.getId())) {
						System.out.println(company + " " + id);
						ArrayList<Services> services = service.haeServices(id);

						if (services != null) {

							for (int i = 0; i < services.size(); i++) {

								dao.rowDelete("hours_service", "service_id", services.get(i).getId(), "user_id",
										user.getId());

							}

							for (int i = 0; i < services.size(); i++) {

								dao.rowDelete("business_service", "service_id", services.get(i).getId(), "user_id",
										user.getId());

							}

						}

						dao.rowDelete("hours", "business_id", id, "user_id", user.getId());

						dao.rowDelete("business", "business_id", id, "user_id", user.getId());
						// dao.rowDelete("hours", "business_id", id,"user_id", user.getId());

					}
				}else {
					dao.rowDelete("hours_service", "service_id", id, "user_id",
							user.getId());
					
					dao.rowDelete("business_service", "service_id", id, "user_id",
							user.getId());
					
				}

			} catch (Exception e) {

				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
