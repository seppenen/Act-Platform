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
import model.Hour;
import model.Services;
import model.User;

/**
 * Servlet implementation class Servlet_listatunnit
 */
@WebServlet("/Servlet_listatunnit")
public class Servlet_listatunnit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet_listatunnit.doGet()");
		dao dao = new dao();

		String id = request.getParameter("id");
		String param = request.getParameter("param");
		String table = request.getParameter("table");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("session");
		if (user == null) {

			response.sendRedirect("index.jsp");
		}

		try {

			String[] sarakkeet = { "*" };
			String strJSON = dao.haeTiedotJSON(sarakkeet, table, param, id, "");

			PrintWriter out = response.getWriter();
			response.setContentType("text/html");

			out.println(strJSON);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Servlet_listatunnit.doPost()");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String day = request.getParameter("day");
		String id = request.getParameter("id");
		String temp = request.getParameter("temp");
		String s = request.getParameter("s");

		Dao_business dao = new Dao_business();
		Dao_service dao_service = new Dao_service();
		dao jdao = new dao();
		Hour hour = new Hour();
		PrintWriter out = response.getWriter();
	
		try {
			if (s.equals("1")) {
				System.out.println("Servlet_lisäätunnit_Company");
				Company company = dao.haeCompany(id);
				
				company.setOpentime(from);
				company.setClosetime(to);
				company.setDay(day);

				String[] sarakkeet = { "day" };
				String strJSON = jdao.haeTiedotJSON(sarakkeet, "hours", "business_id", id, "");
				if (!strJSON.contains(day)) {
					dao.lisaaTunnit(company, hour, temp);
					out.println(hour.getId());
					
				} else {
					out.println("");
				}

			} else {
				System.out.println("Servlet_lisäätunnit_Service");
				Services service = dao_service.haeService(id);
				service.setFrom(from);
				service.setTo(to);
				service.setDays(day);

				String[] sarakkeet = { "day" };
				String strJSON = jdao.haeTiedotJSON(sarakkeet, "hours_service", "service_id", id, "");
				if (!strJSON.contains(day)) {
					dao_service.lisaaTunnit(service, hour,temp);
					
					out.println(hour.getId());
				} else {
					out.println("");
				}

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
