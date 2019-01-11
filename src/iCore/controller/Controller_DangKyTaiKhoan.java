//package iCore.controller;
//
//import java.util.Date;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.apache.struts2.ServletActionContext;
//
//import iCore.dao.ObjectDAO;
//import iCore.model.TaiKhoanThanhVien;
//import iCore.modelDAO.DAO_TaiKhoanThanhVien;
//import iCore.util.Util_MD5;
//
//public class Controller_DangKyTaiKhoan extends TaiKhoanThanhVien implements ZEControllerTK{
//	ObjectDAO dao = new DAO_TaiKhoanThanhVien();
//	
//	
//	@Override
//	public String saveOrUpdate() {
//		HttpServletRequest request = ServletActionContext.getRequest();
//		HttpSession session = request.getSession();
//		TaiKhoanThanhVien obj = new TaiKhoanThanhVien();
//		obj.anhDaiDien = getAnhDaiDien();
//		obj.maDangNhap = getMaDangNhap();
//		if (!getMatKhau().equals(getKiemTraMatKhau())) {
//			obj.matKhau = Util_MD5.md5(getMatKhau());
//		} else {
//			obj.matKhau = getKiemTraMatKhau();
//		}
//		obj.ngayTao = getNgayTao();
//		obj.ngayCapNhatMatKhau = new Date();
//		obj.trangThaiHoatDong = isTrangThaiHoatDong();
//		obj.email = getEmail();
//		obj.hoVaTen = getHoVaTen();
//		obj.moTa = getMoTa();
//		obj.ghiChu = getGhiChu();
//		obj.thoiGianCapNhat = new Date();
//		obj.nhomPhanQuyen = getNhomPhanQuyen();
//		obj.thanhVien = getThanhVien();
//		if (dao.saveOrUpdate(obj)) {
//			session.setAttribute("msg", "Cập nhật dữ liệu thành công!");
//			session.setAttribute("obj", obj);
//			session.setAttribute("mode", "viewDetailAndEdit");
//			session.setAttribute("p", duongDanTrangView);
//			return "SUCCESS";
//		} else {
//			session.setAttribute("msg", "Cập nhật dữ liệu thất bại!");
//			return "FAIL";
//		}
//	}
//
//}
