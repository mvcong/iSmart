<%@page import="iCore.model.NhanVien"%>
<%@page import="iCore.modelDAO.DAO_NhanVien"%>
<%@page import="iCore.util.Util_Date"%>
<%@page import="iCore.model.DungCu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "DungCu";
	String tenTrang = "Quản lý dụng cụ";
	String trangDanhSach = "index.jsp?p=iCore/pages/dungcus.jsp";
	String[] tk_value = {"maDC", "tenDC", "loaiDC", "ngayNhap", "soLuong", "hsd", "giaMua", "nhanVien"};
	String[] tk_show = {"Mã dụng cụ", "Tên dụng cụ", "Loại dụng cụ", "Ngày nhập", "Số lượng", "Hạn sử dụng",
			"Giá mua", "Nhân viên"};
%>
<%@ include file="../../iPartial/code-header.jsp"%>

<%
	String mode = session.getAttribute("mode") + "";
	String tenTrangChiTiet = "";
	tenTrangChiTiet = mode.equals("addNew") ? "Thêm mới" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetail") ? "Xem thông tin chi tiết" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetailAndEdit") ? "Chỉnh sửa thông tin" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("null") ? "" : tenTrangChiTiet;

	boolean modeView = mode.equals("viewDetail");
	boolean modeEdit = mode.equals("viewDetailAndEdit");

	DungCu obj = session.getAttribute("obj") != null ? (DungCu) session.getAttribute("obj") : null;
%>

<script>
	function thayDoiMyFileFileName() {
		var x = document.getElementById("maNV");
		x.value = x.value.toUpperCase();

		var b = document.getElementById("myFileName");
		b.value = x.value;

	}
</script>

<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header"><%=tenTrang%>
			-
			<%=tenTrangChiTiet%>
		</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<form action="luuDuLieu<%=tenLop%>.action" method="post"
	enctype="multipart/form-data">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading" style="text-align: left;">
					<div class="row">
						<div class="col-md-5">
							<p style="color: red; display: inline;"><%=msg%></p>
						</div>
						<div class="col-md-7">
							<%@ include file="../../iPartial/processform.jsp"%>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label>Mã dụng cụ</label> <input class="form-control" id="maDC"
										name="maDC" onblur="thayDoiMyFileFileName()"
										value="<%=(obj != null && obj.getMaDC() != null ? obj.getMaDC() : System.currentTimeMillis())%>"
										<%=(modeView || modeEdit ? " readonly " : "")%> readonly
										required="required">
								</div>
								<div class="form-group">
									<label>Tên dụng cụ</label> <input class="form-control"
										name="tenDC"
										value="<%=(obj != null && obj.getTenDC() != null ? obj.getTenDC() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày nhập</label> <input class="form-control"
										name="s_ngayNhap" type="date"
										value="<%=(obj != null && obj.getNgayNhap() != null ? Util_Date.dateToString(obj.getNgayNhap()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Số lượng</label> <input class="form-control"
										name="soLuong"
										value="<%=(obj != null && obj.getSoLuong() != null ? obj.getSoLuong() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Loại dụng cụ</label> <input class="form-control"
										name="loaiDC"
										value="<%=(obj != null && obj.getLoaiDC() != null ? obj.getLoaiDC() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Hạn sử dụng</label> <input class="form-control"
										name="hsd"
										value="<%=(obj != null && obj.getHsd() != null ? obj.getHsd() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Giá mua</label> <input class="form-control"
										name="giaMua"
										value="<%=(obj != null && obj.getGiaMua() > 0 ? obj.getGiaMua() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Nhân viên quản lý</label> <select class="form-control"
										name="maNV" <%=(modeView ? " disabled " : "")%>>
										<option value=""></option>
										<%
											ObjectDAO objdao = new DAO_NhanVien();
											ArrayList<NhanVien> listNhanVien = objdao.listAll();
											for (NhanVien nv : listNhanVien) {
										%>
										<option value="<%=nv.maNV%> "
											<%=obj != null && obj.getNhanVien() != null && obj.getNhanVien().maNV.equals(nv.maNV) ? "selected"
								: ""%>>
											<%=nv.tenNV%>
										</option>
										<%
											}
										%>
									</select>
								</div>

							</div>
							<div class="panel-footer" style="text-align: left;">
								<div class="col-md-12"></div>
<!-- 								<div class="col-md-12"> -->
<%-- 									<%@ include file="../../iPartial/processform.jsp"%> --%>
<!-- 								</div> -->
							</div>
						</div>
					</div>
				</div>
				<!-- /.col-lg-6 (nested) -->
				<!-- /.col-lg-6 (nested) -->
			</div>
			<!-- /.row (nested) -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</form>