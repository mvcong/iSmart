<%@page import="iCore.model.ThanhVien"%>
<%@page import="iCore.modelDAO.DAO_ThanhVien"%>
<%@page import="iCore.util.Util_Date"%>
<%@page import="iCore.model.TheThanhVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "TheThanhVien";
	String tenTrang = "Quản lý thẻ thành viên";
	String trangDanhSach = "index.jsp?p=iCore/pages/thethanhviens.jsp";
	String[] tk_value = {"maThe", "ngayTao", "ngayKT", "gioBD", "gioKT", "loaiThe", "thanhVien"};
	String[] tk_show = {"Mã thẻ", "Ngày bắt đầu", "Ngày kết thúc", "Giờ bắt đầu", "Giờ kết thúc", "Loại thẻ",
			"Thành viên"};
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
							<%@ include file="../../iPartial/processform.jsp"%>
						</div>
					</div>
				</div>
				<div id="printDiv">
					<div class="panel-body" >
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
										<label>Ngày bắt đầu</label> <input class="form-control"
											name="ngayTao" type="date"
											value="<%=(obj != null && obj.getNgayTao() != null ? Util_Date.dateToString(obj.getNgayTao()) : "")%>"
											<%=(modeView ? " readonly " : "")%>>
									</div>
									<div class="form-group">
										<label>Ngày kết thúc</label> <input class="form-control"
											name="ngayKT" type="date"
											value="<%=(obj != null && obj.getNgayKT() != null ? Util_Date.dateToString(obj.getNgayKT()) : "")%>"
											<%=(modeView ? " readonly " : "")%>>
									</div>
									<div class="form-group">
										<label>Giờ bắt đầu *</label> <select class="form-control"
											<%=(modeView ? " disabled " : "")%> name="gioBD">
											<option></option>
											<option value="8h-AM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>8h-AM</option>
											<option value="9h-AM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>9h-AM</option>
											<option value="10h-AM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>10h-AM</option>
											<option value="11h-AM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>11h-AM</option>
											<option value="12h-AM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>12h-AM</option>
											<option value="13h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>13h-PM</option>
											<option value="14h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>14h-PM</option>
											<option value="15h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>15h-PM</option>
											<option value="16h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>16h-PM</option>
											<option value="17h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>17h-PM</option>
											<option value="18h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>18h-PM</option>
											<option value="19h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>19h-PM</option>
											<option value="20h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>20h-PM</option>
										</select>
									</div>

									<div class="form-group">
										<label>Giờ kết thúc *</label> <select class="form-control"
											<%=(modeView ? " disabled " : "")%> name="gioKT">
											<option></option>
											<option value="9h-AM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>9h-AM</option>
											<option value="10h-AM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>10h-AM</option>
											<option value="11h-AM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>11h-AM</option>
											<option value="12h-AM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>12h-AM</option>
											<option value="13h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>13h-PM</option>
											<option value="14h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>14h-PM</option>
											<option value="15h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>15h-PM</option>
											<option value="16h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>16h-PM</option>
											<option value="17h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>17h-PM</option>
											<option value="18h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>18h-PM</option>
											<option value="19h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>19h-PM</option>
											<option value="20h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>20h-PM</option>
											<option value="21h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>21h-PM</option>
											<option value="22h-PM"
												<%=obj != null && obj.getGioBD() != null && obj.gioBD.equals("8h-AM") ? "selected" : ""%>>22h-PM</option>
										</select>
									</div>
									<div class="form-group">
										<label>Hạn thẻ</label> <input class="form-control" name="hsd"
											value="<%=(obj != null && obj.getHsd() != null ? obj.getHsd() : "")%>"
											<%=(modeView ? " readonly " : "")%>>
									</div>
									<div class="form-group">
										<label>Loại thẻ</label> <input class="form-control"
											name="loaiThe"
											value="<%=(obj != null && obj.getLoaiThe() != null ? obj.getLoaiThe() : "")%>"
											<%=(modeView ? " readonly " : "")%>>
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