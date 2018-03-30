package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
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
 * Servlet implementation class Servlet_tilaukset
 */
@WebServlet("/Servlet_tilaukset")
public class Servlet_tilaukset extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings({ "null", "unchecked" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet_tilaukset.doGet()");

		String id = request.getParameter("id");

		Dao_order tilaus = new Dao_order();

		try {

			ArrayList<Order> tilaukset = tilaus.haeTilaukset(id);

			request.setAttribute("tilaukset", tilaukset);
			System.out.println(tilaukset.toString());
			request.setAttribute("id", id);
			String jsp = "/dash.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Servlet_tilaukset.doPost()");

	}

}
