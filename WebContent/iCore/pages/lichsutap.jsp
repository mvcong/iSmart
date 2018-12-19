<%@page import="iCore.model.ThanhVien"%>
<%@page import="iCore.modelDAO.DAO_ThanhVien"%>
<%@page import="iCore.util.Util_Date"%>
<%@page import="iCore.model.LichSuTap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "LichSuTap";
	String tenTrang = "Quản lý lịch sử tập";
	String trangDanhSach = "index.jsp?p=iCore/pages/lichsutaps.jsp";
	String[] tk_value = {"maLST", "tenLST", "ngayTap", "thoiGianTap", "noiDung", "thanhVien"};
	String[] tk_show = {"Mã lịch sử tập", "Tên lịch sử tập", "Ngày tập", "Thời gian tập", "Nội dung tập", "Thành viên"
			};
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

	LichSuTap obj = session.getAttribute("obj") != null ? (LichSuTap) session.getAttribute("obj") : null;
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
							<%@ include file="../../iPartial/processform.jsp"%>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label>Mã lịch sử tập</label> <input class="form-control" id="maLST"
										name="maLST" onblur="thayDoiMyFileFileName()"
										value="<%=(obj != null && obj.getMaLST() != null ? obj.getMaLST() : "")%>"
																			<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên lịch sử tập</label> <input class="form-control"
										name="tenLST"
										value="<%=(obj != null && obj.getTenLST() != null ? obj.getTenLST() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày Tập</label> <input class="form-control"
										name="s_ngayTap" type="date"
										value="<%=(obj != null && obj.getNgayTap() != null ? Util_Date.dateToString(obj.getNgayTap()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Thời gian tập</label> <input class="form-control"
										name="thoiGianTap"
										value="<%=(obj != null && obj.getThoiGianTap() != null ? obj.getThoiGianTap() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Nội dung</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="noiDung" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getNoiDung() != null ? obj.getNoiDung() : "")%></textarea>
								</div>
								
								
								<div class="form-group">
									<label>Thành viên</label> <select class="form-control"
										name="maTV" <%=(modeView ? " disabled " : "")%>>
										<option value=""></option>
										<%
											ObjectDAO objdao = new DAO_ThanhVien();
											ArrayList<ThanhVien> listThanhVien = objdao.listAll();
											for (ThanhVien tv : listThanhVien) {
										%>
										<option value="<%=tv.maTV%> "
											<%=obj != null && obj.getThanhVien() != null && obj.getThanhVien().maTV.equals(tv.maTV) ? "selected"
								: ""%>>
											<%=tv.tenTV%>
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