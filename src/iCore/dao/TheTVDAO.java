package iCore.dao;

import iCore.model.ThanhVien;
import iCore.model.TheThanhVien;

public interface TheTVDAO {
	public void dangKyThang(TheThanhVien ttv);
	public void dangKyNgay(TheThanhVien ttv);
	public TheThanhVien getTheThanhVien(String maThe);
}
