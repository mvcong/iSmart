package sanpham.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import iCore.dao.MySQLConnUtils;
import sanpham.model.DonHang;

public class DonHangDAO {
	public void themDonHang(DonHang donHang) throws ClassNotFoundException, SQLException {
		Connection connection = MySQLConnUtils.getMySQLConnection();
		String sql = "INSERT INTO donhang VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = connection.prepareCall(sql);
		ps.setLong(1, donHang.getMaDonHang());
		ps.setTimestamp(2, donHang.getDate());
		ps.setString(3, donHang.getDiaChiNhan());
		ps.setString(4, donHang.getHinhThucThanhToan());
		ps.setString(5, donHang.getMaDangNhap());
		ps.setString(6, donHang.getsDTNN());
		ps.setString(7, donHang.getTenNguoiNhan());
		ps.setDouble(8, donHang.getTongTien());
		ps.executeUpdate();
	}

}
