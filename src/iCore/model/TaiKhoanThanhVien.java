package iCore.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

@Entity
public class TaiKhoanThanhVien extends TaiKhoan {
	@OneToOne(fetch = FetchType.EAGER)
	public ThanhVien thanhVien;

	public TaiKhoanThanhVien() {
		// TODO Auto-generated constructor stub
	}

	public TaiKhoanThanhVien(ThanhVien thanhVien) {
		this.thanhVien = thanhVien;
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
		int result = super.hashCode();
		result = prime * result + ((thanhVien == null) ? 0 : thanhVien.hashCode());
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
		TaiKhoanThanhVien other = (TaiKhoanThanhVien) obj;
		if (thanhVien == null) {
			if (other.thanhVien != null)
				return false;
		} else if (!thanhVien.equals(other.thanhVien))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TaiKhoanThanhVien [thanhVien=" + thanhVien + "]";
	}

	// public TaiKhoanThanhVien() {
	// // TODO Auto-generated constructor stub
	// }
	//
	// public TaiKhoanThanhVien(ThanhVien thanhVien) {
	// this.thanhVien = thanhVien;
	// }
	//
	// public ThanhVien getThanhVien() {
	// return thanhVien;
	// }
	//
	// public void setThanhVien(ThanhVien thanhVien) {
	// this.thanhVien = thanhVien;
	// }
	//
	// @Override
	// public int hashCode() {
	// final int prime = 31;
	// int result = super.hashCode();
	// result = prime * result + ((thanhVien == null) ? 0 : thanhVien.hashCode());
	// return result;
	// }
	//
	// @Override
	// public boolean equals(Object obj) {
	// if (this == obj)
	// return true;
	// if (!super.equals(obj))
	// return false;
	// if (getClass() != obj.getClass())
	// return false;
	// TaiKhoanThanhVien other = (TaiKhoanThanhVien) obj;
	// if (thanhVien == null) {
	// if (other.thanhVien != null)
	// return false;
	// } else if (!thanhVien.equals(other.thanhVien))
	// return false;
	// return true;
	// }
	//
	// @Override
	// public String toString() {
	// return "TaiKhoanThanhVien [thanhVien=" + thanhVien + "]";
	// }

}
