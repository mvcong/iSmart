package sanpham.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sanpham.model.ListGioHang;

/**
 * Servlet implementation class GioHang_Controller
 */

public class GioHang_Controller extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String strAction = request.getParameter("action");

	        if (strAction != null && !strAction.equals("")) {
	            if (strAction.equals("add")) {
	                addToCart(request);
	            } else if (strAction.equals("Update")) {
	                updateCart(request);
	            } else if (strAction.equals("Delete")) {
	                deleteCart(request);
	            }
	        }
	        response.sendRedirect("giohang.jsp");
	}
	
	protected void deleteCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String strItemIndex = request.getParameter("itemIndex");
        ListGioHang listGioHang = null;

        Object objListGioHang = session.getAttribute("cart");
        if (objListGioHang != null) {
        	listGioHang = (ListGioHang) objListGioHang;
        } else {
        	listGioHang = new ListGioHang();
        }
        listGioHang.xoaSoLuongSanPhamTrongGio(strItemIndex);
    }
	protected void updateCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String strSoLuong = request.getParameter("soLuong");
        String strItemIndex = request.getParameter("itemIndex");

        ListGioHang listGioHang = null;

        Object objListGioHang = session.getAttribute("cart");
        if (objListGioHang != null) {
        	listGioHang = (ListGioHang) objListGioHang;
        } else {
        	listGioHang = new ListGioHang();
        }
        listGioHang.updateSoLuongSanPhamTrongGio(strItemIndex, strSoLuong);
    }
	 protected void addToCart(HttpServletRequest request) {
	        HttpSession session = request.getSession();
	        String strTenSP = request.getParameter("tenSP");
	        String strGiaSP = request.getParameter("giaSP");
	        String strSoLuong = request.getParameter("soLuong");
	        String strThanhTien = request.getParameter("thanhTien");

	        ListGioHang listGioHang = null;

	        Object objListGioHang = session.getAttribute("cart");

	        if (objListGioHang != null) {
	        	listGioHang = (ListGioHang) objListGioHang;
	        } else {
	        	listGioHang = new ListGioHang();
	            session.setAttribute("cart", listGioHang);
	        }

	        listGioHang.themSanPhamVaoGio(strTenSP,strGiaSP,strSoLuong,strThanhTien);
	    }
}
