package sanpham.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import iCore.dao.MySQLConnUtils;
import sanpham.model.ChiTietDonHang;

public class ChiTietHoaDonDAO {
	public void themChiTietDonHang(ChiTietDonHang chiTietDonHang) throws ClassNotFoundException, SQLException {
		Connection connection = MySQLConnUtils.getMySQLConnection();
		String sql = "INSERT INTO chitietdonhang VALUES(?,?,?,?,?)";
		PreparedStatement ps = connection.prepareCall(sql);
		ps.setString(1, chiTietDonHang.getMaChiTietDonHang());
		ps.setString(2, chiTietDonHang.getMaDonHang());
		ps.setString(3, chiTietDonHang.getMaSP());
		ps.setLong(4, chiTietDonHang.getGiaBan());
		ps.setInt(5, chiTietDonHang.getSoLuong());
		ps.executeUpdate();
	}
}
