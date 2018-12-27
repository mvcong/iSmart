package iCore.modelDAO;

import iCore.dao.ObjectDAO;
import sanpham.model.SanPham;

public class DAO_SanPham extends ObjectDAO<SanPham> {
	public DAO_SanPham() {
		this.table = "SanPham";
	}
}
