package iCore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import iCore.dao.ObjectDAO;
import iCore.model.NhanVien;
import iCore.model.PhieuChi;
import iCore.model.PhieuGiamSatTV;
import iCore.model.ThanhVien;
import iCore.modelDAO.DAO_NhanVien;
import iCore.modelDAO.DAO_PhieuGiamSatTV;
import iCore.modelDAO.DAO_ThanhVien;
import iCore.util.Util_Date;

public class Controller_PhieuGiamSatTV extends PhieuGiamSatTV implements ZEController {
	ObjectDAO dao = new DAO_PhieuGiamSatTV();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/phieugiamsattvs.jsp";
	String duongDanTrangView = "iCore/pages/phieugiamsattv.jsp";
	String tenCotTimDoiTuong = "maPGS";
	String maObj;
	String s_ngayBD;
	String s_ngayKT;

	String maTV;
	String maNV;

	public String getS_ngayBD() {
		return s_ngayBD;
	}

	public void setS_ngayBD(String s_ngayBD) {
		this.s_ngayBD = s_ngayBD;
	}

	public Date getNgayBD() {
		return Util_Date.stringToDate(getS_ngayBD());
	}

	public String getS_ngayKT() {
		return s_ngayKT;
	}

	public void setS_ngayKT(String s_ngayKT) {
		this.s_ngayKT = s_ngayKT;
	}

	public Date getNgayKT() {
		return Util_Date.stringToDate(getS_ngayKT());
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
		ArrayList<ThanhVien> list_thanhVien = dao_thanhVien.listByColumns("maTV", getMaTV());
		if (list_thanhVien.size() > 0)
			return list_thanhVien.get(0);
		else
			return null;
	}

	public String getMaNV() {
		return maNV;
	}

	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}

	public NhanVien getNhanVien() {
		ObjectDAO dao_nhanVien = new DAO_NhanVien();
		ArrayList<NhanVien> list_nhanVien = dao_nhanVien.listByColumns("maNV", getMaNV());
		if (list_nhanVien.size() > 0)
			return list_nhanVien.get(0);
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

		ArrayList<PhieuGiamSatTV> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<PhieuGiamSatTV> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		PhieuGiamSatTV obj = new PhieuGiamSatTV();
		obj.maPGS = getMaPGS();
		obj.tenPGS = getTenPGS();
		obj.ngayBD = getNgayBD();
		obj.ngayKT = getNgayKT();
		obj.noiDung = getNoiDung();
		obj.thanhVien = getThanhVien();
		obj.nhanVien = getNhanVien();
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
		PhieuGiamSatTV obj = new PhieuGiamSatTV();
		obj.setMaPGS(maobj);
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
		ArrayList<PhieuGiamSatTV> arr = dao.listByColumnLike(column, key);
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
