package sanpham.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.oro.text.regex.Perl5Pattern;

import com.mysql.jdbc.MySQLConnection;

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

	public ArrayList<SanPham> getListProductByNav(String maLoai, int firstResult, int maxResult) throws SQLException, ClassNotFoundException{
        Connection connection = MySQLConnUtils.getMySQLConnection();
        String sql = "SELECT * FROM sanpham WHERE loaisanpham_maloai = '" + maLoai + "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
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
	
	
//	public ArrayList<SanPham> getListProduct(int firstResult, int maxResult) throws SQLException, ClassNotFoundException{
//        Connection connection = MySQLConnUtils.getMySQLConnection();
//        String sql = "SELECT * FROM sanpham ";
//        PreparedStatement ps = connection.prepareCall(sql);
//        ps.setInt(1, firstResult);
//        ps.setInt(2, maxResult);
//        ResultSet rs = ps.executeQuery();
//        ArrayList<SanPham> list = new ArrayList<>();
//        while (rs.next()) {
//        	SanPham sp = new SanPham();
//			sp.setMaSP(rs.getLong("maSP"));
//			sp.setTenSP(rs.getString("tenSP"));
//			sp.setAnhSP(rs.getString("anhSP"));
//			sp.setGiaBan(rs.getLong("giaBan"));
//			list.add(sp);
//        }
//        return list;
//    }
	
	 // tính tổng sản phẩm
    public int countSanPhamByLoaiSanPham(String maLoai) throws SQLException, ClassNotFoundException{
        Connection connection = MySQLConnUtils.getMySQLConnection();
        String sql = "SELECT count(maSP) FROM sanpham WHERE loaisanpham_maloai = '" + maLoai + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;  
    }
    
    
    public int countSanPham() throws SQLException, ClassNotFoundException{
        Connection connection = MySQLConnUtils.getMySQLConnection();
        String sql = "SELECT count(maSP) FROM sanpham ";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;  
    }
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
		SanPhamDAO sanPhamDAO = new SanPhamDAO();
		System.out.println(sanPhamDAO.countSanPham());
	}
}
