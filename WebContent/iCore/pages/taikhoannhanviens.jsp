<%@page import="java.util.ArrayList"%>
<%@page import="iCore.modelDAO.DAO_TaiKhoanNhanVien"%>
<%@page import="iCore.model.TaiKhoanNhanVien"%>
<%@page import="iCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "TaiKhoanNhanVien";
	String tenTrang = "Quản lý Tài Khoản Nhân Viên";
	String[] tk_value = { "maDangNhap", "ngayTao", "loaiTaiKhoan", "hoVaTen", "email" };
	String[] tk_show = { "Mã đăng nhập", "Ngày tạo", "Loại tài khoản", "Họ và tên", "Email" };
%>

<%@ include file="../../iPartial/code-header.jsp"%>

<%
	ObjectDAO<TaiKhoanNhanVien> dao = new DAO_TaiKhoanNhanVien();

	ArrayList<TaiKhoanNhanVien> list = new ArrayList<TaiKhoanNhanVien>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof TaiKhoanNhanVien) {
				list = (ArrayList<TaiKhoanNhanVien>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<TaiKhoanNhanVien>();
	} else {
		list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
	}
%>


<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header"><%=tenTrang%>
			<p style="color: red; display: inline;"><%=msg%></p>
		</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<%@ include file="../../iPartial/panel-heading.jsp"%>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã đăng nhập</th>
						<th>Loại tài khoản</th>
						<th>Trạng thái hoạt động</th>
						<th>Email</th>
						<th>Họ và tên</th>
						<th>Xử lí</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (TaiKhoanNhanVien obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaDangNhap();
							String tenDoiTuong = obj.getHoVaTen();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaDangNhap()%></td>
						<td><%=obj.getLoaiTaiKhoan() != null ? obj.getLoaiTaiKhoan() : ""%></td>
						<td><%=obj.isTrangThaiHoatDong() == true ? "Hoạt động" : "Không hoạt động"%></td>
						<td><%=obj.getEmail() != null ? obj.getEmail() : ""%></td>
						<td><%=obj != null && obj.getNhanVien() != null ? obj.getNhanVien().getTenNV() : ""%></td>

						<td style="text-align: center;"><%@ include
								file="../../iPartial/menupullcuadoituong.jsp"%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<!-- /.table-responsive -->
			<!-- Phan trang -->
			<%@ include file="../../iPartial/phantrang.jsp"%>
			<!-- ket thuc phan trang -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- Modal Tìm kiếm-->
<%@ include file="../../iPartial/timkiemModel.jsp"%>