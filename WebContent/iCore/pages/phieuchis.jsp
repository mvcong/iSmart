<%@page import="iCore.modelDAO.DAO_NhanVien"%>
<%@page import="iCore.model.NhanVien"%>
<%@page import="iCore.modelDAO.DAO_PhieuChi"%>
<%@page import="iCore.model.PhieuChi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "PhieuChi";
	String tenTrang = "Quản lý phiếu chi";
	String[] tk_value = {"maPC", "tenPC", "thanhPhan", "soLuong", "ngayTao"};
	String[] tk_show = {"Mã phiếu chi", "Tên phiếu chi", "Thành phần", "Số lượng", "Ngày tạo"};
%>

<%@ include file="../../iPartial/code-header.jsp"%>

<%
	ObjectDAO<PhieuChi> dao = new DAO_PhieuChi();

	ArrayList<PhieuChi> list = new ArrayList<PhieuChi>();

	String maNV = request.getParameter("maNV");
	maNV = (maNV == null || maNV.equals("null")) ? "all" : maNV;

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof PhieuChi) {
				list = (ArrayList<PhieuChi>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<PhieuChi>();
	} else {
		if (!maNV.equals("all")) {
			list = dao.pagination("nhanVien = '" + maNV + "'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
			System.out.println("sssssssssssssssssssssssssssssss");
		} else
			list = dao.pagination("1=1  ORDER BY nhanVien ASC", (long) recordPerPage,
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
				<label>Chọn nhân viên quản lý</label> <select name="maNV"
					class="form-control" id="maNV" onchange="myFunction()">
					<%
						ObjectDAO<NhanVien> dao_NhanVien = new DAO_NhanVien();
						ArrayList<NhanVien> list_NhanVien = dao_NhanVien.listAll();
					%>
					<option value="all" <%if (maNV.equals("all")) {%>
						selected="selected" <%}%>>Tất cả</option>

					<%
						for (NhanVien nhanVien : list_NhanVien) {
					%>
					<option value="<%=nhanVien.getMaNV()%>"
						<%if (maNV.equals(nhanVien.getMaNV())) {%> selected="selected"
						<%}%>><%=nhanVien.getTenNV()%></option>
					<%
						}
					%>
				</select>
				<script type="text/javascript">
					function myFunction() {
						var maNV = document.getElementById("maNV").value;
						var recordPerPage = document
								.getElementById("recordPerPage").value;
						var p1 = document.getElementById("p1").value;
						window.location.href = p1 + "&maNV=" + maNV
								+ "&recordPerPage=" + recordPerPage;

					}
				</script>
			</form>

			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã phiếu chi</th>
						<th>Tên phiếu chi</th>
						<th>Nhân viên</th>
						<th>Thành phần</th>
						<th>Số lượng</th>
						<th>Ngày tạo</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (PhieuChi obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaPC();
							String tenDoiTuong = obj.getTenPC();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaPC()%></td>
						<td><%=obj.getTenPC() != null ? obj.getTenPC() : ""%></td>
						<td><%=obj.getNhanVien() == null ? "" : obj.getNhanVien().getTenNV()%></td>
						<td><%=obj.getThanhPhan() != null ? obj.getThanhPhan() : ""%></td>
						<td><%=obj.getSoLuong() != null ? obj.getSoLuong() : ""%></td>
						<td><%=obj.getNgayTao() != null ? obj.getNgayTao() : ""%></td>
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