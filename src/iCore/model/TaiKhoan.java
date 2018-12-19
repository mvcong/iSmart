package iCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public abstract class TaiKhoan {
	@Id
	public String maDangNhap;
	public String matKhau;
	public String anhDaiDien;
	public Date ngayTao;
	public Date ngayCapNhatMatKhau;
	public String loaiTaiKhoan;
	public boolean trangThaiHoatDong;
	public String email;
	public String hoVaTen;
	@Type(type = "text")
	public String moTa;
	@Type(type = "text")
	public String ghiChu;
	public Date thoiGianCapNhat;

	@ManyToOne
	public NhomPhanQuyen nhomPhanQuyen;

	public TaiKhoan() {
		// TODO Auto-generated constructor stub
	}

	public TaiKhoan(String maDangNhap, String matKhau, String anhDaiDien, Date ngayTao, Date ngayCapNhatMatKhau,
			String loaiTaiKhoan, boolean trangThaiHoatDong, String email, String hoVaTen, String moTa, String ghiChu,
			Date thoiGianCapNhat, NhomPhanQuyen nhomPhanQuyen) {
		this.maDangNhap = maDangNhap;
		this.matKhau = matKhau;
		this.anhDaiDien = anhDaiDien;
		this.ngayTao = ngayTao;
		this.ngayCapNhatMatKhau = ngayCapNhatMatKhau;
		this.loaiTaiKhoan = loaiTaiKhoan;
		this.trangThaiHoatDong = trangThaiHoatDong;
		this.email = email;
		this.hoVaTen = hoVaTen;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.nhomPhanQuyen = nhomPhanQuyen;
	}

	public String getMaDangNhap() {
		return maDangNhap;
	}

	public void setMaDangNhap(String maDangNhap) {
		this.maDangNhap = maDangNhap;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getAnhDaiDien() {
		return anhDaiDien;
	}

	public void setAnhDaiDien(String anhDaiDien) {
		this.anhDaiDien = anhDaiDien;
	}

	public Date getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}

	public Date getNgayCapNhatMatKhau() {
		return ngayCapNhatMatKhau;
	}

	public void setNgayCapNhatMatKhau(Date ngayCapNhatMatKhau) {
		this.ngayCapNhatMatKhau = ngayCapNhatMatKhau;
	}

	public String getLoaiTaiKhoan() {
		return loaiTaiKhoan;
	}

	public void setLoaiTaiKhoan(String loaiTaiKhoan) {
		this.loaiTaiKhoan = loaiTaiKhoan;
	}

	public boolean isTrangThaiHoatDong() {
		return trangThaiHoatDong;
	}

	public void setTrangThaiHoatDong(boolean trangThaiHoatDong) {
		this.trangThaiHoatDong = trangThaiHoatDong;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHoVaTen() {
		return hoVaTen;
	}

	public void setHoVaTen(String hoVaTen) {
		this.hoVaTen = hoVaTen;
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

	public NhomPhanQuyen getNhomPhanQuyen() {
		return nhomPhanQuyen;
	}

	public void setNhomPhanQuyen(NhomPhanQuyen nhomPhanQuyen) {
		this.nhomPhanQuyen = nhomPhanQuyen;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((anhDaiDien == null) ? 0 : anhDaiDien.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((hoVaTen == null) ? 0 : hoVaTen.hashCode());
		result = prime * result + ((loaiTaiKhoan == null) ? 0 : loaiTaiKhoan.hashCode());
		result = prime * result + ((maDangNhap == null) ? 0 : maDangNhap.hashCode());
		result = prime * result + ((matKhau == null) ? 0 : matKhau.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((ngayCapNhatMatKhau == null) ? 0 : ngayCapNhatMatKhau.hashCode());
		result = prime * result + ((ngayTao == null) ? 0 : ngayTao.hashCode());
		result = prime * result + ((nhomPhanQuyen == null) ? 0 : nhomPhanQuyen.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + (trangThaiHoatDong ? 1231 : 1237);
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
		TaiKhoan other = (TaiKhoan) obj;
		if (anhDaiDien == null) {
			if (other.anhDaiDien != null)
				return false;
		} else if (!anhDaiDien.equals(other.anhDaiDien))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (hoVaTen == null) {
			if (other.hoVaTen != null)
				return false;
		} else if (!hoVaTen.equals(other.hoVaTen))
			return false;
		if (loaiTaiKhoan == null) {
			if (other.loaiTaiKhoan != null)
				return false;
		} else if (!loaiTaiKhoan.equals(other.loaiTaiKhoan))
			return false;
		if (maDangNhap == null) {
			if (other.maDangNhap != null)
				return false;
		} else if (!maDangNhap.equals(other.maDangNhap))
			return false;
		if (matKhau == null) {
			if (other.matKhau != null)
				return false;
		} else if (!matKhau.equals(other.matKhau))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (ngayCapNhatMatKhau == null) {
			if (other.ngayCapNhatMatKhau != null)
				return false;
		} else if (!ngayCapNhatMatKhau.equals(other.ngayCapNhatMatKhau))
			return false;
		if (ngayTao == null) {
			if (other.ngayTao != null)
				return false;
		} else if (!ngayTao.equals(other.ngayTao))
			return false;
		if (nhomPhanQuyen == null) {
			if (other.nhomPhanQuyen != null)
				return false;
		} else if (!nhomPhanQuyen.equals(other.nhomPhanQuyen))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		if (trangThaiHoatDong != other.trangThaiHoatDong)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TaiKhoan [maDangNhap=" + maDangNhap + ", matKhau=" + matKhau + ", anhDaiDien=" + anhDaiDien
				+ ", ngayTao=" + ngayTao + ", ngayCapNhatMatKhau=" + ngayCapNhatMatKhau + ", loaiTaiKhoan="
				+ loaiTaiKhoan + ", trangThaiHoatDong=" + trangThaiHoatDong + ", email=" + email + ", hoVaTen="
				+ hoVaTen + ", moTa=" + moTa + ", ghiChu=" + ghiChu + ", thoiGianCapNhat=" + thoiGianCapNhat
				+ ", nhomPhanQuyen=" + nhomPhanQuyen + "]";
	}

}
