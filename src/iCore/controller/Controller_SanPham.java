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
import iCore.model.ThanhVien;
import iCore.modelDAO.DAO_LoaiSanPham;
import iCore.modelDAO.DAO_NhanVien;
import iCore.modelDAO.DAO_SanPham;
import iCore.modelDAO.DAO_ThanhVien;
import iCore.util.Util_Date;
import sanpham.model.LoaiSanPham;
import sanpham.model.SanPham;

public class Controller_SanPham extends SanPham implements ZEController {
	ObjectDAO dao = new DAO_SanPham();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "iCore/pages/sanphams.jsp";
	String duongDanTrangView = "iCore/pages/sanpham.jsp";
	String tenCotTimDoiTuong = "maSP";
	String maObj;
	String s_ngayNhapHang;
	String s_anhSP;
	
	String maLoai;
	String maNV;

	File myFile;
	String myFileContentType;
	String myFileFileName;
	String myFileName;
	String myFolder_iCore;

	public String getS_ngayNhapHang() {
		return s_ngayNhapHang;
	}

	public void setS_ngayNhapHang(String s_ngayNhapHang) {
		this.s_ngayNhapHang = s_ngayNhapHang;
	}

	public Date getNgayNhapHang() {
		return Util_Date.stringToDate(getS_ngayNhapHang());
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public NhanVien getNhanVien() {
		ObjectDAO dao_nhanVien = new DAO_NhanVien();
		ArrayList<NhanVien> list_nhanVien = dao_nhanVien.listByColumns("maNV", getMaNV());
		if (list_nhanVien.size() > 0)
			return list_nhanVien.get(0);
		else
			return null;
	}

	public LoaiSanPham getLoaiSanPham() {
		ObjectDAO dao_loaiSanPham = new DAO_LoaiSanPham();
		ArrayList<LoaiSanPham> list_loaiSanPham = dao_loaiSanPham.listByColumns("maLoai", getMaLoai());
		if (list_loaiSanPham.size() > 0)
			return list_loaiSanPham.get(0);
		else
			return null;
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

	public String getMyFolder_iCore() {
		return myFolder_iCore;
	}

	public void setMyFolder_iCore(String myFolder_iCore) {
		this.myFolder_iCore = myFolder_iCore;
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

	public String getMaNV() {
		return maNV;
	}

	public void setMaNV(String maNV) {
		this.maNV = maNV;
	}

	public String getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}

	public String getS_anhSP() {
		return s_anhSP;
	}

	public void setS_anhSP(String s_anhSP) {
		this.s_anhSP = s_anhSP;
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

		ArrayList<SanPham> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<SanPham> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		try {
			String s = "";
			if (!myFileName.equals("")) {
				if (myFile != null) {
					myFileName = getMaSP() + myFileFileName.substring(myFileFileName.lastIndexOf("."));
					File destFile = new File(myFolder_iCore, myFileName);
					s = destFile + "";
					FileUtils.copyFile(myFile, destFile);
					System.out.println(destFile.toString());
				} else {
					s = getS_anhSP();
				}
			} else
				s = getS_anhSP();
			SanPham obj = new SanPham();
			obj.maSP = getMaSP();
			obj.tenSP = getTenSP();
			obj.anhSP = s.substring(s.lastIndexOf("\\") + 1, s.length());
			obj.linkSP = getLinkSP();
			obj.soLuong = getSoLuong();
			obj.donVi = getDonVi();
			obj.ngayNhapHang = getNgayNhapHang();
			obj.hsd = getHsd();
			obj.giaSP = getGiaSP();
			obj.giaBan= getGiaBan();
			obj.nhanVien = getNhanVien();
			obj.loaiSanPham = getLoaiSanPham();
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
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("msg", "Cập nhật dữ liệu thất bại!");
			return "FAIL";
		}
	}

	@Override
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String maobj = request.getParameter("maobj");
		SanPham obj = new SanPham();
		obj.setMaSP(maobj);
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
		ArrayList<SanPham> arr = dao.listByColumnLike(column, key);
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
