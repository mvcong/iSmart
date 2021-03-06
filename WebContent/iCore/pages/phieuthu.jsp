<%@page import="java.util.Date"%>
<%@page import="iCore.modelDAO.DAO_NhanVien"%>
<%@page import="iCore.model.NhanVien"%>
<%@page import="iCore.util.Util_Date"%>
<%@page import="iCore.model.PhieuThu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "PhieuThu";
	String tenTrang = "Quản lý phiếu thu";
	String trangDanhSach = "index.jsp?p=iCore/pages/phieuthus.jsp";
	String[] tk_value = {"maPT", "tenPT", "thanhPhan", "soLuong", "donGia", "thanhTien", "ngayTao", "nhanVien"};
	String[] tk_show = {"Mã phiếu thu", "Tên phiếu thu", "Thành phần", "Số lượng", "Đơn giá", "Thành tiền",
			"Ngày tạo", "Nhân viên"};
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

	PhieuThu obj = session.getAttribute("obj") != null ? (PhieuThu) session.getAttribute("obj") : null;
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
				<div class="panel-body" id="printDiv">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label>Mã phiếu thu</label> <input class="form-control"
										id="maPT" name="maPT" onblur="thayDoiMyFileFileName()"
										value="<%=(obj != null && obj.getMaPT() != null ? obj.getMaPT() : System.currentTimeMillis())%>"
										<%=(modeView || modeEdit ? " readonly " : "")%> readonly
										required="required">
								</div>
								<div class="form-group">
									<label>Tên phiếu thu</label> <input class="form-control"
										name="tenPT"
										value="<%=(obj != null && obj.getTenPT() != null ? obj.getTenPT() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày tạo</label> <input class="form-control"
										name="s_ngayTao" type="date"
										value="<%=(obj != null && obj.getNgayTao() != null ? Util_Date.dateToString(obj.getNgayTao())
					: Util_Date.dateToString(new Date()))%>"
										<%=(modeView ? " readonly " : "")%> readonly
										required="required">
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
									<label>Thành phần</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="thanhPhan" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getThanhPhan() != null ? obj.getThanhPhan() : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Đơn giá</label> <input class="form-control"
										name="donGia"
										value="<%=(obj != null && obj.getDonGia() > 0 ? obj.getDonGia() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Thành tiền</label> <input class="form-control"
										name="thanhTien"
										value="<%=(obj != null && obj.getThanhTien() > 0 ? obj.getThanhTien() : "")%>"
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