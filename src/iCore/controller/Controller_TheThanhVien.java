package iCore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import QRCode.QRCode;
import iCore.dao.ObjectDAO;
import iCore.model.DungCu;
import iCore.model.NhanVien;
import iCore.model.TaiKhoan;
import iCore.model.ThanhVien;
import iCore.model.TheThanhVien;
import iCore.modelDAO.DAO_NhanVien;
import iCore.modelDAO.DAO_ThanhVien;
import iCore.modelDAO.DAO_TheThanhVien;
import iCore.util.Util_Date;
import tools.SendMail;

public class Controller_TheThanhVien extends TheThanhVien implements ZEController{
	ObjectDAO dao = new DAO_TheThanhVien();
	
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/thethanhviens.jsp";
	String duongDanTrangView = "iCore/pages/thethanhvien.jsp";
	String tenCotTimDoiTuong = "maThe";
	String maObj;
	String s_ngayTao;
	String s_ngayKT;
	
	String maTV;
	
	public String getS_ngayTao() {
		return s_ngayTao;
	}
	public void setS_ngayTao(String s_ngayTao) {
		this.s_ngayTao = s_ngayTao;
	}
	public Date getNgayTao() {
		return Util_Date.stringToDate(getS_ngayTao());
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

		ArrayList<TheThanhVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<TheThanhVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		TaiKhoan tk = (TaiKhoan) session.getAttribute("taiKhoanDangNhap");
		QRCode qr = new QRCode();
		SendMail sm = new SendMail();
		TheThanhVien obj = new TheThanhVien();
		obj.maThe = getMaThe();
		obj.ngayTao = getNgayTao();
		obj.ngayKT = getNgayKT();
		obj.gioBD = getGioBD();
		obj.gioKT = getGioKT();
		obj.hsd = getHsd();
		obj.loaiThe = getLoaiThe();
		obj.thanhVien = getThanhVien();
		obj.thoiGianCapNhat = new Date();
		if (dao.saveOrUpdate(obj)) {
			session.setAttribute("msg", "Cập nhật dữ liệu thành công!");
			session.setAttribute("obj", obj);
			session.setAttribute("mode", "viewDetailAndEdit");
			session.setAttribute("p", duongDanTrangView);
			sm.sendMail(tk.getMaDangNhap(),"GYM XXX [Đăng ký thẻ]","Xin chào, "+ tk.getMaDangNhap()+"\nBạn vừa đăng ký "+ obj.getLoaiThe()+"\nGiờ tập: "+obj.getGioBD()+"\nGiờ kết thúc:"+obj.getGioKT()+"tại phòng GYM XXX của chúng tôi! Mong bạn hãy cố gắng đi tập đều đặn để có một thân hình săn chắc, quyến rũ");			
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
		TheThanhVien obj = new TheThanhVien();
		obj.setMaThe(maobj);
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
		ArrayList<TheThanhVien> arr = dao.listByColumnLike(column, key);
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
