package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao_order;
import model.Order;

/**
 * Servlet implementation class Servlet_tilastoJson
 */
@WebServlet("/Servlet_tilastoJson")
public class Servlet_tilastoJson extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet_tilastoJson");
		String id = request.getParameter("id");
		int length = 6;
		if (request.getParameter("length") != null) {

			length = Integer.parseInt(request.getParameter("length"));
		}
		String taulukko[] = new String[length];
		int result[] = new int[length];
		ArrayList<String> tilasto = null;
		Dao_order tilaus = new Dao_order();
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, 1);
		int z = 0;
		for (int i = taulukko.length; i > 0; i--) {

			cal.add(Calendar.DATE, -1);
			date = cal.getTime();
			taulukko[z] = format1.format(date);
			z++;
		}
		try {
			ArrayList<Order> tilaukset = tilaus.haeTilaukset(id);

			if (tilaukset != null) {
				tilasto = tilaus.haeTilauksetJson(id);
			}
			if (tilasto.size() > 0) {

				for (int j = 0; j < taulukko.length; j++) {
					int q = 0;
					System.out.println(taulukko[j] + " check date");
					for (int i = 0; i < tilasto.size(); i++) {

						if (taulukko[j].equals(tilasto.get(i).toString().substring(0, 10))) {
							q++;

							result[j] = q;
						}

					}
				}
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");

				for (int i = 0; i < result.length; i++) {

					out.print(result[i]);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
