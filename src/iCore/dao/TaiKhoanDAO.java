package iCore.dao;

import iCore.model.TaiKhoan;
import iCore.model.TaiKhoanThanhVien;
import iCore.model.ThanhVien;

public interface TaiKhoanDAO {
	public void themTK(TaiKhoanThanhVien tk);
	public TaiKhoanThanhVien getTaiKhoanThanhVien(String maDangNhap);
	public boolean checkMaDangNhap(String maDangNhap); 

}
