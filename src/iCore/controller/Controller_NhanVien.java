package iCore.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import iCore.dao.ObjectDAO;
import iCore.model.NhanVien;
import iCore.model.PhieuChi;
import iCore.modelDAO.DAO_NhanVien;
import iCore.util.Util_Date;

public class Controller_NhanVien extends NhanVien implements ZEController {
	ObjectDAO dao = new DAO_NhanVien();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/nhanviens.jsp";
	String duongDanTrangView = "iCore/pages/nhanvien.jsp";
	String tenCotTimDoiTuong = "maNV";
	String maObj;
	String s_ngaySinh;
	String s_ngayHuong;
	String s_ngayVaoLam;

	File myFile;
	String myFileContentType;
	String myFileFileName;
	String myFileName;
	String myFolder;

	public String getS_ngaySinh() {
		return s_ngaySinh;
	}

	public void setS_ngaySinh(String s_ngaySinh) {
		this.s_ngaySinh = s_ngaySinh;
	}

	public Date getNgaySinh() {
		return Util_Date.stringToDate(getS_ngaySinh());
	}

	public String getS_ngayHuong() {
		return s_ngayHuong;
	}

	public void setS_ngayHuong(String s_ngayHuong) {
		this.s_ngayHuong = s_ngayHuong;
	}
	public Date getNgayHuong() {
		return Util_Date.stringToDate(getS_ngayHuong());
	}

	public String getTimKiemTheo() {
		return timKiemTheo;
	}

	public void setTimKiemTheo(String timKiemTheo) {
		this.timKiemTheo = timKiemTheo;
	}

	public String getTuKhoa() {
		return tuKhoa;
	}

	public void setTuKhoa(String tuKhoa) {
		this.tuKhoa = tuKhoa;
	}

	public String getTenCotTimDoiTuong() {
		return tenCotTimDoiTuong;
	}

	public void setTenCotTimDoiTuong(String tenCotTimDoiTuong) {
		this.tenCotTimDoiTuong = tenCotTimDoiTuong;
	}

	public String getMaObj() {
		return maObj;
	}

	public void setMaObj(String maObj) {
		this.maObj = maObj;
	}

	public String getS_ngayVaoLam() {
		return s_ngayVaoLam;
	}

	public void setS_ngayVaoLam(String s_ngayVaoLam) {
		this.s_ngayVaoLam = s_ngayVaoLam;
	}
	public Date getNgayVaoLam() {
		return Util_Date.stringToDate(getS_ngayVaoLam());
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileContentType() {
		return myFileContentType;
	}

	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	public String getMyFileName() {
		return myFileName;
	}

	public void setMyFileName(String myFileName) {
		this.myFileName = myFileName;
	}

	public String getMyFolder() {
		return myFolder;
	}

	public void setMyFolder(String myFolder) {
		this.myFolder = myFolder;
	}
	
	@Override
	public String addNew() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("mode", "addNew");
		session.setAttribute("p", duongDanTrangView);
		session.setAttribute("msg", null);
		session.setAttribute("obj", null);
		return "SUCCESS";
	}

	@Override
	public String viewDetail() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String maobj = request.getParameter("maobj");

		session.setAttribute("mode", "viewDetail");

		ArrayList<NhanVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
		if (arr.size() > 0) {
			session.setAttribute("obj", arr.get(0));
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String viewDetailAndEdit() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("msg", null);

		String maobj = request.getParameter("maobj");
		session.setAttribute("mode", "viewDetailAndEdit");
		ArrayList<NhanVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
		if (arr.size() > 0) {
			session.setAttribute("obj", arr.get(0));
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String saveOrUpdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

			NhanVien obj = new NhanVien();
			obj.maNV = getMaNV();
			obj.tenNV = getTenNV();
			obj.ngaySinh = getNgaySinh();
			obj.gioiTinh = getGioiTinh();
			obj.sDT = getsDT();
			obj.email = getEmail();
			obj.diaChi = getDiaChi();
			obj.ngayVaoLam = getNgayVaoLam();
			obj.bacLuong = getBacLuong();
			obj.heSo = getHeSo();
			obj.ngayHuong = getNgayHuong();
			obj.thoiGianCapNhat = new Date();
			if (dao.saveOrUpdate(obj)) {
				session.setAttribute("msg", "Cập nhật dữ liệu thành công!");
				session.setAttribute("obj", obj);
				session.setAttribute("mode", "viewDetailAndEdit");
				session.setAttribute("p", duongDanTrangView);
				return "SUCCESS";
			} else {
				session.setAttribute("msg", "Cập nhật dữ liệu thất bại!");
				return "FAIL";
			}
	}

	@Override
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String maobj = request.getParameter("maobj");
		NhanVien obj = new NhanVien();
		obj.setMaNV(maobj);
		if (dao.delete(obj)) {
			session.setAttribute("msg", "Xóa dữ liệu thành công!");
			session.setAttribute("p", duongDanTrang);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String search() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String column = getTimKiemTheo();
		String key = getTuKhoa();
		ArrayList<NhanVien> arr = dao.listByColumnLike(column, key);
		session.setAttribute("arr", arr);
		session.setAttribute("checkTimKiem", "true");
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	}

	@Override
	public String refresh() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("arr", null);
		session.setAttribute("msg", null);
		session.setAttribute("checkTimKiem", null);
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	}

	@Override
	public String importData() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String exportData() throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
