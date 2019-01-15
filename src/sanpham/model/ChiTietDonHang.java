package sanpham.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ChiTietDonHang {
	@Id
	public String maChiTietDonHang;
	public String maDonHang;
	public String maSP;
	public long giaBan;
	public int soLuong;

	public ChiTietDonHang() {
		// TODO Auto-generated constructor stub
	}

	public ChiTietDonHang(String maChiTietDonHang, String maDonHang, String maSP, long giaBan, int soLuong) {
		this.maChiTietDonHang = maChiTietDonHang;
		this.maDonHang = maDonHang;
		this.maSP = maSP;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
	}

	public String getMaChiTietDonHang() {
		return maChiTietDonHang;
	}

	public void setMaChiTietDonHang(String maChiTietDonHang) {
		this.maChiTietDonHang = maChiTietDonHang;
	}

	public String getMaDonHang() {
		return maDonHang;
	}

	public void setMaDonHang(String maDonHang) {
		this.maDonHang = maDonHang;
	}

	public String getMaSP() {
		return maSP;
	}

	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}

	public long getGiaBan() {
		return giaBan;
	}

	public void setGiaBan(long giaBan) {
		this.giaBan = giaBan;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

}
