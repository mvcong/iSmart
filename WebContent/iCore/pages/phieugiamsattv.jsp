<%@page import="iCore.model.ThanhVien"%>
<%@page import="iCore.modelDAO.DAO_ThanhVien"%>
<%@page import="iCore.model.NhanVien"%>
<%@page import="iCore.modelDAO.DAO_NhanVien"%>
<%@page import="iCore.util.Util_Date"%>
<%@page import="iCore.model.PhieuGiamSatTV"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "PhieuGiamSatTV";
	String tenTrang = "Quản lý phiếu giám sát thành viên";
	String trangDanhSach = "index.jsp?p=iCore/pages/phieugiamsattvs.jsp";
	String[] tk_value = {"maPGS", "tenPGS", "ngayDB", "ngayKT", "noiDung", "thanhVien", "nhanVien"};
	String[] tk_show = {"Mã phiếu giám sát thành viên", "Tên phiếu giám sát thành viên", "Ngày bắt đầu giám sát", "Ngày kết thúc giám sát", "Nội dung", "Thành viên",
			 "Nhân viên"};
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

	PhieuGiamSatTV obj = session.getAttribute("obj") != null ? (PhieuGiamSatTV) session.getAttribute("obj") : null;
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
									<label>Mã phiếu giám sát</label> <input class="form-control" id="maPGS"
										name="maPGS" onblur="thayDoiMyFileFileName()"
										value="<%=(obj != null && obj.getMaPGS() != null ? obj.getMaPGS() : "")%>"
																<%=(modeView || modeEdit ? " readonly " : "")%>> 
								</div>
								<div class="form-group">
									<label>Tên phiếu chi</label> <input class="form-control"
										name="tenPGS"
										value="<%=(obj != null && obj.getTenPGS() != null ? obj.getTenPGS() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày bắt đầu</label> <input class="form-control"
										name="ngayBD" type="date"
										value="<%=(obj != null && obj.getNgayBD() != null ? Util_Date.dateToString(obj.getNgayBD()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày kết thúc</label> <input class="form-control"
										name="ngayKT" type="date"
										value="<%=(obj != null && obj.getNgayKT() != null ? Util_Date.dateToString(obj.getNgayKT()) : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Nội dung</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="noiDung" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getNoiDung() != null ? obj.getNoiDung() : "")%></textarea>
								</div>
								
								<div class="form-group">
									<label>Huấn luyện viên</label> <select class="form-control"
										name="maNV" <%=(modeView ? " disabled " : "")%>>
										<option value=""></option>
										<%
											ObjectDAO objdao = new DAO_NhanVien();
											ArrayList<NhanVien> listNhanVien = objdao.listAll();
											for (NhanVien dv : listNhanVien) {
										%>
										<option value="<%=dv.maNV%> "
											<%=obj != null && obj.getNhanVien() != null && obj.getNhanVien().maNV.equals(dv.maNV) ? "selected"
								: ""%>>
											<%=dv.tenNV%>
										</option>
										<%
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<label>Thành viên</label> <select class="form-control"
										name="maTV" <%=(modeView ? " disabled " : "")%>>
										<option value=""></option>
										<%
											ObjectDAO objdao1 = new DAO_ThanhVien();
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