package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import iCore.dao.TheTVDAOImpl;
import iCore.model.TaiKhoan;
import iCore.model.TheThanhVien;

/**
 * Servlet implementation class DangKyTap
 */
// @WebServlet("/DangKyTap")
public class DangKyTapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TheTVDAOImpl theTVDAOImpl = new TheTVDAOImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		TaiKhoan tk = (TaiKhoan) session.getAttribute("taiKhoanDangNhap");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String maThe = request.getParameter("maThe");
		String ngayTao = request.getParameter("ngayTao");
		String ngayKT = request.getParameter("ngayKT");
		String hsd = request.getParameter("hsd");
		String loaiThe = request.getParameter("loaiThe");
		
		
		String url = "dangkytap.jsp";
		
		try {
			theTVDAOImpl.dangKyThang(new TheThanhVien(maThe, null, null, hsd, loaiThe, new Date(), null));
			url = "/trangchu.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			url = "/dangkytapthang.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	

}
