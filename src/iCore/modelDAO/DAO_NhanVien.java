package iCore.modelDAO;

import iCore.dao.ObjectDAO;
import iCore.model.NhanVien;

public class DAO_NhanVien extends ObjectDAO<NhanVien> {
	public DAO_NhanVien() {
		this.table = "NhanVien";
	}
}
