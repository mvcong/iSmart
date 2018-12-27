package sanpham.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import iCore.model.NhanVien;

@Entity
public class SanPham {
	@Id
	public String maSP;
	public String tenSP;
	public String anhSP;
	public String linkSP;
	public String soLuong;
	public String donVi;
	public Date ngayNhapHang;
	public String hsd;
	public long giaSP;
	public long giaBan;
	public Date thoiGianCapNhat;

	@ManyToOne(fetch = FetchType.EAGER)
	public NhanVien nhanVien;
	@ManyToOne(fetch = FetchType.EAGER)
	public LoaiSanPham loaiSanPham;

	public SanPham() {
		// TODO Auto-generated constructor stub
	}

	

	public SanPham(String maSP, String tenSP, String anhSP, String linkSP, String soLuong, String donVi,
			Date ngayNhapHang, String hsd, long giaSP, long giaBan, Date thoiGianCapNhat, NhanVien nhanVien,
			LoaiSanPham loaiSanPham) {
		this.maSP = maSP;
		this.tenSP = tenSP;
		this.anhSP = anhSP;
		this.linkSP = linkSP;
		this.soLuong = soLuong;
		this.donVi = donVi;
		this.ngayNhapHang = ngayNhapHang;
		this.hsd = hsd;
		this.giaSP = giaSP;
		this.giaBan = giaBan;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.nhanVien = nhanVien;
		this.loaiSanPham = loaiSanPham;
	}



	public String getMaSP() {
		return maSP;
	}

	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public String getAnhSP() {
		return anhSP;
	}

	public void setAnhSP(String anhSP) {
		this.anhSP = anhSP;
	}

	public String getLinkSP() {
		return linkSP;
	}

	public void setLinkSP(String linkSP) {
		this.linkSP = linkSP;
	}

	public String getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}

	public String getDonVi() {
		return donVi;
	}

	public void setDonVi(String donVi) {
		this.donVi = donVi;
	}

	public Date getNgayNhapHang() {
		return ngayNhapHang;
	}

	public void setNgayNhapHang(Date ngayNhapHang) {
		this.ngayNhapHang = ngayNhapHang;
	}

	public String getHsd() {
		return hsd;
	}

	public void setHsd(String hsd) {
		this.hsd = hsd;
	}

	public long getGiaSP() {
		return giaSP;
	}

	public void setGiaSP(long giaSP) {
		this.giaSP = giaSP;
	}
	

	public long getGiaBan() {
		return giaBan;
	}



	public void setGiaBan(long giaBan) {
		this.giaBan = giaBan;
	}



	public Date getThoiGianCapNhat() {
		return thoiGianCapNhat;
	}

	public void setThoiGianCapNhat(Date thoiGianCapNhat) {
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public LoaiSanPham getLoaiSanPham() {
		return loaiSanPham;
	}

	public void setLoaiSanPham(LoaiSanPham loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((anhSP == null) ? 0 : anhSP.hashCode());
		result = prime * result + ((donVi == null) ? 0 : donVi.hashCode());
		result = prime * result + (int) (giaBan ^ (giaBan >>> 32));
		result = prime * result + (int) (giaSP ^ (giaSP >>> 32));
		result = prime * result + ((hsd == null) ? 0 : hsd.hashCode());
		result = prime * result + ((linkSP == null) ? 0 : linkSP.hashCode());
		result = prime * result + ((loaiSanPham == null) ? 0 : loaiSanPham.hashCode());
		result = prime * result + ((maSP == null) ? 0 : maSP.hashCode());
		result = prime * result + ((ngayNhapHang == null) ? 0 : ngayNhapHang.hashCode());
		result = prime * result + ((nhanVien == null) ? 0 : nhanVien.hashCode());
		result = prime * result + ((soLuong == null) ? 0 : soLuong.hashCode());
		result = prime * result + ((tenSP == null) ? 0 : tenSP.hashCode());
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
		SanPham other = (SanPham) obj;
		if (anhSP == null) {
			if (other.anhSP != null)
				return false;
		} else if (!anhSP.equals(other.anhSP))
			return false;
		if (donVi == null) {
			if (other.donVi != null)
				return false;
		} else if (!donVi.equals(other.donVi))
			return false;
		if (giaBan != other.giaBan)
			return false;
		if (giaSP != other.giaSP)
			return false;
		if (hsd == null) {
			if (other.hsd != null)
				return false;
		} else if (!hsd.equals(other.hsd))
			return false;
		if (linkSP == null) {
			if (other.linkSP != null)
				return false;
		} else if (!linkSP.equals(other.linkSP))
			return false;
		if (loaiSanPham == null) {
			if (other.loaiSanPham != null)
				return false;
		} else if (!loaiSanPham.equals(other.loaiSanPham))
			return false;
		if (maSP == null) {
			if (other.maSP != null)
				return false;
		} else if (!maSP.equals(other.maSP))
			return false;
		if (ngayNhapHang == null) {
			if (other.ngayNhapHang != null)
				return false;
		} else if (!ngayNhapHang.equals(other.ngayNhapHang))
			return false;
		if (nhanVien == null) {
			if (other.nhanVien != null)
				return false;
		} else if (!nhanVien.equals(other.nhanVien))
			return false;
		if (soLuong == null) {
			if (other.soLuong != null)
				return false;
		} else if (!soLuong.equals(other.soLuong))
			return false;
		if (tenSP == null) {
			if (other.tenSP != null)
				return false;
		} else if (!tenSP.equals(other.tenSP))
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
		return "SanPham [maSP=" + maSP + ", tenSP=" + tenSP + ", anhSP=" + anhSP + ", linkSP=" + linkSP + ", soLuong="
				+ soLuong + ", donVi=" + donVi + ", ngayNhapHang=" + ngayNhapHang + ", hsd=" + hsd + ", giaSP=" + giaSP
				+ ", giaBan=" + giaBan + ", thoiGianCapNhat=" + thoiGianCapNhat + ", nhanVien=" + nhanVien
				+ ", loaiSanPham=" + loaiSanPham + "]";
	}

}
