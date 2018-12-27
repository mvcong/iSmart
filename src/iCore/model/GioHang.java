package iCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import sanpham.model.SanPham;

@Entity
public class GioHang {
	@Id
	public String maGioHang;
	public String tenSP;
	public long giaSP;
	public int soLuong;
	public long thanhTien;
	public Date thoiGianCapNhat;

	@ManyToOne(fetch = FetchType.EAGER)
	public ThanhVien thanhVien;

	public GioHang() {
		// TODO Auto-generated constructor stub
	}

	public GioHang(String maGioHang, String tenSP, long giaSP, int soLuong, long thanhTien, Date thoiGianCapNhat,
			ThanhVien thanhVien) {
		this.maGioHang = maGioHang;
		this.tenSP = tenSP;
		this.giaSP = giaSP;
		this.soLuong = soLuong;
		this.thanhTien = thanhTien;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.thanhVien = thanhVien;
	}

	public String getMaGioHang() {
		return maGioHang;
	}

	public void setMaGioHang(String maGioHang) {
		this.maGioHang = maGioHang;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public long getGiaSP() {
		return giaSP;
	}

	public void setGiaSP(long giaSP) {
		this.giaSP = giaSP;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public long getThanhTien() {
		return thanhTien;
	}

	public void setThanhTien(long thanhTien) {
		this.thanhTien = thanhTien;
	}

	public Date getThoiGianCapNhat() {
		return thoiGianCapNhat;
	}

	public void setThoiGianCapNhat(Date thoiGianCapNhat) {
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public ThanhVien getThanhVien() {
		return thanhVien;
	}

	public void setThanhVien(ThanhVien thanhVien) {
		this.thanhVien = thanhVien;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (giaSP ^ (giaSP >>> 32));
		result = prime * result + ((maGioHang == null) ? 0 : maGioHang.hashCode());
		result = prime * result + soLuong;
		result = prime * result + ((tenSP == null) ? 0 : tenSP.hashCode());
		result = prime * result + (int) (thanhTien ^ (thanhTien >>> 32));
		result = prime * result + ((thanhVien == null) ? 0 : thanhVien.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GioHang other = (GioHang) obj;
		if (giaSP != other.giaSP)
			return false;
		if (maGioHang == null) {
			if (other.maGioHang != null)
				return false;
		} else if (!maGioHang.equals(other.maGioHang))
			return false;
		if (soLuong != other.soLuong)
			return false;
		if (tenSP == null) {
			if (other.tenSP != null)
				return false;
		} else if (!tenSP.equals(other.tenSP))
			return false;
		if (thanhTien != other.thanhTien)
			return false;
		if (thanhVien == null) {
			if (other.thanhVien != null)
				return false;
		} else if (!thanhVien.equals(other.thanhVien))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "GioHang [maGioHang=" + maGioHang + ", tenSP=" + tenSP + ", giaSP=" + giaSP + ", soLuong=" + soLuong
				+ ", thanhTien=" + thanhTien + ", thoiGianCapNhat=" + thoiGianCapNhat + ", thanhVien=" + thanhVien
				+ "]";
	}

}
