package iCore.dao;

import iCore.model.ThanhVien;

public interface TVDAO {
	public void themTV(ThanhVien tv);
	public ThanhVien getThanhVien(int maTV);
	public boolean checkEmail(String email);

}
