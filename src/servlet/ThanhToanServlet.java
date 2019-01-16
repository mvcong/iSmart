package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import iCore.model.TaiKhoan;
import iCore.model.TaiKhoanThanhVien;
import sanpham.dao.ChiTietHoaDonDAO;
import sanpham.dao.DonHangDAO;
import sanpham.model.ChiTietDonHang;
import sanpham.model.DonHang;
import sanpham.model.GioHang;
import sanpham.model.SanPhamTrongGio;

/**
 * Servlet implementation class ThanhToanServlet
 */
// @WebServlet("/ThanhToanServlet")
public class ThanhToanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final DonHangDAO donHangDAO = new DonHangDAO();
	private final ChiTietHoaDonDAO chiTietHoaDonDAO = new ChiTietHoaDonDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tenNguoiNhan = request.getParameter("tenNguoiNhan");
		String diaChiNhan = request.getParameter("diaChiNhan");
		String sDTNN = request.getParameter("sDTNN");
		String hinhThucThanhToan = request.getParameter("hinhThucThanhToan");
		HttpSession session = request.getSession();
		GioHang cart = (GioHang) session.getAttribute("cart");
		TaiKhoanThanhVien taiKhoan = (TaiKhoanThanhVien) session.getAttribute("taiKhoan");
		try {
			long maDonHang = new Date().getTime();
			DonHang donHang = new DonHang();
			donHang.setMaDonHang(maDonHang);
			donHang.setTenNguoiNhan(tenNguoiNhan);
			donHang.setDiaChiNhan(diaChiNhan);
			donHang.setsDTNN(sDTNN);
			donHang.setMaDangNhap(taiKhoan.getMaDangNhap());
			donHang.setDate(new Timestamp(new Date().getTime()));
			donHang.setTongTien(cart.totalCart());
			donHang.setHinhThucThanhToan(hinhThucThanhToan);
			donHangDAO.themDonHang(donHang);
//			for (Map.Entry<String, SanPhamTrongGio> list : cart.getCartItems().entrySet()) {
//				chiTietHoaDonDAO.themChiTietDonHang(new ChiTietDonHang(0, maDonHang, list.getValue().getSanPham().getMaSP(),
//								list.getValue().getSanPham().getGiaBan(), list.getValue().getSoLuong()));
//			}
			cart = new GioHang();
			session.setAttribute("cart", cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("/iSmart/trangsanpham.jsp");
	}

}
