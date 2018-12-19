<%@page import="iCore.model.TaiKhoanThanhVien"%>
<%@page import="iCore.modelDAO.DAO_ThanhVien"%>
<%@page import="iCore.model.ThanhVien"%>
<%@page import="iCore.modelDAO.DAO_TaiKhoan"%>
<%@page import="iCore.util.Util_MD5"%>
<%@page import="iCore.model.TaiKhoanNhanVien"%>
<%@page import="iCore.modelDAO.DAO_NhomPhanQuyen"%>
<%@page import="iCore.model.NhomPhanQuyen"%>
<%@page import="iCore.modelDAO.DAO_ChucNang"%>
<%@page import="java.util.HashSet"%>
<%@page import="iCore.model.ChucNang"%>
<%@page import="java.util.Set"%>
<%@page import="iCore.modelDAO.DAO_NhanVien"%>
<%@page import="iCore.dao.ObjectDAO"%>
<%@page import="iCore.model.NhanVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
// 		NhanVien admin = new NhanVien();
// 		admin.setMaNV("NV01");
// 		admin.setTenNV("Mai Van Cong");
// 		admin.setEmail("mai.cong365@gmail.com");
// 		ObjectDAO dao = new DAO_NhanVien();
// 		dao.saveOrUpdate(admin);

// 		NhanVien nhanvien = new NhanVien();
// 		nhanvien.setMaNV("NV02");
// 		nhanvien.setTenNV("Dao Nhat Binh");
// 		nhanvien.setEmail("nhatbinh0207@gmail.com");
// 		ObjectDAO dao3 = new DAO_NhanVien();
// 		dao3.saveOrUpdate(nhanvien);
		
// 		ThanhVien tv = new ThanhVien();
// 		tv.setMaTV("TV01");
// 		tv.setTenTV("Nguyen Van Hieu");
// 		tv.setEmail("nguyenhieu225@gmail.com");
// 		ObjectDAO dao2 = new DAO_ThanhVien();
// 		dao2.saveOrUpdate(tv);
		
		ObjectDAO daochucnang = new DAO_ChucNang();
	// chức năng và nhóm phân quyền
		ChucNang CN_QuanLyChucNangVaNhomPhanQuyen = new ChucNang();
		CN_QuanLyChucNangVaNhomPhanQuyen.setMaChucNang("QuanLyChucNangVaNhomPhanQuyen");
		CN_QuanLyChucNangVaNhomPhanQuyen.setDuongDan("null");
		CN_QuanLyChucNangVaNhomPhanQuyen.setHinhAnh("fa fa-filter");
		CN_QuanLyChucNangVaNhomPhanQuyen.setTenHienThi("Chức năng và nhóm phân quyền");
		CN_QuanLyChucNangVaNhomPhanQuyen.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyChucNangVaNhomPhanQuyen);
			
		ChucNang CN_QuanLyChucNang = new ChucNang();
		CN_QuanLyChucNang.setMaChucNang("QuanLyChucNang");
		CN_QuanLyChucNang.setDuongDan("iCore/pages/chucnangs.jsp");
		CN_QuanLyChucNang.setHinhAnh("fa fa-share-alt");
		CN_QuanLyChucNang.setTenHienThi("Quản lý chức năng");
		CN_QuanLyChucNang.setChucNangCha(CN_QuanLyChucNangVaNhomPhanQuyen);
		daochucnang.saveOrUpdate(CN_QuanLyChucNang);
				
		ChucNang CN_QuanLyNhomPhanQuyen = new ChucNang();
		CN_QuanLyNhomPhanQuyen.setMaChucNang("QuanLyNhomPhanQuyen");
		CN_QuanLyNhomPhanQuyen.setDuongDan("iCore/pages/nhomphanquyens.jsp");
		CN_QuanLyNhomPhanQuyen.setHinhAnh("fa fa-share-alt");
		CN_QuanLyNhomPhanQuyen.setTenHienThi("Quản lý nhóm phân quyền");
		CN_QuanLyNhomPhanQuyen.setChucNangCha(CN_QuanLyChucNangVaNhomPhanQuyen);
		daochucnang.saveOrUpdate(CN_QuanLyNhomPhanQuyen);
	//end
	// quản lý thành viên
		ChucNang CN_QuanLyThanhVien = new ChucNang();
		CN_QuanLyThanhVien.setMaChucNang("QuanLyThanhVien");
		CN_QuanLyThanhVien.setDuongDan("null");
		CN_QuanLyThanhVien.setHinhAnh("fa fa-filter");
		CN_QuanLyThanhVien.setTenHienThi("Quản lý thành viên");
		CN_QuanLyThanhVien.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyThanhVien);
		
		ChucNang CN_QLThanhVien = new ChucNang();
		CN_QLThanhVien.setMaChucNang("QLThanhVien");
		CN_QLThanhVien.setDuongDan("iCore/pages/thanhviens.jsp");
		CN_QLThanhVien.setHinhAnh("fa fa-share-alt");
		CN_QLThanhVien.setTenHienThi("Thành viên");
		CN_QLThanhVien.setChucNangCha(CN_QuanLyThanhVien);
		daochucnang.saveOrUpdate(CN_QLThanhVien);
		
		ChucNang CN_QLTheThanhVien = new ChucNang();
		CN_QLTheThanhVien.setMaChucNang("QLTheThanhVien");
		CN_QLTheThanhVien.setDuongDan("iCore/pages/thethanhviens.jsp");
		CN_QLTheThanhVien.setHinhAnh("fa fa-share-alt");
		CN_QLTheThanhVien.setTenHienThi("Thẻ Thành viên");
		CN_QLTheThanhVien.setChucNangCha(CN_QuanLyThanhVien);
		daochucnang.saveOrUpdate(CN_QLTheThanhVien);
		
		ChucNang CN_QuanLyPhieuGiamSatTV = new ChucNang();
		CN_QuanLyPhieuGiamSatTV.setMaChucNang("QuanLyPhieuGiamSatTV");
		CN_QuanLyPhieuGiamSatTV.setDuongDan("iCore/pages/phieugiamsattvs.jsp");
		CN_QuanLyPhieuGiamSatTV.setHinhAnh("fa fa-share-alt");
		CN_QuanLyPhieuGiamSatTV.setTenHienThi("Phiếu giám sát thành viên");
		CN_QuanLyPhieuGiamSatTV.setChucNangCha(CN_QuanLyThanhVien);
		daochucnang.saveOrUpdate(CN_QuanLyPhieuGiamSatTV);
		
	//end
	// quản lý nhân viên
		ChucNang CN_QuanLyNV = new ChucNang();
		CN_QuanLyNV.setMaChucNang("QuanLyNV");
		CN_QuanLyNV.setDuongDan("null");
		CN_QuanLyNV.setHinhAnh("fa fa-filter");
		CN_QuanLyNV.setTenHienThi("Quản lý nhân viên");
		CN_QuanLyNV.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyNV);
		
		ChucNang CN_QuanLyNhanVien = new ChucNang();
		CN_QuanLyNhanVien.setMaChucNang("QuanLyNhanVien");
		CN_QuanLyNhanVien.setDuongDan("iCore/pages/nhanviens.jsp");
		CN_QuanLyNhanVien.setHinhAnh("fa fa-share-alt");
		CN_QuanLyNhanVien.setTenHienThi("Quản lý nhân viên");
		CN_QuanLyNhanVien.setChucNangCha(CN_QuanLyNV);
		daochucnang.saveOrUpdate(CN_QuanLyNhanVien);
		
	// quản lý dụng cụ
		ChucNang CN_QuanLyDC= new ChucNang();
		CN_QuanLyDC.setMaChucNang("QuanLyDC");
		CN_QuanLyDC.setDuongDan("null");
		CN_QuanLyDC.setHinhAnh("fa fa-filter");
		CN_QuanLyDC.setTenHienThi("Quản lý dụng cụ");
		CN_QuanLyDC.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyDC);
		
		ChucNang CN_QuanLyDungCu = new ChucNang();
		CN_QuanLyDungCu.setMaChucNang("QuanLyDungCu");
		CN_QuanLyDungCu.setDuongDan("iCore/pages/dungcus.jsp");
		CN_QuanLyDungCu.setHinhAnh("fa fa-share-alt");
		CN_QuanLyDungCu.setTenHienThi("Quản lý dụng cụ");
		CN_QuanLyDungCu.setChucNangCha(CN_QuanLyDC);
		daochucnang.saveOrUpdate(CN_QuanLyDungCu);
		
// quản lý tài khoản	
		ChucNang CN_QuanLyTaiKhoan = new ChucNang();
		CN_QuanLyTaiKhoan.setMaChucNang("QuanLyTaiKhoan");
		CN_QuanLyTaiKhoan.setDuongDan("null");
		CN_QuanLyTaiKhoan.setHinhAnh("fa fa-filter");
		CN_QuanLyTaiKhoan.setTenHienThi("Quản lý tài khoản");
		CN_QuanLyTaiKhoan.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyTaiKhoan);
		
		ChucNang CN_QuanLyTKNhanVien = new ChucNang();
		CN_QuanLyTKNhanVien.setMaChucNang("QuanLyTKNhanVien");
		CN_QuanLyTKNhanVien.setDuongDan("iCore/pages/taikhoannhanviens.jsp");
		CN_QuanLyTKNhanVien.setHinhAnh("fa fa-share-alt");
		CN_QuanLyTKNhanVien.setTenHienThi("Quản lý tài khoản nhân viên");
		CN_QuanLyTKNhanVien.setChucNangCha(CN_QuanLyTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyTKNhanVien);
		
		
		ChucNang CN_QuanLyTKThanhVien = new ChucNang();
		CN_QuanLyTKThanhVien.setMaChucNang("QuanLyTKthanhVien");
		CN_QuanLyTKThanhVien.setDuongDan("iCore/pages/taikhoanthanhviens.jsp");
		CN_QuanLyTKThanhVien.setHinhAnh("fa fa-share-alt");
		CN_QuanLyTKThanhVien.setTenHienThi("Quản lý tài khoản thành viên");
		CN_QuanLyTKThanhVien.setChucNangCha(CN_QuanLyTaiKhoan);
		daochucnang.saveOrUpdate(CN_QuanLyTKThanhVien);
	//end
	// quản lý sản phẩm
		ChucNang CN_QuanLySP = new ChucNang();
		CN_QuanLySP.setMaChucNang("QuanLySP");
		CN_QuanLySP.setDuongDan("null");
		CN_QuanLySP.setHinhAnh("fa fa-filter");
		CN_QuanLySP.setTenHienThi("Quản lý sản phẩm");
		CN_QuanLySP.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLySP);

		ChucNang CN_QuanLySanPham = new ChucNang();
		CN_QuanLySanPham.setMaChucNang("QuanLySanPham");
		CN_QuanLySanPham.setDuongDan("iCore/pages/sanphams.jsp");
		CN_QuanLySanPham.setHinhAnh("fa fa-share-alt");
		CN_QuanLySanPham.setTenHienThi("Quản lý sản phẩm");
		CN_QuanLySanPham.setChucNangCha(CN_QuanLySP);
		daochucnang.saveOrUpdate(CN_QuanLySanPham);
		
		
	// end
	
	// quản lý thông báo
	
		ChucNang CN_QuanLyThongBaoThongKe = new ChucNang();
		CN_QuanLyThongBaoThongKe.setMaChucNang("QuanLyThongBaoThongKe");
		CN_QuanLyThongBaoThongKe.setDuongDan("null");
		CN_QuanLyThongBaoThongKe.setHinhAnh("fa fa-filter");
		CN_QuanLyThongBaoThongKe.setTenHienThi("Quản lý thông báo thống kê");
		CN_QuanLyThongBaoThongKe.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyThongBaoThongKe);
	
		ChucNang CN_QuanLyThongBao = new ChucNang();
		CN_QuanLyThongBao.setMaChucNang("QuanLyThongBao");
		CN_QuanLyThongBao.setDuongDan("iCore/pages/thongbaos.jsp");
		CN_QuanLyThongBao.setHinhAnh("fa fa-share-alt");
		CN_QuanLyThongBao.setTenHienThi("Quản lý thông báo");
		CN_QuanLyThongBao.setChucNangCha(CN_QuanLyThongBaoThongKe);
		daochucnang.saveOrUpdate(CN_QuanLyThongBao);
	//end
	// quản lý thu - chi
		ChucNang CN_QuanLyThuChi = new ChucNang();
		CN_QuanLyThuChi.setMaChucNang("QuanLyThuChi");
		CN_QuanLyThuChi.setDuongDan("null");
		CN_QuanLyThuChi.setHinhAnh("fa fa-filter");
		CN_QuanLyThuChi.setTenHienThi("Quản lý thu - chi");
		CN_QuanLyThuChi.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyThuChi);
		
		ChucNang CN_QuanLyThu = new ChucNang();
		CN_QuanLyThu.setMaChucNang("QuanLyThu");
		CN_QuanLyThu.setDuongDan("iCore/pages/phieuthus.jsp");
		CN_QuanLyThu.setHinhAnh("fa fa-share-alt");
		CN_QuanLyThu.setTenHienThi("Quản lý phiếu thu");
		CN_QuanLyThu.setChucNangCha(CN_QuanLyThuChi);
		daochucnang.saveOrUpdate(CN_QuanLyThu);
		
		ChucNang CN_QuanLyChi = new ChucNang();
		CN_QuanLyChi.setMaChucNang("QuanLyChi");
		CN_QuanLyChi.setDuongDan("iCore/pages/phieuchis.jsp");
		CN_QuanLyChi.setHinhAnh("fa fa-share-alt");
		CN_QuanLyChi.setTenHienThi("Quản lý phiếu chi");
		CN_QuanLyChi.setChucNangCha(CN_QuanLyThuChi);
		daochucnang.saveOrUpdate(CN_QuanLyChi);
		
	//end
	// quan ly lich su tap
		ChucNang CN_QuanLyHistory = new ChucNang();
		CN_QuanLyHistory.setMaChucNang("QuanLyHistory");
		CN_QuanLyHistory.setDuongDan("null");
		CN_QuanLyHistory.setHinhAnh("fa fa-filter");
		CN_QuanLyHistory.setTenHienThi("Quản lý lịch sử tập");
		CN_QuanLyHistory.setChucNangCha(null);
		daochucnang.saveOrUpdate(CN_QuanLyHistory);
		
		ChucNang CN_QuanLyLichSuTap = new ChucNang();
		CN_QuanLyLichSuTap.setMaChucNang("QuanLyLichSuTap");
		CN_QuanLyLichSuTap.setDuongDan("iCore/pages/lichsutaps.jsp");
		CN_QuanLyLichSuTap.setHinhAnh("fa fa-share-alt");
		CN_QuanLyLichSuTap.setTenHienThi("Quản lý lịch sử tập");
		CN_QuanLyLichSuTap.setChucNangCha(CN_QuanLyHistory);
		daochucnang.saveOrUpdate(CN_QuanLyLichSuTap);
		
	// sét quyền truy cập
	//admin
		NhomPhanQuyen nhomPhanQuyenadmin = new NhomPhanQuyen();
		nhomPhanQuyenadmin.setMaNhomPhanQuyen("admin");
		nhomPhanQuyenadmin.setTenNhomPhanQuyen("Admin");
		Set<ChucNang> chs1 = new HashSet<ChucNang>();
			
		chs1.add(CN_QuanLyChucNangVaNhomPhanQuyen);
		chs1.add(CN_QuanLyChucNang);
		chs1.add(CN_QuanLyNhomPhanQuyen);
		
		chs1.add(CN_QuanLyThanhVien);
		chs1.add(CN_QLThanhVien);
		chs1.add(CN_QLTheThanhVien);
		chs1.add(CN_QuanLyPhieuGiamSatTV);
		
		chs1.add(CN_QuanLyDC);
		chs1.add(CN_QuanLyDungCu);
		
		chs1.add(CN_QuanLySP);
		chs1.add(CN_QuanLySanPham);
		
		chs1.add(CN_QuanLyNV);
		chs1.add(CN_QuanLyNhanVien);
		
		chs1.add(CN_QuanLyHistory);
		chs1.add(CN_QuanLyLichSuTap);
		
		chs1.add(CN_QuanLyTaiKhoan);
		chs1.add(CN_QuanLyTKNhanVien);
		chs1.add(CN_QuanLyTKThanhVien);
		
		chs1.add(CN_QuanLyThuChi);
		chs1.add(CN_QuanLyChi);
		chs1.add(CN_QuanLyThu);
		
		chs1.add(CN_QuanLyThongBaoThongKe);
		chs1.add(CN_QuanLyThongBao);
		
		nhomPhanQuyenadmin.setChucNangs(chs1);
		ObjectDAO daonpqad = new DAO_NhomPhanQuyen();
		daonpqad.saveOrUpdate(nhomPhanQuyenadmin);
		
// nhan vien		
		
		
		NhomPhanQuyen nhomPhanQuyennv = new NhomPhanQuyen();
		nhomPhanQuyennv.setMaNhomPhanQuyen("nhanvien");
		nhomPhanQuyennv.setTenNhomPhanQuyen("Nhân viên");
		Set<ChucNang> chs2 = new HashSet<ChucNang>();
		
		
		chs2.add(CN_QuanLyThuChi);
		chs2.add(CN_QuanLyThu);
		chs2.add(CN_QuanLyChi);
		
		chs2.add(CN_QuanLyHistory);
		chs2.add(CN_QuanLyLichSuTap);
		
		chs2.add(CN_QuanLyThanhVien);
		chs2.add(CN_QuanLyPhieuGiamSatTV);
		
		chs2.add(CN_QuanLyThongBaoThongKe);
		chs2.add(CN_QuanLyThongBao);
		
		nhomPhanQuyennv.setChucNangs(chs2);
		ObjectDAO daonpqnv = new DAO_NhomPhanQuyen();
		daonpqnv.saveOrUpdate(nhomPhanQuyennv);
		
// thanh vien
		
				
		NhomPhanQuyen nhomPhanQuyentv = new NhomPhanQuyen();
		nhomPhanQuyentv.setMaNhomPhanQuyen("thanhvien");
		nhomPhanQuyentv.setTenNhomPhanQuyen("Thành viên");
		Set<ChucNang> chs3 = new HashSet<ChucNang>();
		
		chs3.add(CN_QuanLyThanhVien);
		chs3.add(CN_QuanLyPhieuGiamSatTV);
		
		chs3.add(CN_QuanLyHistory);
		chs3.add(CN_QuanLyLichSuTap);
		
		nhomPhanQuyentv.setChucNangs(chs3);
		ObjectDAO daonpqtv = new DAO_NhomPhanQuyen();
		daonpqtv.saveOrUpdate(nhomPhanQuyentv);
// // // tk admin		
// 		TaiKhoanNhanVien tkadmin = new TaiKhoanNhanVien();
// 		tkadmin.setMaDangNhap(admin.getEmail());
// 		tkadmin.setEmail(admin.getEmail());
// 		tkadmin.setMatKhau(Util_MD5.md5("123456"));
// 		tkadmin.setNhanVien(admin);
// 		tkadmin.setNhomPhanQuyen(nhomPhanQuyenadmin);
// 		ObjectDAO daoadmin = new DAO_TaiKhoan();
// 		daoadmin.saveOrUpdate(tkadmin);
// // // tk nhan vien		
// 		TaiKhoanNhanVien tknv = new TaiKhoanNhanVien();
// 		tknv.setMaDangNhap(nhanvien.getEmail());
// 		tknv.setEmail(nhanvien.getEmail());
// 		tknv.setMatKhau(Util_MD5.md5("123456"));
// 		tknv.setNhanVien(nhanvien);
// 		tknv.setNhomPhanQuyen(nhomPhanQuyennv);
// 		ObjectDAO daonv = new DAO_TaiKhoan();
// 		daonv.saveOrUpdate(tknv);
// // // tk thanh vien		
// 		TaiKhoanThanhVien tktv = new TaiKhoanThanhVien();
// 		tktv.setMaDangNhap(tv.getEmail());
// 		tktv.setEmail(tv.getEmail());
// 		tktv.setMatKhau(Util_MD5.md5("123456"));
// 		tktv.setThanhVien(tv);
// 		tktv.setNhomPhanQuyen(nhomPhanQuyentv);
// 		ObjectDAO daotv = new DAO_TaiKhoan();
// 		daotv.saveOrUpdate(tktv);
		
	%>

</body>
</html>