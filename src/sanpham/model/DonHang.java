package sanpham.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class DonHang {
	@Id
	public String maDonHang;
	public String maDangNhap;
	public String tenNguoiNhan;
	public String diaChiNhan;
	public String sDTNN;
	public long tongTien;
	public String hinhThucThanhToan;
	public Timestamp date;

	public DonHang() {
		// TODO Auto-generated constructor stub
	}

	public DonHang(String maDonHang, String maDangNhap, String tenNguoiNhan, String diaChiNhan, String sDTNN,
			long tongTien, String hinhThucThanhToan, Timestamp date) {
		this.maDonHang = maDonHang;
		this.maDangNhap = maDangNhap;
		this.tenNguoiNhan = tenNguoiNhan;
		this.diaChiNhan = diaChiNhan;
		this.sDTNN = sDTNN;
		this.tongTien = tongTien;
		this.hinhThucThanhToan = hinhThucThanhToan;
		this.date = date;
	}

	public String getMaDonHang() {
		return maDonHang;
	}

	public void setMaDonHang(String maDonHang) {
		this.maDonHang = maDonHang;
	}

	public String getMaDangNhap() {
		return maDangNhap;
	}

	public void setMaDangNhap(String maDangNhap) {
		this.maDangNhap = maDangNhap;
	}

	public String getTenNguoiNhan() {
		return tenNguoiNhan;
	}

	public void setTenNguoiNhan(String tenNguoiNhan) {
		this.tenNguoiNhan = tenNguoiNhan;
	}

	public String getDiaChiNhan() {
		return diaChiNhan;
	}

	public void setDiaChiNhan(String diaChiNhan) {
		this.diaChiNhan = diaChiNhan;
	}

	public String getsDTNN() {
		return sDTNN;
	}

	public void setsDTNN(String sDTNN) {
		this.sDTNN = sDTNN;
	}

	public long getTongTien() {
		return tongTien;
	}

	public void setTongTien(long tongTien) {
		this.tongTien = tongTien;
	}

	public String getHinhThucThanhToan() {
		return hinhThucThanhToan;
	}

	public void setHinhThucThanhToan(String hinhThucThanhToan) {
		this.hinhThucThanhToan = hinhThucThanhToan;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

}
