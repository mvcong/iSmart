package iCore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import iCore.model.ThanhVien;

public class ThanhVienDAO {
	public boolean checkEmail(String email) throws ClassNotFoundException, SQLException {
        Connection connection = MySQLConnUtils.getMySQLConnection();
        String sql = "SELECT * FROM thanhvien WHERE email = '" + email + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ThanhVienDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
	 public boolean themThanhVien(ThanhVien tv) throws ClassNotFoundException, SQLException {
	        Connection connection = MySQLConnUtils.getMySQLConnection();
	        String sql = "INSERT INTO thanhvien VALUES(?,?,?,?,?,?,?)";
	        try {
	            PreparedStatement ps = connection.prepareCall(sql);
	            ps.setString(1, tv.getMaTV());
	            ps.setString(2, tv.getTenTV());
	            ps.setString(3, tv.getGioiTinh());		           
	            ps.setString(5, tv.getsDT());
	            ps.setString(6, tv.getEmail());
	            ps.setString(7, tv.getDiaChi());
	            ps.executeUpdate();
	            return true;
	        } catch (SQLException ex) {
	            Logger.getLogger(ThanhVienDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return false;
	    }

}
