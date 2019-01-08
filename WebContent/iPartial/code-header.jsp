<%@page import="iCore.model.TaiKhoanThanhVien"%>
<%@page import="iCore.modelDAO.DAO_ChucNang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="iCore.dao.ObjectDAO"%>
<%@page import="iCore.model.ChucNang"%>
<%@page import="java.util.Set"%>
<%@page import="iCore.model.NhomPhanQuyen"%>
<%@page import="iCore.model.TaiKhoanNhanVien"%>
<%@page import="iCore.model.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// Lay ra thong bao
	String msg = request.getSession().getAttribute("msg") + "";
	msg = msg.equals("null") ? "" : msg;
	// Lay ra ten trang hien tai
	String pageName = getServletConfig().getServletContext().getRealPath(request.getServletPath());
	String host = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/trangquanly.jsp";
	if (!pageName.endsWith("trangquanly.jsp")) {
		// Ngăn cản truy cập trực tiếp trang này. Khi truy cập trực tiếp sẽ được trả về trang chủ.
		response.sendRedirect(host);
	}
	// Kiểm tra va lay trang con bên trong
// 	Enumeration<String> parameterNames = request.getParameterNames();
// 	String paramValue ="";
// 	while (parameterNames.hasMoreElements()) {
// 		String paramName = parameterNames.nextElement();
// 		String[] paramValues = request.getParameterValues(paramName);
		
// 		 for (int i = 0; i < paramValues.length; i++) {
// 			  paramValue += paramValues[i];
// 		 }
// 	}
// 	System.out.println(paramValue+"ddddddddddddđ");
	
	String p1 = request.getParameter("p") + "";
	if (p1.equals("null")) {
		p1 = session.getAttribute("p") + "";
	} else {
		session.setAttribute("p", p1);
	}
	p1 = "trangquanly.jsp?p=" + p1;
	// Kiểm tra có quyền truy cập chức năng này - Hồ Văn Bi - 10/5/2018
	String p2 = request.getParameter("p") + "";
	String maDangNhap1 = session.getAttribute("maDangNhap") != null
			? session.getAttribute("maDangNhap").toString()
			: "";
// 	TaiKhoanNhanVien taiKhoanNhanVien = new TaiKhoanNhanVien();
// 	TaiKhoanSinhVien taiKhoanSinhVien = new TaiKhoanSinhVien();
// 	ObjectDAO<TaiKhoanNhanVien> obj_TaiKhoanNhanVien = new DAO_TaiKhoanNhanVien();
// 	ObjectDAO<TaiKhoanSinhVien> obj_TaiKhoanSinhVien = new DAO_TaiKhoanSinhVien();
// 	ArrayList<TaiKhoanNhanVien> list_TaiKhoanNhanVien = obj_TaiKhoanNhanVien.listByColumns("maDangNhap",
// 			maDangNhap1);
// 	ArrayList<TaiKhoanSinhVien> list_TaiKhoanSinhVien = obj_TaiKhoanSinhVien.listByColumns("maDangNhap",
// 			maDangNhap1);
TaiKhoan tk = (TaiKhoan) session.getAttribute("taiKhoanDangNhap");
	if (tk!=null && tk instanceof TaiKhoanNhanVien) {
		NhomPhanQuyen nhomPhanQuyen = tk.getNhomPhanQuyen();
		Set<ChucNang> chucNangSet = nhomPhanQuyen.getChucNangs();
		ObjectDAO<ChucNang> obj_ChucNang = new DAO_ChucNang();
		ArrayList<ChucNang> list_ChucNang = obj_ChucNang.listByColumns("duongDan", p2);
		if (list_ChucNang.size() > 0) {
			ChucNang chucNang = list_ChucNang.get(0);
			System.out.println(list_ChucNang.get(0));
			if (chucNangSet.toString().indexOf(p2) == -1) {
				session.setAttribute("p", null);
				System.out.println("khong duoc phep truy cap");
%>

<input id="host" value="<%=host%>" hidden="">
<script type="text/javascript">
	alert("Bạn không được quyên truy cập trang này.");
	var myElement = document.getElementById("host").value;
	window.location.href = myElement;
</script>
<%
	}
		}
	}
	if (tk!=null&&tk instanceof TaiKhoanThanhVien) {
		NhomPhanQuyen nhomPhanQuyen = tk.getNhomPhanQuyen();
		Set<ChucNang> chucNangSet = nhomPhanQuyen.getChucNangs();
		ObjectDAO<ChucNang> obj_ChucNang = new DAO_ChucNang();
		ArrayList<ChucNang> list_ChucNang = obj_ChucNang.listByColumns("duongDan", p2);
		if (list_ChucNang.size() > 0) {
			ChucNang chucNang = list_ChucNang.get(0);
			System.out.println(list_ChucNang.get(0));
			if (chucNangSet.toString().indexOf(p2) == -1) {
				session.setAttribute("p", null);
				System.out.println("khong duoc phep truy cap");
%>

<input id="host" value="<%=host%>" hidden="">
<script type="text/javascript">
	alert("Bạn không được quyên truy cập trang này.");
	var myElement = document.getElementById("host").value;
	window.location.href = myElement;
</script>
<%
	}
		}
	}
%>


<%
	// Phân trang	
	String pid = request.getParameter("page");
	pid = (pid == null || pid.equals("null")) ? "0" : pid;
	String s_recordPerPage = request.getParameter("recordPerPage");
	s_recordPerPage = (s_recordPerPage == null || s_recordPerPage.equals("null")) ? "10" : s_recordPerPage;
	long recordPerPage = Long.parseLong(s_recordPerPage);
%>


<script type="text/javascript">
	function confirmDelete(a) {
		if (confirm("Bạn có chắc chắn xóa: " + a.target + " ?")) {
			window.location.href = "delete" + a.id + ".action?maobj=" + a.title;
		}
	}
</script>