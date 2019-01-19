<%@page import="iCore.util.Util_Date"%>
<%@page import="iCore.model.NhanVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "NhanVien";
	String tenTrang = "Quản lý Nhân Viên";
	String trangDanhSach = "index.jsp?p=iCore/pages/nhanviens.jsp";
	String[] tk_value = {"maNV", "tenNV", "gioiTinh", "ngaySinh", "sDT", "email", "diaChi", "ngayVaoLam"};
	String[] tk_show = {"Mã Nhân viên", "Tên Nhân viên", "Giới tính", "Ngày sinh", "Số điện thoại", "Email",
			"Địa chỉ", "Ngày vào làm"};
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

	NhanVien obj = session.getAttribute("obj") != null ? (NhanVien) session.getAttribute("obj") : null;
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
				<div class="panel-body" id = "printDiv">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label>Mã nhân viên</label> <input class="form-control"
										id="maNV" name="maNV" onblur="thayDoiMyFileFileName()"
										value="<%=(obj != null && obj.getMaNV() != null ? obj.getMaNV() : "")%>"
									
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên nhân viên</label> <input class="form-control"
										name="tenNV"
										value="<%=(obj != null && obj.getTenNV() != null ? obj.getTenNV() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>

								<div class="form-group">
									<label>Ngày sinh</label> <input class="form-control"
										name="s_ngaySinh" type="date"
										value="<%=(obj != null && obj.getNgaySinh() != null ? Util_Date.dateToString(obj.getNgaySinh()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày vào làm</label> <input class="form-control"
										name="s_ngayVaoLam" type="date"
										value="<%=(obj != null && obj.getNgayVaoLam() != null ? Util_Date.dateToString(obj.getNgayVaoLam()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Giới tính</label> <select class="form-control"
										name="gioiTinh">
										<option></option>
										<option value="Nam"
											<%=obj != null && obj.getGioiTinh() != null && obj.gioiTinh.equals("Nam") ? "selected" : ""%>>Nam</option>
										<option value="Nữ"
											<%=obj != null && obj.getGioiTinh() != null && obj.gioiTinh.equals("Nữ") ? "selected" : ""%>>Nữ</option>
									</select>
								</div>
								<div class="form-group">
									<label>Địa chỉ</label> <input class="form-control"
										name="diaChi"
										value="<%=(obj != null && obj.getDiaChi() != null ? obj.getDiaChi() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-6">


								<div class="form-group">
									<label>Email</label> <input class="form-control" name="email"
										value="<%=(obj != null && obj.getEmail() != null ? obj.getEmail() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Số điện thoại di động</label> <input
										class="form-control" name="sDT"
										value="<%=(obj != null && obj.getsDT() != null ? obj.getsDT() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Bậc lương</label> <input class="form-control"
										name="bacLuong"
										value="<%=(obj != null && obj.getBacLuong() != null ? obj.getBacLuong() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Hệ số lương</label> <input class="form-control"
										name="heSo"
										value="<%=(obj != null && obj.getHeSo() != null ? obj.getHeSo() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày hưởng</label> <input class="form-control"
										name="s_ngayHuong" type="date"
										value="<%=(obj != null && obj.getNgayHuong() != null ? Util_Date.dateToString(obj.getNgayHuong()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
						</div>


						<div class="col-md-12"></div>
<!-- 						<div class="col-md-12"> -->
<%-- 							<%@ include file="../../iPartial/processform.jsp"%> --%>
<!-- 						</div> -->
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