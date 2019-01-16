package sanpham.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import iCore.dao.MySQLConnUtils;
import sanpham.model.ChiTietDonHang;
import sanpham.model.DonHang;

public class ChiTietHoaDonDAO {
	public void themChiTietDonHang(ChiTietDonHang chiTietDonHang) throws ClassNotFoundException, SQLException {
		Connection connection = MySQLConnUtils.getMySQLConnection();
		String sql = "INSERT INTO chitietdonhang VALUES(?,?,?,?,?)";
		PreparedStatement ps = connection.prepareCall(sql);
		ps.setLong(1, chiTietDonHang.getMaChiTietDonHang());
		ps.setLong(2, chiTietDonHang.getGiaBan());
		ps.setLong(3, chiTietDonHang.getMaDonHang());
		ps.setString(4, chiTietDonHang.getMaSP());
		ps.setInt(5, chiTietDonHang.getSoLuong());
		ps.executeUpdate();
	}
}
