package sanpham.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import iCore.dao.MySQLConnUtils;
import sanpham.model.DonHang;

public class DonHangDAO {
public void themDonHang(DonHang donHang) throws ClassNotFoundException, SQLException {
	Connection connection = MySQLConnUtils.getMySQLConnection();
	String sql ="INSERT INTO donhang VALUES(?,?,?,?,?,?,?,?)";
	PreparedStatement ps = connection.prepareCall(sql);
	ps.setString(1, donHang.getMaDonHang());
	ps.setString(2, donHang.getMaDangNhap());
	ps.setString(3, donHang.getTenNguoiNhan());
	ps.setString(4, donHang.getDiaChiNhan());
	ps.setString(5, donHang.getsDTNN());
	ps.setLong(6, donHang.getTongTien());
	ps.setString(7, donHang.getHinhThucThanhToan());
	ps.setTimestamp(8, donHang.getDate());
	ps.executeUpdate();
}
}
