package iCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class TheThanhVien {
	@Id
	public String maThe;
	public Date ngayTao;
	public Date ngayKT;
	public String hsd;
	public String loaiThe;
	public Date thoiGianCapNhat;

	@OneToOne(fetch = FetchType.EAGER)
	public ThanhVien thanhVien;

	public TheThanhVien() {
		// TODO Auto-generated constructor stub
	}

	public TheThanhVien(String maThe, Date ngayTao, Date ngayKT, String hsd, String loaiThe, Date thoiGianCapNhat,
			ThanhVien thanhVien) {
		this.maThe = maThe;
		this.ngayTao = ngayTao;
		this.ngayKT = ngayKT;
		this.hsd = hsd;
		this.loaiThe = loaiThe;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.thanhVien = thanhVien;
	}

	public String getMaThe() {
		return maThe;
	}

	public void setMaThe(String maThe) {
		this.maThe = maThe;
	}

	public Date getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}

	public Date getNgayKT() {
		return ngayKT;
	}

	public void setNgayKT(Date ngayKT) {
		this.ngayKT = ngayKT;
	}

	public String getHsd() {
		return hsd;
	}

	public void setHsd(String hsd) {
		this.hsd = hsd;
	}

	public String getLoaiThe() {
		return loaiThe;
	}

	public void setLoaiThe(String loaiThe) {
		this.loaiThe = loaiThe;
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
		result = prime * result + ((hsd == null) ? 0 : hsd.hashCode());
		result = prime * result + ((loaiThe == null) ? 0 : loaiThe.hashCode());
		result = prime * result + ((maThe == null) ? 0 : maThe.hashCode());
		result = prime * result + ((ngayKT == null) ? 0 : ngayKT.hashCode());
		result = prime * result + ((ngayTao == null) ? 0 : ngayTao.hashCode());
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
		TheThanhVien other = (TheThanhVien) obj;
		if (hsd == null) {
			if (other.hsd != null)
				return false;
		} else if (!hsd.equals(other.hsd))
			return false;
		if (loaiThe == null) {
			if (other.loaiThe != null)
				return false;
		} else if (!loaiThe.equals(other.loaiThe))
			return false;
		if (maThe == null) {
			if (other.maThe != null)
				return false;
		} else if (!maThe.equals(other.maThe))
			return false;
		if (ngayKT == null) {
			if (other.ngayKT != null)
				return false;
		} else if (!ngayKT.equals(other.ngayKT))
			return false;
		if (ngayTao == null) {
			if (other.ngayTao != null)
				return false;
		} else if (!ngayTao.equals(other.ngayTao))
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
		return "TheThanhVien [maThe=" + maThe + ", ngayTao=" + ngayTao + ", ngayKT=" + ngayKT + ", hsd=" + hsd
				+ ", loaiThe=" + loaiThe + ", thoiGianCapNhat=" + thoiGianCapNhat + ", thanhVien=" + thanhVien + "]";
	}

}
