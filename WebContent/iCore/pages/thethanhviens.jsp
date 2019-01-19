<%@page import="iCore.model.NhanVien"%>
<%@page import="iCore.modelDAO.DAO_TaiKhoanNhanVien"%>
<%@page import="iCore.modelDAO.DAO_TaiKhoanThanhVien"%>
<%@page import="iCore.modelDAO.DAO_ThanhVien"%>
<%@page import="iCore.model.ThanhVien"%>
<%@page import="iCore.modelDAO.DAO_TheThanhVien"%>
<%@page import="iCore.model.TheThanhVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "TheThanhVien";
	String tenTrang = "Quản lý thẻ thành viên";
	String[] tk_value = {"maThe", "ngayTao", "ngayKT", "gioBD","gioKT", "loaiThe"};
	String[] tk_show = {"Mã thẻ", "Ngày bắt đầu", "Ngày kết thúc", "Giờ bắt đầu", "Giờ kết thúc", "Loại thẻ"};
%>

<%@ include file="../../iPartial/code-header.jsp"%>

<%
	ObjectDAO<TheThanhVien> dao = new DAO_TheThanhVien();

	ArrayList<TheThanhVien> list = new ArrayList<TheThanhVien>();

	String maTV = request.getParameter("maTV");
	maTV = (maTV == null || maTV.equals("null")) ? "all" : maTV;

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof TheThanhVien) {
				list = (ArrayList<TheThanhVien>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<TheThanhVien>();
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
				<label>Chọn thành viên sở hữu</label> <select name="maTV"
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

			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã thẻ</th>
						<th>Ngày bắt đầu</th>
						<th>Ngày kết thúc</th>
						<th>Thành viên</th>
						<th>Giờ bắt đầu</th>
						<th>Giờ kết thúc</th>
						<th>Loại thẻ</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (TheThanhVien obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaThe();
							String tenDoiTuong = obj.getLoaiThe();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaThe()%></td>
						<td><%=obj.getNgayTao() != null ? obj.getNgayTao() : ""%></td>
						<td><%=obj.getNgayKT() != null ? obj.getNgayKT() : ""%></td>
						<td><%=obj.getThanhVien() == null ? "" : obj.getThanhVien().getTenTV()%></td>
						<td><%=obj.getGioBD() != null ? obj.getGioBD() : ""%></td>
						<td><%=obj.getGioKT() != null ? obj.getGioKT() : ""%></td>
						<td><%=obj.getLoaiThe() != null ? obj.getLoaiThe() : ""%></td>
						<td style="text-align: center;">
<%-- 						<%@ include file="../../iPartial/menupullcuadoituong.jsp"%> --%>
						
						
						
						<div class="pull-center">
	<div class="btn-group">
		<button type="button" class="btn btn-default btn-xs dropdown-toggle"
			data-toggle="dropdown">
			<img src="content/images/menu-16.png" /> Chọn chức năng <span
				class="caret"></span>
		</button>
		
		
		
		<ul class="dropdown-menu pull-right" role="menu">
			<li><a href="xemChiTiet<%=tenLop%>.action?maobj=<%=maDoiTuong%>"><img
					src="content/images/detail-16.png" />&nbsp;&nbsp; Xem chi tiết</a></li>
					
					<%
										ObjectDAO objdao_TaiKhoan = new DAO_TaiKhoanNhanVien();
										String maDangNhap = session.getAttribute("maDangNhap").toString();
										ArrayList<TaiKhoanNhanVien> listTaiKhoan = objdao_TaiKhoan.listByColumns("maDangNhap", maDangNhap);
										if (listTaiKhoan.size() > 0) {
											TaiKhoanNhanVien taiKhoan = listTaiKhoan.get(0);
											NhanVien taixe = taiKhoan.getNhanVien();
									%>
			<li><a
				href="xemChiTietVaChinhSua<%=tenLop%>.action?maobj=<%=maDoiTuong%>"><img
					src="content/images/edit-16.png" />&nbsp;&nbsp; Chỉnh sửa</a></li>
			<li><a id="<%=tenLop%>" title="<%=maDoiTuong%>"
				target="<%=tenDoiTuong%>" onclick="confirmDelete(this)"><img
					src="content/images/delete-16.png" />&nbsp;&nbsp; Xóa</a></li>
		</ul>
		<%}%>
		
		

		
		
		
	</div>

						
						
						
						
						</td>
						
						
						
						
						
						
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