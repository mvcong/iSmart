package iCore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import iCore.dao.ObjectDAO;
import iCore.model.DungCu;
import iCore.model.LichSuTap;
import iCore.model.ThanhVien;
import iCore.modelDAO.DAO_LichSuTap;
import iCore.modelDAO.DAO_ThanhVien;
import iCore.util.Util_Date;

public class Controller_LichSuTap extends LichSuTap implements ZEController {
	ObjectDAO dao = new DAO_LichSuTap();
	
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/lichsutaps.jsp";
	String duongDanTrangView = "iCore/pages/lichsutap.jsp";
	String tenCotTimDoiTuong = "maLST";
	String maObj;
	String s_ngayTap;
	
	String maTV;

	
	public String getS_ngayTap() {
		return s_ngayTap;
	}

	public void setS_ngayTap(String s_ngayTap) {
		this.s_ngayTap = s_ngayTap;
	}
	public Date getNgayTap() {
		return Util_Date.stringToDate(getS_ngayTap());
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

	

	public String getMaTV() {
		return maTV;
	}

	public void setMaTV(String maTV) {
		this.maTV = maTV;
	}
	
	public ThanhVien getThanhVien() {
		ObjectDAO dao_thanhVien = new DAO_ThanhVien();
		ArrayList<ThanhVien> list_thanhVien = dao_thanhVien.listByColumns(maTV, getMaTV());
		if(list_thanhVien.size()>0)
			return list_thanhVien.get(0);
		else
			return null;
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

		ArrayList<LichSuTap> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<LichSuTap> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		LichSuTap obj = new LichSuTap();
		obj.maLST = getMaLST();
		obj.tenLST = getTenLST();
		obj.ngayTap = getNgayTap();
		obj.thoiGianTap = getThoiGianTap();
		obj.noiDung = getNoiDung();
		obj.thanhVien = getThanhVien();
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
		LichSuTap obj = new LichSuTap();
		obj.setMaLST(maobj);
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
		ArrayList<LichSuTap> arr = dao.listByColumnLike(column, key);
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
