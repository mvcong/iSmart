package iCore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Type;

@Entity
public class PhieuGiamSatTV {
	@Id
	public String maPGS;
	public String tenPGS;
	public Date ngayBD;
	public Date ngayKT;
	@Type(type = "text")
	public String noiDung;
	public Date thoiGianCapNhat;

	@OneToOne(fetch = FetchType.EAGER)
	public ThanhVien thanhVien;
	@OneToOne(fetch = FetchType.EAGER)
	public NhanVien nhanVien;

	public PhieuGiamSatTV() {
		// TODO Auto-generated constructor stub
	}

	public PhieuGiamSatTV(String maPGS, String tenPGS, Date ngayBD, Date ngayKT, String noiDung, Date thoiGianCapNhat,
			ThanhVien thanhVien, NhanVien nhanVien) {
		this.maPGS = maPGS;
		this.tenPGS = tenPGS;
		this.ngayBD = ngayBD;
		this.ngayKT = ngayKT;
		this.noiDung = noiDung;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.thanhVien = thanhVien;
		this.nhanVien = nhanVien;
	}

	public String getMaPGS() {
		return maPGS;
	}

	public void setMaPGS(String maPGS) {
		this.maPGS = maPGS;
	}

	public String getTenPGS() {
		return tenPGS;
	}

	public void setTenPGS(String tenPGS) {
		this.tenPGS = tenPGS;
	}

	public Date getNgayBD() {
		return ngayBD;
	}

	public void setNgayBD(Date ngayBD) {
		this.ngayBD = ngayBD;
	}

	public Date getNgayKT() {
		return ngayKT;
	}

	public void setNgayKT(Date ngayKT) {
		this.ngayKT = ngayKT;
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
		result = prime * result + ((maPGS == null) ? 0 : maPGS.hashCode());
		result = prime * result + ((ngayBD == null) ? 0 : ngayBD.hashCode());
		result = prime * result + ((ngayKT == null) ? 0 : ngayKT.hashCode());
		result = prime * result + ((nhanVien == null) ? 0 : nhanVien.hashCode());
		result = prime * result + ((noiDung == null) ? 0 : noiDung.hashCode());
		result = prime * result + ((tenPGS == null) ? 0 : tenPGS.hashCode());
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
		PhieuGiamSatTV other = (PhieuGiamSatTV) obj;
		if (maPGS == null) {
			if (other.maPGS != null)
				return false;
		} else if (!maPGS.equals(other.maPGS))
			return false;
		if (ngayBD == null) {
			if (other.ngayBD != null)
				return false;
		} else if (!ngayBD.equals(other.ngayBD))
			return false;
		if (ngayKT == null) {
			if (other.ngayKT != null)
				return false;
		} else if (!ngayKT.equals(other.ngayKT))
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
		if (tenPGS == null) {
			if (other.tenPGS != null)
				return false;
		} else if (!tenPGS.equals(other.tenPGS))
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
		return "PhieuGiamSatTV [maPGS=" + maPGS + ", tenPGS=" + tenPGS + ", ngayBD=" + ngayBD + ", ngayKT=" + ngayKT
				+ ", noiDung=" + noiDung + ", thoiGianCapNhat=" + thoiGianCapNhat + ", thanhVien=" + thanhVien
				+ ", nhanVien=" + nhanVien + "]";
	}

}
