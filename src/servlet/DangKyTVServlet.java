package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import iCore.dao.TVDAOImpl;
import iCore.model.ThanhVien;
import tools.SendMail;


/**
 * Servlet implementation class DangKyServlet
 */
public class DangKyTVServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TVDAOImpl tvdaoImpl = new TVDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String maTV = request.getParameter("maTV");
		String tenTV = request.getParameter("tenTV");
		String gioiTinh = request.getParameter("gioiTinh");		
		String sDT = request.getParameter("sDT");
		String email = request.getParameter("email");
		String diaChi = request.getParameter("diaChi");

		String url = "/dangky.jsp";

		String tenTV_err = "", email_err = "";
		if (tenTV.equals("") || email.equals("")) {
			tenTV_err += "Vui lòng nhập họ tên !";
			email_err += "Vui lòng nhập email !";
		} 
//		else {
//			if (tvdaoImpl.checkEmail(email) == true) {
//				email_err += "Email đã tồn tại!";
//			}
//		}
//		
		if (tenTV_err.length() > 0) {
			request.setAttribute("tenTV_err", tenTV_err);
			request.setAttribute("tenTV", tenTV);
		}
		if (email_err.length() > 0) {
			request.setAttribute("email_err", email_err);
			request.setAttribute("email", email);
		}

		try {
			ThanhVien tv = new ThanhVien();
			if (tenTV_err.length() == 0 && email_err.length() == 0) {
				tvdaoImpl.themTV(new ThanhVien(maTV, tenTV, gioiTinh, sDT, email, diaChi, new Date()));
				SendMail sm = new SendMail();
				sm.sendMail("ilov3you365@gmail.com", "Đăng ký thành viên", "Chào Admin, vừa có một khách hàng đăng ký thành viên ");
				url = "/trangchu.jsp";
			} else {
				url = "/dangky.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
