package iCore.modelDAO;

import iCore.dao.ObjectDAO;
import iCore.model.ThanhVien;

public class DAO_ThanhVien extends ObjectDAO<ThanhVien> {
	public DAO_ThanhVien() {
		this.table = "ThanhVien";
	}
}
