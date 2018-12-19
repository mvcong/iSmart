package iCore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import iCore.dao.ObjectDAO;
import iCore.model.ChucNang;
import iCore.model.NhomPhanQuyen;
import iCore.modelDAO.DAO_ChucNang;
import iCore.modelDAO.DAO_NhomPhanQuyen;

public class Controller_NhomPhanQuyen extends NhomPhanQuyen implements ZEController {
	ObjectDAO dao = new DAO_NhomPhanQuyen();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/nhomphanquyens.jsp";
	String duongDanTrangView = "iCore/pages/nhomphanquyen.jsp";
	String tenCotTimDoiTuong = "maNhomPhanQuyen";
	String maChucNang;
	String maObj;

	public String getMaChucNang() {
		return maChucNang;
	}

	public void setMaChucNang(String maChucNang) {
		this.maChucNang = maChucNang;
	}

	public Set<ChucNang> getChucNang() {
		System.out.println(getMaChucNang());
		ObjectDAO<ChucNang> obj_ChucNang = new DAO_ChucNang();
		Set<ChucNang> chucNangSet = new HashSet<>();

		String[] arrMaChucNang = getMaChucNang().split(",");
		for (int i = 0; i < arrMaChucNang.length; i++)
			chucNangSet.addAll(obj_ChucNang.listByColumns("maChucNang", arrMaChucNang[i]));

		return chucNangSet;

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

	public String getMaObj() {
		return maObj;
	}

	public void setMaObj(String maObj) {
		this.maObj = maObj;
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

		ArrayList<NhomPhanQuyen> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<NhomPhanQuyen> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		NhomPhanQuyen obj = new NhomPhanQuyen();
		obj.maNhomPhanQuyen = getMaNhomPhanQuyen();
		obj.tenNhomPhanQuyen = getTenNhomPhanQuyen();
		obj.moTa = getMoTa();
		obj.ghiChu = getGhiChu();
		obj.chucNangs = getChucNang();
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
		NhomPhanQuyen obj = new NhomPhanQuyen();
		obj.setMaNhomPhanQuyen(maobj);
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
		ArrayList<NhomPhanQuyen> arr = dao.listByColumnLike(column, key);
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
