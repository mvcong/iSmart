package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import iCore.dao.ThanhVienDAO;

/**
 * Servlet implementation class CheckEmailServlet
 */

public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ThanhVienDAO thanhVienDAO = new ThanhVienDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		try {
			if (thanhVienDAO.checkEmail(request.getParameter("email"))) {
			    response.getWriter().write("<img src=\"img/not-available.png\" />");
			} else {
			    response.getWriter().write("<img src=\"img/available.png\" />");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
