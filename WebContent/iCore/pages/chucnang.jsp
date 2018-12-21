<%@page import="java.util.ArrayList"%>
<%@page import="iCore.modelDAO.DAO_ChucNang"%>
<%@page import="iCore.dao.ObjectDAO"%>
<%@page import="iCore.model.ChucNang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "ChucNang";
	String tenTrang = "Quản lý Chức Năng";
	String trangDanhSach = "index.jsp?p=iCore/pages/chucnangs.jsp";
	String[] tk_value = { "maChucNang", "tenHienThi", "duongDan", "chucNangCha" };
	String[] tk_show = { "Mã chức năng", "Tên hiển thị", "Đường dẫn", "Chức năng cha" };
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

	ChucNang obj = session.getAttribute("obj") != null ? (ChucNang) session.getAttribute("obj") : null;
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
<!-- /.row -->
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
							<div class="col-lg-6">
								<div class="form-group">
									<label>Mã chức năng</label> <input class="form-control"
										name="maChucNang"
										value="<%=(obj != null ? obj.getMaChucNang() + "" : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên hiển thị</label> <input class="form-control"
										name="tenHienThi"
										value="<%=(obj != null ? obj.getTenHienThi() + "" : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Đường dẫn</label> <input class="form-control"
										name="duongDan"
										value="<%=(obj != null ? obj.getDuongDan() + "" : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Hình ảnh</label> <input class="form-control"
										name="hinhAnh"
										value="<%=(obj != null ? obj.getHinhAnh() + "" : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Chức năng cha</label> <select class="form-control"
										name="maChucNangCha" <%=(modeView ? " disabled " : "")%>>
										<option value=""></option>
										<%
											ObjectDAO objdao = new DAO_ChucNang();
											ArrayList<ChucNang> listChucNang = objdao.listAll();
											for (ChucNang cn : listChucNang) {

												if (obj != null && cn.compareTo(obj) != 0) {
										%>
										<option value="<%=cn.maChucNang%> "
											<%=obj != null && obj.getChucNangCha() != null
							&& obj.getChucNangCha().getMaChucNang().equals(cn.maChucNang) ? "selected" : ""%>>
											<%=cn.tenHienThi%>
										</option>
										<%
											} else {
										%>
										<option value="<%=cn.maChucNang%>">
											<%=cn.tenHienThi%>
										</option>
										<%
											}
											}
										%>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Mô tả</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="moTa" <%=(modeView ? " readonly " : "")%>><%=(obj != null && obj.getMoTa() != null ? obj.getMoTa() + "" : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Ghi chú</label>
									<textarea class="form-control" cols="80" id="editor2" rows="5"
										name="ghiChu" <%=(modeView ? " readonly " : "")%>><%=(obj != null && obj.getGhiChu() != null ? obj.getGhiChu() + "" : "")%></textarea>
								</div>
							</div>
						</div>
						<div class="panel-footer" style="text-align: left;">
							<div class="col-md-12"></div>
							<div class="col-md-12">
								<%@ include file="../../iPartial/processform.jsp"%>
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