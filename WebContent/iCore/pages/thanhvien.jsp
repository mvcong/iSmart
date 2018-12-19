<%@page import="iCore.model.ThanhVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "ThanhVien";
	String tenTrang = "Quản lý thành viên";
	String trangDanhSach = "index.jsp?p=iCore/pages/thanhviens.jsp";
	String[] tk_value = { "maTV", "tenTV", "email", "gioiTinh", "ngaySinh" };
	String[] tk_show = { "Mã thành viên", "Họ và tên", "Email", "Giới tính", "Ngày sinh" };
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

	ThanhVien obj = session.getAttribute("obj") != null ? (ThanhVien) session.getAttribute("obj") : null;
%>
<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header"><%=tenTrang%>
			-
			<%=tenTrangChiTiet%>
		</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<form action="luuDuLieu<%=tenLop%>.action" method="post">
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
							<div class="col-lg-4">
								<div class="form-group">
									<label>Mã thành viên</label> <input class="form-control"
										name="maTV" r value="<%=(obj != null ? obj.getMaTV() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Họ và tên</label> <input class="form-control"
										name="tenTV"
										value="<%=(obj != null && obj.getTenTV() != null ? obj.getTenTV() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Giới tính</label> <select class="form-control"
										<%=(modeView ? " disabled " : "")%> name="gioiTinh">
										<option></option>
										<option value="Nam"
											<%=obj != null && obj.getGioiTinh() != null && obj.gioiTinh.equals("Nam") ? "selected" : ""%>>Nam</option>
										<option value="Nữ"
											<%=obj != null && obj.getGioiTinh() != null && obj.gioiTinh.equals("Nữ") ? "selected" : ""%>>Nữ</option>
									</select>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Ngày sinh</label> <input class="form-control"
										name="ngaySinh"
										value="<%=(obj != null ? obj.getNgaySinh() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Số điện thoại</label> <input class="form-control"
										name="sDT"
										value="<%=(obj != null && obj.getsDT() != null ? obj.getsDT() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Email</label> <input class="form-control" name="email" r
										value="<%=(obj != null ? obj.getEmail() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label>Địa chỉ</label> <input class="form-control"
										name="diaChi" r
										value="<%=(obj != null ? obj.getDiaChi() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="panel-footer" style="text-align: left;">
								<div class="col-md-5"></div>
								<div class="col-md-7">
									<%@ include file="../../iPartial/processform.jsp"%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>