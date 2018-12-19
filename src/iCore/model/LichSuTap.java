package iCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class LichSuTap {
	@Id
	public String maLST;
	public String tenLST;
	public Date ngayTap;
	public String thoiGianTap;
	public String noiDung;
	public Date thoiGianCapNhat;

	@ManyToOne(fetch = FetchType.EAGER)
	public ThanhVien thanhVien;

	public LichSuTap() {
		// TODO Auto-generated constructor stub
	}

	public LichSuTap(String maLST, String tenLST, Date ngayTap, String thoiGianTap, String noiDung,
			Date thoiGianCapNhat, ThanhVien thanhVien) {
		this.maLST = maLST;
		this.tenLST = tenLST;
		this.ngayTap = ngayTap;
		this.thoiGianTap = thoiGianTap;
		this.noiDung = noiDung;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.thanhVien = thanhVien;
	}

	public String getMaLST() {
		return maLST;
	}

	public void setMaLST(String maLST) {
		this.maLST = maLST;
	}

	public String getTenLST() {
		return tenLST;
	}

	public void setTenLST(String tenLST) {
		this.tenLST = tenLST;
	}

	public Date getNgayTap() {
		return ngayTap;
	}

	public void setNgayTap(Date ngayTap) {
		this.ngayTap = ngayTap;
	}

	public String getThoiGianTap() {
		return thoiGianTap;
	}

	public void setThoiGianTap(String thoiGianTap) {
		this.thoiGianTap = thoiGianTap;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
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
		result = prime * result + ((maLST == null) ? 0 : maLST.hashCode());
		result = prime * result + ((ngayTap == null) ? 0 : ngayTap.hashCode());
		result = prime * result + ((noiDung == null) ? 0 : noiDung.hashCode());
		result = prime * result + ((tenLST == null) ? 0 : tenLST.hashCode());
		result = prime * result + ((thanhVien == null) ? 0 : thanhVien.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((thoiGianTap == null) ? 0 : thoiGianTap.hashCode());
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
		LichSuTap other = (LichSuTap) obj;
		if (maLST == null) {
			if (other.maLST != null)
				return false;
		} else if (!maLST.equals(other.maLST))
			return false;
		if (ngayTap == null) {
			if (other.ngayTap != null)
				return false;
		} else if (!ngayTap.equals(other.ngayTap))
			return false;
		if (noiDung == null) {
			if (other.noiDung != null)
				return false;
		} else if (!noiDung.equals(other.noiDung))
			return false;
		if (tenLST == null) {
			if (other.tenLST != null)
				return false;
		} else if (!tenLST.equals(other.tenLST))
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
		if (thoiGianTap == null) {
			if (other.thoiGianTap != null)
				return false;
		} else if (!thoiGianTap.equals(other.thoiGianTap))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "LichSuTap [maLST=" + maLST + ", tenLST=" + tenLST + ", ngayTap=" + ngayTap + ", thoiGianTap="
				+ thoiGianTap + ", noiDung=" + noiDung + ", thoiGianCapNhat=" + thoiGianCapNhat + ", thanhVien="
				+ thanhVien + "]";
	}

}
