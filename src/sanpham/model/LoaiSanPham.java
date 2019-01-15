package sanpham.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class LoaiSanPham {
	@Id
	public String maLoai;
	public String tenLoai;
	public Date thoiGianCapNhat;

	public LoaiSanPham() {
		// TODO Auto-generated constructor stub
	}

	public LoaiSanPham(String maLoai, String tenLoai, Date thoiGianCapNhat) {
		this.maLoai = maLoai;
		this.tenLoai = tenLoai;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public String getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}

	public String getTenLoai() {
		return tenLoai;
	}

	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
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
		result = prime * result + ((maLoai == null) ? 0 : maLoai.hashCode());
		result = prime * result + ((tenLoai == null) ? 0 : tenLoai.hashCode());
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
		LoaiSanPham other = (LoaiSanPham) obj;
		if (maLoai == null) {
			if (other.maLoai != null)
				return false;
		} else if (!maLoai.equals(other.maLoai))
			return false;
		if (tenLoai == null) {
			if (other.tenLoai != null)
				return false;
		} else if (!tenLoai.equals(other.tenLoai))
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
		return "LoaiSanPham [maLoai=" + maLoai + ", tenLoai=" + tenLoai + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

}
