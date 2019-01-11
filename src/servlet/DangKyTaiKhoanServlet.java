//package servlet;
//
//import java.io.IOException;
//import java.util.Date;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import iCore.dao.TaiKhoanDAOImpl;
//import iCore.model.TaiKhoan;
//import iCore.model.TaiKhoanThanhVien;
//import iCore.model.ThanhVien;
//
///**
// * Servlet implementation class DangKyTaiKhoanServlet
// */
//// @WebServlet("/DangKyTaiKhoanServlet")
//public class DangKyTaiKhoanServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	private TaiKhoanDAOImpl taiKhoanDAOImpl = new TaiKhoanDAOImpl();
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");
//		String maDangNhap = request.getParameter("maDangNhap");
//		String matKhau = request.getParameter("matKhau");		
//		String email = request.getParameter("email");
//		String hoVaTen = request.getParameter("hoVaTen");
//		boolean trangThaiHoatDong = request.isAsyncStarted();
//		String nhomPhanQuyen = request.getParameter("nhomPhanQuyen");
//		
//		String url = "/dangky.jsp";
//
//		String maDangNhap_err = "", email_err = "";
//		if (maDangNhap.equals("") || email.equals("")) {
//			maDangNhap_err += "Vui lòng nhập mã đăng nhập(bắt buộc là định dạng email) !";
//			email_err += "Vui lòng nhập email !";
//		} 
////		else {
////			if (tvdaoImpl.checkEmail(email) == true) {
////				email_err += "Email đã tồn tại!";
////			}
////		}
////		
//		if (maDangNhap_err.length() > 0) {
//			request.setAttribute("maDangNhap_err", maDangNhap_err);
//			request.setAttribute("maDangNhap", maDangNhap);
//		}
//		if (email_err.length() > 0) {
//			request.setAttribute("email_err", email_err);
//			request.setAttribute("email", email);
//		}
//
//		try {
//			if (maDangNhap_err.length() == 0 && email_err.length() == 0) {
//				taiKhoanDAOImpl.themTK(new TaiKhoan(maDangNhap, matKhau, null, null, null, null, 1, email, hoVaTen, null, null, new Date(),"thanhvien"));
//				url = "/trangchu.jsp";
//			} else {
//				url = "/dangky.jsp";
//			}
//			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//			rd.forward(request, response);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//}
