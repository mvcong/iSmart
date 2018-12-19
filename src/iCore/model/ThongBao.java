package iCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

@Entity
public class ThongBao {
	@Id
	public String maTB;
	public String tenTB;
	public Date ngayTao;
	public String link;
	@Type(type = "text")
	public String noiDung;
	public Date thoiGianCapNhat;

	@ManyToOne(fetch = FetchType.EAGER)
	public NhanVien nhanVien;

	public ThongBao() {
		// TODO Auto-generated constructor stub
	}

	public ThongBao(String maTB, String tenTB, Date ngayTao, String link, String noiDung, Date thoiGianCapNhat,
			NhanVien nhanVien) {
		this.maTB = maTB;
		this.tenTB = tenTB;
		this.ngayTao = ngayTao;
		this.link = link;
		this.noiDung = noiDung;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.nhanVien = nhanVien;
	}

	public String getMaTB() {
		return maTB;
	}

	public void setMaTB(String maTB) {
		this.maTB = maTB;
	}

	public String getTenTB() {
		return tenTB;
	}

	public void setTenTB(String tenTB) {
		this.tenTB = tenTB;
	}

	public Date getNgayTao() {
		return ngayTao;
	}

	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
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
		result = prime * result + ((link == null) ? 0 : link.hashCode());
		result = prime * result + ((maTB == null) ? 0 : maTB.hashCode());
		result = prime * result + ((ngayTao == null) ? 0 : ngayTao.hashCode());
		result = prime * result + ((nhanVien == null) ? 0 : nhanVien.hashCode());
		result = prime * result + ((noiDung == null) ? 0 : noiDung.hashCode());
		result = prime * result + ((tenTB == null) ? 0 : tenTB.hashCode());
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
		ThongBao other = (ThongBao) obj;
		if (link == null) {
			if (other.link != null)
				return false;
		} else if (!link.equals(other.link))
			return false;
		if (maTB == null) {
			if (other.maTB != null)
				return false;
		} else if (!maTB.equals(other.maTB))
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
		if (noiDung == null) {
			if (other.noiDung != null)
				return false;
		} else if (!noiDung.equals(other.noiDung))
			return false;
		if (tenTB == null) {
			if (other.tenTB != null)
				return false;
		} else if (!tenTB.equals(other.tenTB))
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
		return "ThongBao [maTB=" + maTB + ", tenTB=" + tenTB + ", ngayTao=" + ngayTao + ", link=" + link + ", noiDung="
				+ noiDung + ", thoiGianCapNhat=" + thoiGianCapNhat + ", nhanVien=" + nhanVien + "]";
	}

}
