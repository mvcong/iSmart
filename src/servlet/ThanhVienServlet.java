package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import iCore.dao.ThanhVienDAO;
import iCore.model.ThanhVien;

/**
 * Servlet implementation class ThanhVienServlet
 */
@WebServlet("/ThanhVienServlet")
public class ThanhVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ThanhVienDAO thanhVienDAO = new ThanhVienDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		String url = "";
		ThanhVien thanhVien = new ThanhVien();
		HttpSession session = request.getSession();
		switch (command) {
		case "insert":
			thanhVien.setMaTV(request.getParameter("maTV"));
			thanhVien.setTenTV(request.getParameter("tenTV"));
			thanhVien.setEmail(request.getParameter("email"));
			thanhVien.setGioiTinh(request.getParameter("gioiTinh"));
			thanhVien.setsDT(request.getParameter("sDT"));
			thanhVien.setDiaChi(request.getParameter("diaChi"));
			try {
				thanhVienDAO.themThanhVien(thanhVien);
				System.out.println("Đăng ký thành viên thành công!");
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println("Đăng ký thành viên không thành công!");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			break;

		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
