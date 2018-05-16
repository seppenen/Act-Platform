package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.Dao_order;
import dao.Dao_service;
import dao.dao;
import model.Order;
import model.User;

/**
 * Servlet implementation class Servlet_tilaukset
 */
@WebServlet("/Servlet_tilaukset")
public class Servlet_tilaukset extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings({ "null", "unchecked" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet_tilaukset.doGet()");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("session");
		String id = request.getParameter("id");
		dao dao = new dao();
		try {
			String[] sarakkeet = { "id", "title", "start", "status" };
			String strJSON = null;
			if (id == null) {

				strJSON = dao.haeTiedotJSON(sarakkeet, "orders", "user_id", user.getId(), "id");

			} else if (id != null) {

				strJSON = dao.haeTiedotJSON(sarakkeet, "orders", "business_id", id, "id");

			}

			PrintWriter out = response.getWriter();
			response.setContentType("text/html");

			out.println(strJSON);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet_tilaukset.doPost()");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("session");
		String date = request.getParameter("day");
		String service_id = request.getParameter("service_id");
		String business_id = request.getParameter("business_id");
		String name = request.getParameter("name");
		// String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		String starthour = request.getParameter("starthour");
		String min = request.getParameter("min");
		int kesto = Integer.parseInt(request.getParameter("kesto"));
		String message = request.getParameter("message");
		Order order = new Order();
		Dao_order dao_order = new Dao_order();
		Dao_service service = new Dao_service();
		order.setUser_id(user.getId());
		order.setService_id(service_id);

		order.setBusiness_id(business_id);
		order.setTitle(service.haeService(service_id).getTitle());

		order.setDate(date + "T" + starthour + ":" + min);
		order.setEnd(laske(starthour, min, kesto, date));
		order.setStatus("Pending");
		order.setOwner(user.getId());

		order.setPhone(phone);

		order.setMessage(message);

		dao_order.uusiTulaus(order);

		System.out.println(order.toString());

	}

	private static String laske(String start, String min, int kesto, String date) {

		int[] days = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
		int hour = Integer.parseInt(start);
		int minute = Integer.parseInt(min);
		int result = (hour + kesto);
		String res = null;
		String[] daytaulukko = date.split("-");
		int day = Integer.parseInt(daytaulukko[2]);
		int month = Integer.parseInt(daytaulukko[1]);
		String resultmonth = null;
		String resultday = null;

		int j = 0;
		if (result >= 24) {
			int temp = 24 - hour;
			hour = kesto - temp;
			j = 1;

		} else {

			hour = hour + kesto;
		}

		if (hour < 10) {

			res = "0" + hour;

		} else {

			res = String.valueOf(hour);
		}

		if (days[month + 1] == day && hour <= 24 && j == 1) {

			month = (month + 1);
			day = 1;

		}

		if (month < 10) {

			resultmonth = "0" + month;

		} else {

			resultmonth = String.valueOf(month);
		}

		if (day < 10) {

			resultday = "0" + day;

		} else {

			resultday = String.valueOf(day);
		}

		return (daytaulukko[0] + "-" + resultmonth + "-" + resultday + "T" + res + ":" + minute);

	}

}
