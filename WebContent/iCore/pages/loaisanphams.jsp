<%@page import="iCore.modelDAO.DAO_LoaiSanPham"%>
<%@page import="sanpham.LoaiSanPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String tenLop = "LoaiSanPham";
	String tenTrang = "Quản lý loại sản phẩm";
	String[] tk_value = { "maLoai", "tenLoai" };
	String[] tk_show = { "Mã loại sản phẩm", "Tên loại sản phẩm" };
%>

<%@ include file="../../iPartial/code-header.jsp"%>
<%
	ObjectDAO<LoaiSanPham> dao = new DAO_LoaiSanPham();

	ArrayList<LoaiSanPham> list = new ArrayList<LoaiSanPham>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof LoaiSanPham) {
				list = (ArrayList<LoaiSanPham>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<LoaiSanPham>();
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
						<th>Mã loại sản phẩm</th>
						<th>Tên loại sản phẩm</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (LoaiSanPham obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaLoai();
							String tenDoiTuong = obj.getTenLoai();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaLoai()%></td>
						<td><%=obj.getTenLoai() != null ? obj.getTenLoai() : ""%></td>
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