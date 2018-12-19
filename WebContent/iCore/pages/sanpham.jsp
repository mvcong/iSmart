<%@page import="iCore.model.NhanVien"%>
<%@page import="iCore.modelDAO.DAO_NhanVien"%>
<%@page import="iCore.util.Util_Date"%>
<%@page import="iCore.model.SanPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "SanPham";
	String tenTrang = "Quản lý sản phẩm";
	String trangDanhSach = "index.jsp?p=iCore/pages/sanphams.jsp";
	String[] tk_value = {"maSP", "tenSP", "loaiSP", "anhSP", "soLuong", "giaSP", "nhanVien"};
	String[] tk_show = {"Mã sản phẩm", "Tên sản phẩm", "Loại sản phẩm", "Ảnh", "Số lượng", "Giá", "Nhân viên"};
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

	SanPham obj = session.getAttribute("obj") != null ? (SanPham) session.getAttribute("obj") : null;
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
									<label>Mã sản phẩm</label> <input class="form-control"
										id="maSP" name="maSP" onblur="thayDoiMyFileFileName()"
										value="<%=(obj != null && obj.getMaSP() != null ? obj.getMaSP() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên sản phẩm</label> <input class="form-control"
										name="tenSP"
										value="<%=(obj != null && obj.getTenSP() != null ? obj.getTenSP() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Loại sản phẩm</label> <input class="form-control"
										name="loaiSP"
										value="<%=(obj != null && obj.getLoaiSP() != null ? obj.getLoaiSP() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Hình ảnh</label> <input class="form-control"
										name="myFile"
										value="<%=(obj != null && obj.getAnhSP() != null ? obj.getAnhSP() : "")%>"
										type="<%=(modeView ? "hidden" : "file")%>"><img
										src="<%=obj != null && obj.getAnhSP() != null && modeView ? "iCore/images/products/" + obj.getAnhSP() : ""%>"
										height="<%=modeView ? 135 : 1%>"
										width="<%=modeView ? 135 : 1%>">
								</div>
								<div class="form-group">
									<label>Link sản phẩm</label> <input class="form-control"
										name="linkSP"
										value="<%=(obj != null && obj.getLinkSP() != null ? obj.getLinkSP() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Số lượng</label> <input class="form-control"
										name="soLuong"
										value="<%=(obj != null && obj.getSoLuong() != null ? obj.getSoLuong() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Đơn vị tính</label> <input class="form-control"
										name="donVi"
										value="<%=(obj != null && obj.getDonVi() != null ? obj.getDonVi() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày nhập hàng</label> <input class="form-control"
										name="ngayTao" type="date"
										value="<%=(obj != null && obj.getNgayNhapHang() != null ? Util_Date.dateToString(obj.getNgayNhapHang())
					: "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>

								<div class="form-group">
									<label>Hạn sử dụng</label> <input class="form-control"
										name="hsd"
										value="<%=(obj != null && obj.getHsd() != null ? obj.getHsd() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Giá nhập</label> <input class="form-control"
										name="giaSP"
										value="<%=(obj != null && obj.getGiaSP() > 0 ? obj.getGiaSP() : "")%>"
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
								<input type="hidden" name="s_anhSP"
							value="<%=obj != null ? obj.getAnhSP() : ""%>">
						<input type="hidden" id="myFileName" name="myFileName"></input> <input
							type="hidden" name="myFolder_iCore"
							value="<%=request.getRealPath("iCore/images/products")%>" />
						<div class="panel-footer" style="text-align: left;">
							<div class="col-md-5"></div>
							<div class="col-md-12">
								<%@ include file="../../iPartial/processform.jsp"%>
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