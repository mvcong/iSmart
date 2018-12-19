package iCore.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import iCore.dao.ObjectDAO;
import iCore.model.TaiKhoan;
import iCore.modelDAO.DAO_TaiKhoan;
import iCore.util.Util_MD5;
import iCore.util.Util_Menu;

public class Controller_XacThuc {
	ObjectDAO<TaiKhoan> dao = new DAO_TaiKhoan();
	String maDangNhap;
	String matKhau;

	public String getMaDangNhap() {
		return maDangNhap;
	}

	public void setMaDangNhap(String maDangNhap) {
		this.maDangNhap = maDangNhap;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String dangNhap() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<TaiKhoan> ls = dao.listByColumns("maDangNhap", getMaDangNhap());
		TaiKhoan obj;
		if (ls.size() > 0) {
			obj = ls.get(0);
			String md5 = Util_MD5.md5(getMatKhau());
			if (obj.getMatKhau().equals(md5) && obj.isTrangThaiHoatDong()==true) {
				session.setAttribute("taiKhoanDangNhap", obj);
				session.setAttribute("maDangNhap", obj.getMaDangNhap());
				session.setAttribute("chucNangs", Util_Menu.getMenu2(session.getAttribute("maDangNhap") + ""));
				return "SUCCESS";
			}
		}
		String err = "Tài khoản không tồn tại, hoặc mật khẩu không chính xác. <br/> Liên hệ bộ phận kỹ thuật khi quên mật khẩu đăng nhập. <hr/>";
		session.setAttribute("err", err);
		return "FAIL";
	}

	public String dangXuat() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.invalidate();
		return "SUCCESS";
	}
}
