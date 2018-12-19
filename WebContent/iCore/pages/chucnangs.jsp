<%@page import="iCore.modelDAO.DAO_ChucNang"%>
<%@page import="iCore.model.ChucNang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="iCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "ChucNang";
	String tenTrang = "Quản lý Chức Năng";
	String[] tk_value = { "maChucNang", "tenHienThi", "duongDan", "chucNangCha" };
	String[] tk_show = { "Mã chức năng", "Tên hiển thị", "Đường dẫn", "Chức năng cha" };
%>

<%@ include file="../../iPartial/code-header.jsp"%>

<%
	ObjectDAO<ChucNang> dao = new DAO_ChucNang();

	ArrayList<ChucNang> list = new ArrayList<ChucNang>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof ChucNang) {
				list = (ArrayList<ChucNang>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<ChucNang>();
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
						<th>Mã chức năng</th>
						<th>Tên hiển thị</th>
						<th>Đường dẫn</th>
						<th>Hình ảnh</th>
						<th>Chức năng cha</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (ChucNang obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaChucNang();
							String tenDoiTuong = obj.getTenHienThi();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaChucNang()%></td>
						<td><%=obj.getTenHienThi()%></td>
						<td><%=obj.getDuongDan() != null ? obj.getDuongDan() : ""%></td>
						<td><%=obj.getHinhAnh()%></td>
						<td><%=obj.getChucNangCha() == null ? "" : obj.getChucNangCha().getTenHienThi()%></td>
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