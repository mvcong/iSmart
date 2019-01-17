package sanpham.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ChiTietDonHang {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	public long maChiTietDonHang;
	public long maDonHang;
	public Long maSP;
	public long giaBan;
	public int soLuong;

	public ChiTietDonHang() {
		// TODO Auto-generated constructor stub
	}

	public ChiTietDonHang(long maChiTietDonHang, long maDonHang, Long maSP, long giaBan, int soLuong) {
		this.maChiTietDonHang = maChiTietDonHang;
		this.maDonHang = maDonHang;
		this.maSP = maSP;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
	}

	public long getMaChiTietDonHang() {
		return maChiTietDonHang;
	}

	public void setMaChiTietDonHang(long maChiTietDonHang) {
		this.maChiTietDonHang = maChiTietDonHang;
	}

	public long getMaDonHang() {
		return maDonHang;
	}

	public void setMaDonHang(long maDonHang) {
		this.maDonHang = maDonHang;
	}

	public Long getMaSP() {
		return maSP;
	}

	public void setMaSP(Long maSP) {
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
