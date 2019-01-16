package sanpham.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.oro.text.regex.Perl5Pattern;

import iCore.dao.MySQLConnUtils;
import sanpham.model.SanPham;

public class SanPhamDAO {
	public ArrayList<SanPham> getListSanPhamByLoaiSanPham(String maLoai) throws ClassNotFoundException, SQLException {
		Connection connection = MySQLConnUtils.getMySQLConnection();
		String sql = "SELECT * FROM sanpham WHERE loaisanpham_maLoai = '" + maLoai + "'";
		PreparedStatement ps = connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<SanPham> list = new ArrayList<>();
		while (rs.next()) {
			SanPham sp = new SanPham();
			sp.setMaSP(rs.getLong("maSP"));
			sp.setTenSP(rs.getString("tenSP"));
			sp.setAnhSP(rs.getString("anhSP"));
			sp.setGiaBan(rs.getLong("giaBan"));
			list.add(sp);
		}
		return list;
	}

	public ArrayList<SanPham> getListAllSanPham() throws ClassNotFoundException, SQLException {
		Connection connection = MySQLConnUtils.getMySQLConnection();
		String sql = "SELECT * FROM sanpham ";
		PreparedStatement ps = connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<SanPham> list = new ArrayList<>();
		while (rs.next()) {
			SanPham sp = new SanPham();
			sp.setMaSP(rs.getLong("maSP"));
			sp.setTenSP(rs.getString("tenSP"));
			sp.setAnhSP(rs.getString("anhSP"));
			sp.setGiaBan(rs.getLong("giaBan"));
			list.add(sp);
		}
		return list;
	}

	public SanPham getSanPham(long maSanPham) throws ClassNotFoundException, SQLException {
		Connection connection = MySQLConnUtils.getMySQLConnection();
		String sql = "SELECT * FROM sanpham  WHERE maSP = '" + maSanPham + "'";
		PreparedStatement ps = connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		SanPham sanPham = new SanPham();
		while (rs.next()) {
			sanPham.setMaSP(rs.getLong("maSP"));
			sanPham.setTenSP(rs.getString("tenSP"));
			sanPham.setAnhSP(rs.getString("anhSP"));
			sanPham.setGiaBan(rs.getLong("giaBan"));
			sanPham.setNgayNhapHang(rs.getDate("ngayNhapHang"));
			sanPham.setHsd(rs.getString("hsd"));
		}
		return sanPham;
	}

	
}
