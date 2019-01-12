package iCore.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import iCore.dao.ObjectDAO;
import iCore.model.NhomPhanQuyen;
import iCore.model.TaiKhoanNhanVien;
import iCore.model.TaiKhoanThanhVien;
import iCore.model.ThanhVien;
import iCore.modelDAO.DAO_NhomPhanQuyen;
import iCore.modelDAO.DAO_TaiKhoanThanhVien;
import iCore.modelDAO.DAO_ThanhVien;
import iCore.util.Util_MD5;

public class Controller_DangKyTaiKhoan extends TaiKhoanThanhVien implements ZEControllerTK{
	ObjectDAO dao = new DAO_TaiKhoanThanhVien();
	
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/taikhoanthanhviens.jsp";
	String duongDanTrangView = "/dangnhap.jsp";
	String tenCotTimDoiTuong = "maDangNhap";
	String maObj;
	String maThanhVien;
	String s_ngayTao;
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

	public String getMaThanhVien() {
		return maThanhVien;
	}

	public void setMaThanhVien(String maThanhVien) {
		this.maThanhVien = maThanhVien;
	}

	public ThanhVien getThanhVien() {
		ObjectDAO dao_thanhVien = new DAO_ThanhVien();
		ArrayList<ThanhVien> list = dao_thanhVien.listByColumns("maTV", getMaThanhVien());
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
	public String saveOrUpdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		TaiKhoanThanhVien obj = new TaiKhoanThanhVien();
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
		obj.thanhVien = getThanhVien();
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

}
