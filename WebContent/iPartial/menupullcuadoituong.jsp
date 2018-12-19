<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="pull-center">
	<div class="btn-group">
		<button type="button" class="btn btn-default btn-xs dropdown-toggle"
			data-toggle="dropdown">
			<img src="content/images/menu-16.png" /> Chọn chức năng <span
				class="caret"></span>
		</button>
		<ul class="dropdown-menu pull-right" role="menu">
			<li><a href="xemChiTiet<%=tenLop%>.action?maobj=<%=maDoiTuong%>"><img
					src="content/images/detail-16.png" />&nbsp;&nbsp; Xem chi tiết</a></li>
			<li><a
				href="xemChiTietVaChinhSua<%=tenLop%>.action?maobj=<%=maDoiTuong%>"><img
					src="content/images/edit-16.png" />&nbsp;&nbsp; Chỉnh sửa</a></li>
			<li><a id="<%=tenLop%>" title="<%=maDoiTuong%>"
				target="<%=tenDoiTuong%>" onclick="confirmDelete(this)"><img
					src="content/images/delete-16.png" />&nbsp;&nbsp; Xóa</a></li>
		</ul>
	</div>
</div>