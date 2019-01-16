package sanpham.model;

import java.util.HashMap;
import java.util.Map;

//Giỏ hàng
public class GioHang {
	private HashMap<Long, SanPhamTrongGio> cartItems;

	public GioHang() {
		cartItems = new HashMap<>();
	}

	public GioHang(HashMap<Long, SanPhamTrongGio> cartItems) {
		this.cartItems = cartItems;
	}

	public HashMap<Long, SanPhamTrongGio> getCartItems() {
		return cartItems;
	}

	public void setCartItems(HashMap<Long, SanPhamTrongGio> cartItems) {
		this.cartItems = cartItems;
	}

	// Thêm giỏ hàng(insert to cart)
	public void plusToCart(Long key, SanPhamTrongGio item) {
		boolean check = cartItems.containsKey(key);
		if (check) {
			int soLuong_old = item.getSoLuong();
			item.setSoLuong(soLuong_old + 1);
			cartItems.put(key, item);
		} else {
			cartItems.put(key, item);
		}
	}

	// Tính tổng sản phẩm trong giỏ
	public void subToCart(Long key, SanPhamTrongGio item) {
		boolean check = cartItems.containsKey(key);
		if (check) {
			int soLuong_old = item.getSoLuong();
			if (soLuong_old <= 1) {
				cartItems.remove(key);
			} else {
				item.setSoLuong(soLuong_old - 1);
				cartItems.put(key, item);
			}
		}
	}

	// xóa giỏ hàng
	public void removeToCart(Long key) {
		boolean check = cartItems.containsKey(key);
		if (check) {
			cartItems.remove(key);
		}
	}

	// đếm số lượng sản phẩm trong giỏ
	public int countItem() {
		return cartItems.size();
	}

	// tính tổng
	public double totalCart() {
		int count = 0;
		// count = giaBan * quantity
		for (Map.Entry<Long, SanPhamTrongGio> list : cartItems.entrySet()) {
			count += list.getValue().getSanPham().getGiaBan() * list.getValue().getSoLuong();
		}
		return count;
	}
}
