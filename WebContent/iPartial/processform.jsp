<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	if (!modeView) {
%>
<div class="row" style="text-align: right;">
	<!-- 	<div class="col-md-3" style="padding: 1px"> -->
	<a href="<%=trangDanhSach%>" class="btn btn-default" id="btntrangdanhsach"> <img
		src="content/images/back-32.png" width="16px" height="16px"></img>
		&nbsp; Quay về trang danh sách
	</a>
	<!-- 	</div> -->
	<!-- 	<div class="col-md-3" style="padding: 1px"> -->
	<button type="reset" class="btn btn-default" id="btntaomoi">
		<img src="content/images/reset-32.png" width="16px" height="16px" />
		&nbsp; Nhập lại
	</button>
	<!-- 	</div> -->
	<!-- 	<div class="col-md-3" style="padding: 1px"> -->
	<button type="submit" class="btn btn-default">
		<img src="content/images/save-32.png" width="16px" height="16px" />
		&nbsp; Lưu dữ liệu nhập
	</button>
	<!-- 	</div> -->
	<!-- 	thêm 14/05 --- thiện -->
	<!-- 	<div class="col-md-3" style="padding: 1px" > -->
	<button type="submit" class="btn btn-default" name="bt_in" value="In"
		id="btnxxx" formtarget="_blank">
		<img src="content/images/save-32.png" width="16px" height="16px" />
		&nbsp; In phiếu biên nhận
	</button>
	<!-- 	</div> -->
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