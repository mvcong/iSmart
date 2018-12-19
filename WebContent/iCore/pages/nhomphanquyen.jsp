<%@page import="java.util.HashSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="iCore.model.ChucNang"%>
<%@page import="iCore.modelDAO.DAO_ChucNang"%>
<%@page import="iCore.model.NhomPhanQuyen"%>
<%@page import="java.util.ArrayList"%>
<%@page import="iCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "NhomPhanQuyen";
	String tenTrang = "Quản lý Nhóm Phân Quyền";
	String trangDanhSach = "index.jsp?p=iCore/pages/nhomphanquyens.jsp";
	String[] tk_value = {"maNhomPhanQuyen", "tenNhomPhanQuyen", "chucNang"};
	String[] tk_show = {"Mã nhóm phân quyền", "Tên nhóm phân quyền", "Chức năng"};
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

	NhomPhanQuyen obj = session.getAttribute("obj") != null
			? (NhomPhanQuyen) session.getAttribute("obj")
			: null;
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
									<label>Mã nhóm phân quyền</label> <input class="form-control"
										name="maNhomPhanQuyen"
										value="<%=(obj != null ? obj.getMaNhomPhanQuyen() + "" : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên nhóm phân quyền</label> <input class="form-control"
										name="tenNhomPhanQuyen"
										value="<%=(obj != null ? obj.getTenNhomPhanQuyen() + "" : "")%>"
										<%=(modeView ? " readonly " : "")%>> <input hidden>
								</div>
								<div class="form-group">
									<label>Chức năng </label><br/>
									<%
										String ls_MaChucNang = "";
										Set<ChucNang> chucNangSet = new HashSet<>();
										if (obj != null && obj.getChucNangs() != null)
											chucNangSet = obj.chucNangs;
										for (Iterator<ChucNang> it = chucNangSet.iterator(); it.hasNext();)
											ls_MaChucNang += it.next().maChucNang.toString() + ",";
										System.out.println("ls_MaChucNang = " + ls_MaChucNang);

										ObjectDAO objdao = new DAO_ChucNang();
										ArrayList<ChucNang> listChucNang = objdao.listAll();
										for (ChucNang cn : listChucNang) {
									%>
									<input  onclick="checkedFunction(this)" type="checkbox"
										id="<%=cn.getMaChucNang()%>" value="<%=cn.getMaChucNang()%>"
										<%=(modeView ? " disabled " : "")%>
										<%=ls_MaChucNang.contains(cn.getMaChucNang()) ? "checked" : ""%>><%=cn.getTenHienThi()%><br>
									<%
										}
									%>

									<input name="maChucNang" id="maChucNangsz"
										value="<%=ls_MaChucNang%>" hidden="">
									<script type="text/javascript">
										function checkedFunction(arg) {
											var x = document
													.getElementById("maChucNangsz");
											if (arg.checked == true) {
												x.value = x.value + ",";
												x.value = x.value + arg.id;
											}
											if (arg.checked == false) {
												x.value = x.value.replace(","
														+ arg.id, "");
											}
										}
									</script>

								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group">
										<label>Mô tả</label>
										<textarea class="form-control" cols="80" id="editor1" rows="5"
											name="moTa" <%=(modeView ? " readonly " : "")%>><%=(obj != null ? obj.getMoTa() + "" : "")%></textarea>
									</div>
									<div class="form-group">
										<label>Ghi chú</label>
										<textarea class="form-control" cols="80" id="editor2" rows="5"
											name="ghiChu" <%=(modeView ? " readonly " : "")%>><%=(obj != null ? obj.getGhiChu() + "" : "")%></textarea>
									</div>
								</div>
							</div>
							<div class="panel-footer" style="text-align: left;">
								<div class="col-md-5"></div>
								<div class="col-md-7">
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