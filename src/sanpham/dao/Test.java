package sanpham.dao;

import sanpham.model.SanPham;

public class Test {
 public static void main(String[] args) {
	SanPhamImpl sanPhamImpl = new SanPhamImpl();
	for(SanPham sp : sanPhamImpl.getListSanPham()) {
		System.out.println(sp.getTenSP());
	}
}
}
