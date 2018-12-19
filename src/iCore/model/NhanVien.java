package iCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class NhanVien {
	@Id
	public String maNV;
	public String tenNV;
	public String gioiTinh;
	public Date ngaySinh;
	public String sDT;
	public String email;
	public String diaChi;
	public Date ngayVaoLam;
	public String bacLuong;
	public String heSo;
	public Date ngayHuong;
	public Date thoiGianCapNhat;

	public NhanVien() {
		// TODO Auto-generated constructor stub
	}

	public NhanVien(String maNV, String tenNV, String gioiTinh, Date ngaySinh, String sDT, String email, String diaChi,
			Date ngayVaoLam, String bacLuong, String heSo, Date ngayHuong, Date thoiGianCapNhat) {
		this.maNV = maNV;
		this.tenNV = tenNV;

		this.gioiTinh = gioiTinh;
		this.ngaySinh = ngaySinh;
		this.sDT = sDT;
		this.email = email;
		this.diaChi = diaChi;
		this.ngayVaoLam = ngayVaoLam;
		this.bacLuong = bacLuong;
		this.heSo = heSo;
		this.ngayHuong = ngayHuong;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public String getMaNV() {
		return maNV;
	}

	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}

	public String getTenNV() {
		return tenNV;
	}

	public void setTenNV(String tenNV) {
		this.tenNV = tenNV;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getsDT() {
		return sDT;
	}

	public void setsDT(String sDT) {
		this.sDT = sDT;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public Date getNgayVaoLam() {
		return ngayVaoLam;
	}

	public void setNgayVaoLam(Date ngayVaoLam) {
		this.ngayVaoLam = ngayVaoLam;
	}

	public String getBacLuong() {
		return bacLuong;
	}

	public void setBacLuong(String bacLuong) {
		this.bacLuong = bacLuong;
	}

	public String getHeSo() {
		return heSo;
	}

	public void setHeSo(String heSo) {
		this.heSo = heSo;
	}

	public Date getNgayHuong() {
		return ngayHuong;
	}

	public void setNgayHuong(Date ngayHuong) {
		this.ngayHuong = ngayHuong;
	}

	public Date getThoiGianCapNhat() {
		return thoiGianCapNhat;
	}

	public void setThoiGianCapNhat(Date thoiGianCapNhat) {
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bacLuong == null) ? 0 : bacLuong.hashCode());
		result = prime * result + ((diaChi == null) ? 0 : diaChi.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((gioiTinh == null) ? 0 : gioiTinh.hashCode());
		result = prime * result + ((heSo == null) ? 0 : heSo.hashCode());

		result = prime * result + ((maNV == null) ? 0 : maNV.hashCode());
		result = prime * result + ((ngayHuong == null) ? 0 : ngayHuong.hashCode());
		result = prime * result + ((ngaySinh == null) ? 0 : ngaySinh.hashCode());
		result = prime * result + ((ngayVaoLam == null) ? 0 : ngayVaoLam.hashCode());
		result = prime * result + ((sDT == null) ? 0 : sDT.hashCode());
		result = prime * result + ((tenNV == null) ? 0 : tenNV.hashCode());
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
		NhanVien other = (NhanVien) obj;
		if (bacLuong == null) {
			if (other.bacLuong != null)
				return false;
		} else if (!bacLuong.equals(other.bacLuong))
			return false;
		if (diaChi == null) {
			if (other.diaChi != null)
				return false;
		} else if (!diaChi.equals(other.diaChi))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gioiTinh == null) {
			if (other.gioiTinh != null)
				return false;
		} else if (!gioiTinh.equals(other.gioiTinh))
			return false;
		if (heSo == null) {
			if (other.heSo != null)
				return false;
		} else if (!heSo.equals(other.heSo))
			return false;

		if (maNV == null) {
			if (other.maNV != null)
				return false;
		} else if (!maNV.equals(other.maNV))
			return false;
		if (ngayHuong == null) {
			if (other.ngayHuong != null)
				return false;
		} else if (!ngayHuong.equals(other.ngayHuong))
			return false;
		if (ngaySinh == null) {
			if (other.ngaySinh != null)
				return false;
		} else if (!ngaySinh.equals(other.ngaySinh))
			return false;
		if (ngayVaoLam == null) {
			if (other.ngayVaoLam != null)
				return false;
		} else if (!ngayVaoLam.equals(other.ngayVaoLam))
			return false;
		if (sDT == null) {
			if (other.sDT != null)
				return false;
		} else if (!sDT.equals(other.sDT))
			return false;
		if (tenNV == null) {
			if (other.tenNV != null)
				return false;
		} else if (!tenNV.equals(other.tenNV))
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
		return "NhanVien [maNV=" + maNV + ", tenNV=" + tenNV + ", gioiTinh=" + gioiTinh + ", ngaySinh=" + ngaySinh
				+ ", sDT=" + sDT + ", email=" + email + ", diaChi=" + diaChi + ", ngayVaoLam=" + ngayVaoLam
				+ ", bacLuong=" + bacLuong + ", heSo=" + heSo + ", ngayHuong=" + ngayHuong + ", thoiGianCapNhat="
				+ thoiGianCapNhat + "]";
	}

}
