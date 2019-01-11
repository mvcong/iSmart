package iCore.dao;

import iCore.model.TaiKhoan;
import iCore.model.ThanhVien;

public interface TaiKhoanDAO {
	public void themTK(TaiKhoan tk);
	public TaiKhoan getTaiKhoan(String maDangNhap);
	public boolean checkMaDangNhap(String maDangNhap); 

}
