package iCore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import iCore.dao.ObjectDAO;
import iCore.model.ChucNang;
import iCore.modelDAO.DAO_ChucNang;

public class Controller_ChucNang extends ChucNang implements ZEController{
	ObjectDAO dao = new DAO_ChucNang();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/chucnangs.jsp";
	String duongDanTrangView = "iCore/pages/chucnang.jsp";
	String tenCotTimDoiTuong = "maChucNang";
	String maObj;
	String maChucNangCha;
	
	
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
	public String getDuongDanTrang() {
		return duongDanTrang;
	}
	public void setDuongDanTrang(String duongDanTrang) {
		this.duongDanTrang = duongDanTrang;
	}
	public String getDuongDanTrangView() {
		return duongDanTrangView;
	}
	public void setDuongDanTrangView(String duongDanTrangView) {
		this.duongDanTrangView = duongDanTrangView;
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
	public String getMaChucNangCha() {
		return maChucNangCha;
	}
	public void setMaChucNangCha(String maChucNangCha) {
		this.maChucNangCha = maChucNangCha;
	}
	
	public ChucNang getChucNangCha() {
		ObjectDAO objdao = new DAO_ChucNang();
		ArrayList<ChucNang> list = objdao.listByColumns("maChucNang", getMaChucNangCha());
		if (list.size() > 0)
			return list.get(0);
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

		ArrayList<ChucNang> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<ChucNang> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		ChucNang obj = new ChucNang();
		obj.maChucNang = getMaChucNang();
		obj.tenHienThi = getTenHienThi();
		obj.duongDan = getDuongDan();
		obj.hinhAnh = getHinhAnh();
		obj.moTa = getMoTa();
		obj.ghiChu = getGhiChu();
		obj.ChucNangCha = getChucNangCha();
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
		ChucNang obj = new ChucNang();
		obj.setMaChucNang(maobj);
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
		ArrayList<ChucNang> arr = dao.listByColumnLike(column, key);
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
