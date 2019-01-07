package sanpham.model;

// Chứa sản phẩm và số lượng trong giỏ
public class SanPhamTrongGio {
	private SanPham sanPham;
	private int soLuong;

	public SanPhamTrongGio() {
		// TODO Auto-generated constructor stub
	}

	public SanPhamTrongGio(SanPham sanPham, int soLuong) {
		this.sanPham = sanPham;
		this.soLuong = soLuong;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

}
