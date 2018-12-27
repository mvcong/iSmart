package sanpham.model;

import java.util.HashMap;
import java.util.Map;

//Giỏ hàng
public class Cart {
	private HashMap<Long, Item> cartItems;

	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(HashMap<Long, Item> cartItems) {
		this.cartItems = cartItems;
	}

	public HashMap<Long, Item> getCartItems() {
		return cartItems;
	}

	public void setCartItems(HashMap<Long, Item> cartItems) {
		this.cartItems = cartItems;
	}

	// Thêm giỏ hàng(insert to cart)
	public void plusToCart(Long key, Item item) {
		boolean check = cartItems.containsKey(key);
		if (check) {
			int quantity_old = item.getQuantity();
			item.setQuantity(quantity_old + 1);
			cartItems.put(key, item);
		} else {
			cartItems.put(key, item);
		}
	}

	// Tính tổng sản phẩm trong giỏ
	public void subToCart(Long key, Item item) {
		boolean check = cartItems.containsKey(key);
		if (check) {
			int quantity_old = item.getQuantity();
			if (quantity_old <= 1) {
				cartItems.remove(key);
			} else {
				item.setQuantity(quantity_old - 1);
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
		for (Map.Entry<Long, Item> list : cartItems.entrySet()) {
			count += list.getValue().getSanPham().getGiaBan() * list.getValue().getQuantity();
		}
		return count;
	}
}
