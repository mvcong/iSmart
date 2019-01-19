<%@page import="iCore.modelDAO.DAO_ThanhVien"%>
<%@page import="iCore.model.ThanhVien"%>
<%@page import="iCore.modelDAO.DAO_LichSuTap"%>
<%@page import="iCore.model.LichSuTap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "LichSuTap";
	String tenTrang = "Quản lý lịch sử tập";
	String[] tk_value = {"maLST", "tenLST", "ngayTap", "thoiGianTap", "noiDung"};
	String[] tk_show = {"Mã lịch sử tập", "Tên lịch sử tập", "Ngày tập", "Thời gian tập", "Nội dung"};
%>

<%@ include file="../../iPartial/code-header.jsp"%>

<%
	ObjectDAO<LichSuTap> dao = new DAO_LichSuTap();

	ArrayList<LichSuTap> list = new ArrayList<LichSuTap>();

	String maTV = request.getParameter("maTV");
	maTV = (maTV == null || maTV.equals("null")) ? "all" : maTV;

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof LichSuTap) {
				list = (ArrayList<LichSuTap>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<LichSuTap>();
	} else {
		if (!maTV.equals("all")) {
			list = dao.pagination("thanhVien = '" + maTV + "'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
			System.out.println("sssssssssssssssssssssssssssssss");
		} else
			list = dao.pagination("1=1  ORDER BY thanhVien ASC", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
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

			<form class="form-inline pull-left">
				<label>Chọn thành viên</label> <select name="maTV"
					class="form-control" id="maTV" onchange="myFunction()">
					<%
						ObjectDAO<ThanhVien> dao_ThanhVien = new DAO_ThanhVien();
						ArrayList<ThanhVien> list_ThanhVien = dao_ThanhVien.listAll();
					%>
					<option value="all" <%if (maTV.equals("all")) {%>
						selected="selected" <%}%>>Tất cả</option>

					<%
						for (ThanhVien thanhVien : list_ThanhVien) {
					%>
					<option value="<%=thanhVien.getMaTV()%>"
						<%if (maTV.equals(thanhVien.getMaTV())) {%> selected="selected"
						<%}%>><%=thanhVien.getTenTV()%></option>
					<%
						}
					%>
				</select>
				<script type="text/javascript">
					function myFunction() {
						var maTV = document.getElementById("maTV").value;
						var recordPerPage = document
								.getElementById("recordPerPage").value;
						var p1 = document.getElementById("p1").value;
						window.location.href = p1 + "&maTV=" + maTV
								+ "&recordPerPage=" + recordPerPage;

					}
				</script>
			</form>
			<a class="btn  btn-default" style="text-align: left;"
				href="./Servlet_FileExportLST" id="btnxuatexcel"> <img
				src="content/images/excel-32.png" width="16px" height="16px" />
				&nbsp; Xuất danh sách excel
			</a>
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã lịch sử tập</th>
						<th>Tên lịch sử tập</th>
						<th>Ngày tập</th>
						<th>Thời gian tập</th>
						<th>Nội dung</th>
						<th>Thành viên</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (LichSuTap obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaLST();
							String tenDoiTuong = obj.getTenLST();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaLST()%></td>
						<td><%=obj.getTenLST() != null ? obj.getTenLST() : ""%></td>
						<td><%=obj.getNgayTap() != null ? obj.getNgayTap() : ""%></td>
						<td><%=obj.getThoiGianTap() != null ? obj.getThoiGianTap() : ""%></td>
						<td><%=obj.getNoiDung() != null ? obj.getNoiDung() : ""%></td>
						<td><%=obj.getThanhVien() == null ? "" : obj.getThanhVien().getTenTV()%></td>
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