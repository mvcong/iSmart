<%@page import="iCore.model.ThanhVien"%>
<%@page import="iCore.modelDAO.DAO_ThanhVien"%>
<%@page import="iCore.util.Util_Date"%>
<%@page import="iCore.model.TheThanhVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "TheThanhVien";
	String tenTrang = "Đăng ký tập tháng";
	String trangDanhSach = "index.jsp?p=iCore/pages/thethanhviens.jsp";
	String[] tk_value = {"maThe", "ngayTao", "ngayKT", "loaiThe", "thanhVien"};
	String[] tk_show = {"Mã thẻ", "Ngày bắt đầu", "Ngày kết thúc", "Loại thẻ", "Thành viên"};
%>
<%@ include file="../../iPartial/code-header.jsp"%>

<%
	String mode = session.getAttribute("mode") + "";
	String tenTrangChiTiet = "";
	tenTrangChiTiet = mode.equals("addNew") ? "Đăng ký tháng" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetail") ? "Xem thông tin chi tiết" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("viewDetailAndEdit") ? "Chỉnh sửa thông tin" : tenTrangChiTiet;
	tenTrangChiTiet = mode.equals("null") ? "" : tenTrangChiTiet;

	boolean modeView = mode.equals("viewDetail");
	boolean modeEdit = mode.equals("viewDetailAndEdit");

	TheThanhVien obj = session.getAttribute("obj") != null ? (TheThanhVien) session.getAttribute("obj") : null;
%>

<script>
	function thayDoiMyFileFileName() {
		var x = document.getElementById("maTV");
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
							<%
								if (!modeView) {
							%>
							<div class="row" style="text-align: right;">
								<!-- 	<div class="col-md-3" style="padding: 1px"> -->
								<a href="<%=trangDanhSach%>" class="btn btn-default"
									id="btntrangdanhsach"> <img
									src="content/images/back-32.png" width="16px" height="16px"></img>
									&nbsp; Quay về trang danh sách
								</a>
								<button type="reset" class="btn btn-default" id="btntaomoi">
									<img src="content/images/reset-32.png" width="16px"
										height="16px" /> &nbsp; Nhập lại
								</button>
								<!-- 	</div> -->
								<!-- 	<div class="col-md-3" style="padding: 1px"> -->
								<button type="submit" class="btn btn-default">
									<img src="content/images/save-32.png" width="16px"
										height="16px" /> &nbsp; Đăng ký
								</button>
							</div>
							<%
								} else {
							%>
							<div class="row pull-right">
								<div class="col-md-4" style="padding: 1px">
									<a href="<%=trangDanhSach%>" class="btn btn-default"> <img
										src="content/images/back-32.png" width="16px" height="16px"></img>
										&nbsp; Quay về trang danh sách
									</a>
								</div>
							</div>
							<%
								}
							%>
							<%
								if (session.getAttribute("msg") != null) {
									session.removeAttribute("msg");
								}
							%>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label>Mã thẻ</label> <input class="form-control" id="maThe"
										name="maThe" onblur="thayDoiMyFileFileName()"
										value="<%=(obj != null && obj.getMaThe() != null ? obj.getMaThe() : System.currentTimeMillis())%>"
										<%=(modeView || modeEdit ? " readonly " : "")%> readonly
										required="required">
								</div>

								<div class="form-group">
									<label>Ngày bắt đầu *</label> <input class="form-control"
										name="s_ngayTao" type="date"
										value="<%=(obj != null && obj.getNgayTao() != null ? Util_Date.dateToString(obj.getNgayTao()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày kết thúc *</label> <input class="form-control"
										name="s_ngayKT" type="date"
										value="<%=(obj != null && obj.getNgayKT() != null ? Util_Date.dateToString(obj.getNgayKT()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Giờ bắt đầu *</label> <select class="form-control"
										<%=(modeView ? " disabled " : "")%> name="gioBD" readonly
										required="required">
										<option></option>

									</select>
								</div>

								<div class="form-group">
									<label>Giờ kết thúc *</label> <select class="form-control"
										<%=(modeView ? " disabled " : "")%> name="gioKT" readonly
										required="required">
										<option></option>

									</select>
								</div>
								<div class="form-group">
									<label>Hạn thẻ</label> <input class="form-control" name="hsd"
										value="<%=(obj != null && obj.getHsd() != null ? obj.getHsd() : "")%>"
										<%=(modeView ? " readonly " : "")%> readonly
										required="required">
								</div>
								<div class="form-group">
									<label>Loại thẻ *</label> <select class="form-control"
										<%=(modeView ? " disabled " : "")%> name="loaiThe">
										<option></option>
										<option value="Thẻ tháng"
											<%=obj != null && obj.getLoaiThe() != null && obj.loaiThe.equals("Thẻ tháng") ? "selected" : ""%>>Thẻ
											tháng</option>
									</select>
								</div>


								<div class="form-group">
									<label>Thành viên sở hữu</label> <select class="form-control"
										name="maTV" <%=(modeView ? " disabled " : "")%>>
										<option value=""></option>
										<%
											ObjectDAO objdao = new DAO_ThanhVien();
											ArrayList<ThanhVien> listThanhVien = objdao.listAll();
											for (ThanhVien tv : listThanhVien) {
										%>
										<option value="<%=tv.maTV%> "
											<%=obj != null && obj.getThanhVien() != null && obj.getThanhVien().maTV.equals(tv.getMaTV())
						? "selected"
						: ""%>>
											<%=tv.tenTV%>
										</option>
										<%
											}
										%>
									</select>
								</div>
								<!-- 								<div onload=onReady() id="id_qrcode"></div> -->
							</div>
							<div class="col-lg-6">
								<h2 style="color: red;">Bảng giá tập tháng tại phòng GYM XXX</h2>
								<h3 style="color: red;">Bạn vui lòng thanh toán trực tiếp tại
									phòng GYM</h3>
								<h3 style="color: blue;">1 tháng: 200.000VNĐ</h3>
								<h3 style="color: blue;">2 tháng: 400.000VNĐ</h3>
								<h3 style="color: blue;">3 tháng: 500.000VNĐ</h3>
								<h3 style="color: blue;">6 tháng: 1.150.000VNĐ</h3><h3 style="color: red;">+</h3><h3 style="color: green;">1 tháng miễn phí</h3>
								<h3 style="color: blue;">12 tháng: 2.300.000VNĐ</h3><h3 style="color: red;">+</h3><h3 style="color: green;">2 tháng miễn phí</h3>
								<h3 style="color: red;">Nếu bạn muốn có huấn luyện viên riêng hỗ trợ</h3>
								<h3 style="color: blue;">+ 150.000VNĐ mỗi tháng</h3>
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