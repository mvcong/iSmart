package iCore.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.JoinColumn;

import org.hibernate.annotations.Type;

@Entity
public class NhomPhanQuyen {
	@Id
	public String maNhomPhanQuyen;
	public String tenNhomPhanQuyen;
	@Type(type = "text")
	public String moTa;
	@Type(type = "text")
	public String ghiChu;
	public Date thoiGianCapNhat;

	@ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	@JoinTable(name = "NhomPhanQuyen_ChucNang", joinColumns = {
			@JoinColumn(name = "maNhomPhanQuyen") }, inverseJoinColumns = { @JoinColumn(name = "maChucNang") })
	public Set<ChucNang> chucNangs = new HashSet<>();

	public NhomPhanQuyen() {
		// TODO Auto-generated constructor stub
	}

	public NhomPhanQuyen(String maNhomPhanQuyen, String tenNhomPhanQuyen, String moTa, String ghiChu,
			Date thoiGianCapNhat) {
		this.maNhomPhanQuyen = maNhomPhanQuyen;
		this.tenNhomPhanQuyen = tenNhomPhanQuyen;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
		
	}

	public String getMaNhomPhanQuyen() {
		return maNhomPhanQuyen;
	}

	public void setMaNhomPhanQuyen(String maNhomPhanQuyen) {
		this.maNhomPhanQuyen = maNhomPhanQuyen;
	}

	public String getTenNhomPhanQuyen() {
		return tenNhomPhanQuyen;
	}

	public void setTenNhomPhanQuyen(String tenNhomPhanQuyen) {
		this.tenNhomPhanQuyen = tenNhomPhanQuyen;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public Date getThoiGianCapNhat() {
		return thoiGianCapNhat;
	}

	public void setThoiGianCapNhat(Date thoiGianCapNhat) {
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public Set<ChucNang> getChucNangs() {
		return chucNangs;
	}

	public void setChucNangs(Set<ChucNang> chucNangs) {
		this.chucNangs = chucNangs;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((maNhomPhanQuyen == null) ? 0 : maNhomPhanQuyen.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((tenNhomPhanQuyen == null) ? 0 : tenNhomPhanQuyen.hashCode());
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
		NhomPhanQuyen other = (NhomPhanQuyen) obj;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maNhomPhanQuyen == null) {
			if (other.maNhomPhanQuyen != null)
				return false;
		} else if (!maNhomPhanQuyen.equals(other.maNhomPhanQuyen))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (tenNhomPhanQuyen == null) {
			if (other.tenNhomPhanQuyen != null)
				return false;
		} else if (!tenNhomPhanQuyen.equals(other.tenNhomPhanQuyen))
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
		return "NhomPhanQuyen [maNhomPhanQuyen=" + maNhomPhanQuyen + ", tenNhomPhanQuyen=" + tenNhomPhanQuyen
				+ ", moTa=" + moTa + ", ghiChu=" + ghiChu + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

}
