package iCore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import iCore.dao.ObjectDAO;
import iCore.model.NhanVien;
import iCore.model.NhomPhanQuyen;
import iCore.model.TaiKhoanNhanVien;
import iCore.modelDAO.DAO_NhanVien;
import iCore.modelDAO.DAO_NhomPhanQuyen;
import iCore.modelDAO.DAO_TaiKhoanNhanVien;
import iCore.util.Util_Date;
import iCore.util.Util_MD5;

public class Controller_TaiKhoanNhanVien extends TaiKhoanNhanVien implements ZEController {
	ObjectDAO dao = new DAO_TaiKhoanNhanVien();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/taikhoannhanviens.jsp";
	String duongDanTrangView = "iCore/pages/taikhoannhanvien.jsp";
	String tenCotTimDoiTuong = "maDangNhap";
	String maObj;
	String maNV;
	String s_ngayTao;
	String s_ngayCapNhatMatKhau;
	String maNhomPhanQuyen;

	String matKhauHienTai;

	public String getMatKhauHienTai() {
		return matKhauHienTai;
	}

	public void setMatKhauHienTai(String matKhauHienTai) {
		this.matKhauHienTai = matKhauHienTai;
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

	public String getMaNhanVien() {
		return maNV;
	}

	public void setMaNhanVien(String maNV) {
		this.maNV = maNV;
	}

	public NhanVien getNhanVien() {
		ObjectDAO dao_nhanVien = new DAO_NhanVien();
		ArrayList<NhanVien> list = dao_nhanVien.listByColumns("maNV", getMaNhanVien());
		if (list.size() > 0)
			return list.get(0);
		else
			return null;
	}

	public String getS_ngayTao() {
		return s_ngayTao;
	}

	public void setS_ngayTao(String s_ngayTao) {
		this.s_ngayTao = s_ngayTao;
	}

	public Date getNgayTao() {
		return Util_Date.stringToDate(getS_ngayTao());
	}

	public String getS_ngayCapNhatMatKhau() {
		return s_ngayCapNhatMatKhau;
	}

	public void setS_ngayCapNhatMatKhau(String s_ngayCapNhatMatKhau) {
		this.s_ngayCapNhatMatKhau = s_ngayCapNhatMatKhau;
	}

	public String getMaNhomPhanQuyen() {
		return maNhomPhanQuyen;
	}

	public void setMaNhomPhanQuyen(String maNhomPhanQuyen) {
		this.maNhomPhanQuyen = maNhomPhanQuyen;
	}

	public NhomPhanQuyen getNhomPhanQuyen() {
		ObjectDAO dao_nhomPhanQuyen = new DAO_NhomPhanQuyen();
		ArrayList<NhomPhanQuyen> list = dao_nhomPhanQuyen.listByColumns("maNhomPhanQuyen", getMaNhomPhanQuyen());
		if (list.size() > 0)
			return list.get(0);
		else
			return null;
	}

	public String getKiemTraMatKhau() {
		ArrayList<TaiKhoanNhanVien> list = dao.listByColumns("maDangNhap", getMaDangNhap());
		if (list.size() > 0)
			return list.get(0).getMatKhau();
		else
			return "";
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

		ArrayList<TaiKhoanNhanVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<TaiKhoanNhanVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		TaiKhoanNhanVien obj = new TaiKhoanNhanVien();
		obj.anhDaiDien = getAnhDaiDien();
		obj.maDangNhap = getMaDangNhap();
		if (!getMatKhau().equals(getKiemTraMatKhau())) {
			obj.matKhau = Util_MD5.md5(getMatKhau());
		} else {
			obj.matKhau = getKiemTraMatKhau();
		}
		obj.ngayTao = getNgayTao();
		obj.ngayCapNhatMatKhau = new Date();
		obj.trangThaiHoatDong = isTrangThaiHoatDong();
		obj.email = getEmail();
		obj.hoVaTen = getHoVaTen();
		obj.moTa = getMoTa();
		obj.ghiChu = getGhiChu();
		obj.thoiGianCapNhat = new Date();
		obj.nhomPhanQuyen = getNhomPhanQuyen();
		obj.nhanVien = getNhanVien();
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
		TaiKhoanNhanVien obj = new TaiKhoanNhanVien();
		obj.setMaDangNhap(maobj);
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
		ArrayList<TaiKhoanNhanVien> arr = dao.listByColumnLike(column, key);
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

	// Hồ Văn Bi - 27/5-2018
	public String doiMatKhau() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String maDangNhap = session.getAttribute("maDangNhap").toString();
		ObjectDAO<TaiKhoanNhanVien> dao_TaiKhoanNhanVien = new DAO_TaiKhoanNhanVien();
		ArrayList<TaiKhoanNhanVien> list_TaiKhoanNhanVien = dao_TaiKhoanNhanVien.listByColumns("maDangNhap",
				maDangNhap);
		TaiKhoanNhanVien taiKhoanNhanVien = list_TaiKhoanNhanVien.get(0);
		String matKhauHienTai = taiKhoanNhanVien.getMatKhau();
		if (matKhauHienTai.equals(Util_MD5.md5(getMatKhauHienTai()))) {
			taiKhoanNhanVien.setMatKhau(Util_MD5.md5(getMatKhau()));
			if (dao.saveOrUpdate(taiKhoanNhanVien)) {
				session.setAttribute("msg", "Đổi mật khẩu thành công!");
				return "SUCCESS";
			}
		} else {
			session.setAttribute("msg", "Đổi mật khẩu thất bại!");
			return "FAIL";
		}
		return "FAIL";
	}
}
