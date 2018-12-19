package iCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class PhieuChi {
	@Id
	public String maPC;
	public String tenPC;
	public String thanhPhan;
	public String soLuong;
	public long donGia;
	public long thanhTien;
	public Date ngayTao;
	public Date thoiGianCapNhat;

	@ManyToOne(fetch = FetchType.EAGER)
	public NhanVien nhanVien;

	public PhieuChi() {
		// TODO Auto-generated constructor stub
	}

	public PhieuChi(String maPC, String tenPC, String thanhPhan, String soLuong, long donGia, long thanhTien,
			Date ngayTao, Date thoiGianCapNhat, NhanVien nhanVien) {
		this.maPC = maPC;
		this.tenPC = tenPC;
		this.thanhPhan = thanhPhan;
		this.soLuong = soLuong;
		this.donGia = donGia;
		this.thanhTien = thanhTien;
		this.ngayTao = ngayTao;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.nhanVien = nhanVien;
	}

	public String getMaPC() {
		return maPC;
	}

	public void setMaPC(String maPC) {
		this.maPC = maPC;
	}

	public String getTenPC() {
		return tenPC;
	}

	public void setTenPC(String tenPC) {
		this.tenPC = tenPC;
	}

	public String getThanhPhan() {
		return thanhPhan;
	}

	public void setThanhPhan(String thanhPhan) {
		this.thanhPhan = thanhPhan;
	}

	public String getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}

	public long getDonGia() {
		return donGia;
	}

	public void setDonGia(long donGia) {
		this.donGia = donGia;
	}

	public long getThanhTien() {
		return thanhTien;
	}

	public void setThanhTien(long thanhTien) {
		this.thanhTien = thanhTien;
	}

	public Date getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (donGia ^ (donGia >>> 32));
		result = prime * result + ((maPC == null) ? 0 : maPC.hashCode());
		result = prime * result + ((ngayTao == null) ? 0 : ngayTao.hashCode());
		result = prime * result + ((nhanVien == null) ? 0 : nhanVien.hashCode());
		result = prime * result + ((soLuong == null) ? 0 : soLuong.hashCode());
		result = prime * result + ((tenPC == null) ? 0 : tenPC.hashCode());
		result = prime * result + ((thanhPhan == null) ? 0 : thanhPhan.hashCode());
		result = prime * result + (int) (thanhTien ^ (thanhTien >>> 32));
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
		PhieuChi other = (PhieuChi) obj;
		if (donGia != other.donGia)
			return false;
		if (maPC == null) {
			if (other.maPC != null)
				return false;
		} else if (!maPC.equals(other.maPC))
			return false;
		if (ngayTao == null) {
			if (other.ngayTao != null)
				return false;
		} else if (!ngayTao.equals(other.ngayTao))
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
		if (tenPC == null) {
			if (other.tenPC != null)
				return false;
		} else if (!tenPC.equals(other.tenPC))
			return false;
		if (thanhPhan == null) {
			if (other.thanhPhan != null)
				return false;
		} else if (!thanhPhan.equals(other.thanhPhan))
			return false;
		if (thanhTien != other.thanhTien)
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
		return "PhieuChi [maPC=" + maPC + ", tenPC=" + tenPC + ", thanhPhan=" + thanhPhan + ", soLuong=" + soLuong
				+ ", donGia=" + donGia + ", thanhTien=" + thanhTien + ", ngayTao=" + ngayTao + ", thoiGianCapNhat="
				+ thoiGianCapNhat + ", nhanVien=" + nhanVien + "]";
	}

}
