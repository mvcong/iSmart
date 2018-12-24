package iCore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.oro.text.regex.Perl5Pattern;

import sanpham.SanPham;

public class SanPhamDAO {
	public ArrayList<SanPham> getListSanPhamByLoaiSanPham(String maLoai) throws ClassNotFoundException, SQLException {
		Connection connection = MySQLConnUtils.getMySQLConnection();
		String sql = "SELECT * FROM sanpham WHERE loaiSanPham_maLoai = '" + maLoai + "'";
		PreparedStatement ps = connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<SanPham> list = new ArrayList<>();
		while (rs.next()) {
			SanPham sp = new SanPham();
			sp.setMaSP(rs.getString("maSP"));
			sp.setTenSP(rs.getString("tenSP"));
			sp.setAnhSP(rs.getString("anhSP"));
			sp.setGiaSP(rs.getLong("giaSP"));
			sp.setGiaBan(rs.getLong("giaBan"));
			list.add(sp);
		}
		return list;
	}

}
