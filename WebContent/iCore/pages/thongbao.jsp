<%@page import="iCore.model.NhanVien"%>
<%@page import="iCore.modelDAO.DAO_NhanVien"%>
<%@page import="iCore.util.Util_Date"%>
<%@page import="iCore.model.ThongBao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "ThongBao";
	String tenTrang = "Quản lý thông báo";
	String trangDanhSach = "index.jsp?p=iCore/pages/thongbaos.jsp";
	String[] tk_value = {"maTB", "tenTB", "ngayTao", "link", "noiDung", "nhanVien"};
	String[] tk_show = {"Mã thông báo", "Tên thông báo", "Ngày tạo", "Link", "Nội dung", "Nhân viên"};
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

	ThongBao obj = session.getAttribute("obj") != null ? (ThongBao) session.getAttribute("obj") : null;
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
									<label>Mã thông báo</label> <input class="form-control" id="maTB"
										name="maTB" onblur="thayDoiMyFileFileName()"
										value="<%=(obj != null && obj.getMaTB() != null ? obj.getMaTB() : "")%>"
															<%=(modeView || modeEdit ? " readonly " : "")%>> 
								</div>
								<div class="form-group">
									<label>Tên thông báo</label> <input class="form-control"
										name="tenTB"
										value="<%=(obj != null && obj.getTenTB() != null ? obj.getTenTB() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày tạo</label> <input class="form-control"
										name="ngayTao" type="date"
										value="<%=(obj != null && obj.getNgayTao() != null ? Util_Date.dateToString(obj.getNgayTao()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Link</label> <input class="form-control"
										name="link"
										value="<%=(obj != null && obj.getLink() != null ? obj.getLink() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Nội dung</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="noiDung" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getNoiDung() != null ? obj.getNoiDung() : "")%></textarea>
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