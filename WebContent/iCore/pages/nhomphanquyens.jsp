<%@page import="java.util.ArrayList"%>
<%@page import="iCore.modelDAO.DAO_NhomPhanQuyen"%>
<%@page import="iCore.model.NhomPhanQuyen"%>
<%@page import="iCore.dao.ObjectDAO"%>
<%@page import="java.util.Set"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "NhomPhanQuyen";
	String tenTrang = "Quản lý Nhóm Phân Quyền";
	String[] tk_value = { "maNhomPhanQuyen", "tenNhomPhanQuyen", "chucNang" };
	String[] tk_show = { "Mã nhóm phân quyền", "Tên nhóm phân quyền", "Chức năng" };
%>

<%@ include file="../../iPartial/code-header.jsp"%>

<%
	ObjectDAO<NhomPhanQuyen> dao = new DAO_NhomPhanQuyen();

	ArrayList<NhomPhanQuyen> list = new ArrayList<NhomPhanQuyen>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
	if (listTemp.get(0) instanceof NhomPhanQuyen) {
				list = (ArrayList<NhomPhanQuyen>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<NhomPhanQuyen>();
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
						<th>Mã nhóm phân quyền</th>
						<th>Tên nhóm phân quyền</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (NhomPhanQuyen obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaNhomPhanQuyen();
							String tenDoiTuong = obj.getTenNhomPhanQuyen();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaNhomPhanQuyen()%></td>
						<td><%=obj.getTenNhomPhanQuyen()%></td>
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