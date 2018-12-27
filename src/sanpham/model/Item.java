package sanpham.model;

// Chứa sản phẩm và số lượng trong giỏ
public class Item {
	private SanPham sanPham;
	private int quantity;

	public Item() {
		// TODO Auto-generated constructor stub
	}

	public Item(SanPham sanPham, int quantity) {
		this.sanPham = sanPham;
		this.quantity = quantity;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
