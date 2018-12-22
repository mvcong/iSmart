package iCore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sanpham.LoaiSanPham;
import sanpham.SanPham;


public class LoaiSanPhamDAO {
	public ArrayList <LoaiSanPham> getListLoaiSanPham() throws SQLException, ClassNotFoundException{
		Connection connection = MySQLConnUtils.getMySQLConnection();
		String sql  = "SELECT * FROM loaisanpham";
		PreparedStatement ps  = connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<LoaiSanPham> list = new ArrayList<>();
		while (rs.next()) {
			LoaiSanPham loaiSanPham = new LoaiSanPham();
			loaiSanPham.setMaLoai(rs.getString("maLoai"));
			loaiSanPham.setTenLoai(rs.getString("tenLoai"));
			list.add(loaiSanPham);
			
		}
		return list;
	}
	
	
}
