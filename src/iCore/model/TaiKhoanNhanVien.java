package iCore.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

@Entity
public class TaiKhoanNhanVien extends TaiKhoan {
	@OneToOne(fetch = FetchType.EAGER)
	public NhanVien nhanVien;

	public TaiKhoanNhanVien() {
		// TODO Auto-generated constructor stub
	}

	public TaiKhoanNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
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
		int result = super.hashCode();
		result = prime * result + ((nhanVien == null) ? 0 : nhanVien.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		TaiKhoanNhanVien other = (TaiKhoanNhanVien) obj;
		if (nhanVien == null) {
			if (other.nhanVien != null)
				return false;
		} else if (!nhanVien.equals(other.nhanVien))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TaiKhoanNhanVien [nhanVien=" + nhanVien + "]";
	}

}
