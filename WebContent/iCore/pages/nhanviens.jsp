<%@page import="iCore.modelDAO.DAO_NhanVien"%>
<%@page import="iCore.model.NhanVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "NhanVien";
	String tenTrang = "Quản lý Nhân Viên";
	String[] tk_value = {"maNV", "tenNV", "gioiTinh", "ngaySinh", "email", "diaChi"};
	String[] tk_show = {"Mã Nhân viên", "Tên Nhân viên", "Giới tính", "Ngày Sinh", "Email", "Địa chỉ"};
%>

<%@ include file="../../iPartial/code-header.jsp"%>
<%
	ObjectDAO<NhanVien> dao = new DAO_NhanVien();

	ArrayList<NhanVien> list = new ArrayList<NhanVien>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
	if (listTemp.get(0) instanceof NhanVien) {
				list = (ArrayList<NhanVien>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<NhanVien>();
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
						<th>Mã nhân viên</th>
						<th>Tên nhân viên</th>
						<th>Email</th>
						<th>Ngày Sinh</th>
						<th>Số điện thoại</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (NhanVien obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaNV();
							String tenDoiTuong = obj.getTenNV();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaNV()%></td>
						<td><%=obj.getTenNV() != null ? obj.getTenNV() : ""%></td>
						<td><%=obj.getEmail() != null ? obj.getEmail() : ""%></td>
						<td><%=obj.getNgaySinh() != null ? obj.getNgaySinh() : ""%></td>
						<td><%=obj.getsDT() != null ? obj.getsDT() : ""%></td>
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
<%@ include file="../../iPartial/timkiemModel.jsp"%>