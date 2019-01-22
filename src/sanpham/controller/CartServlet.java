package sanpham.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import sanpham.dao.SanPhamDAO;
import sanpham.model.GioHang;
import sanpham.model.SanPhamTrongGio;
import sanpham.model.SanPham;

/**
 * Servlet implementation class CartServlet
 */

public class CartServlet extends HttpServlet {
	
	private final SanPhamDAO sanPhamDAO = new SanPhamDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		String maSP = request.getParameter("maSP");
		GioHang cart = (GioHang) session.getAttribute("cart");
		

		try {
			long maSanPham = Long.parseLong(maSP);
			SanPham sanPham = sanPhamDAO.getSanPham(maSanPham);
			 switch (command) {
             case "plus":
                 if (cart.getCartItems().containsKey(maSP)) {
                     cart.plusToCart(maSanPham, new SanPhamTrongGio(sanPham,
                             cart.getCartItems().get(maSP).getSoLuong()));
                 } else {
                     cart.plusToCart(maSanPham, new SanPhamTrongGio(sanPham, 1));
                 }
                 break;
             case "remove":
                 cart.removeToCart(maSanPham);
                 break;
         }
     } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("/iSmart/trangsanpham.jsp");
     }
     session.setAttribute("cart", cart);
     response.sendRedirect("/iSmart/trangsanpham.jsp");
	}


}
