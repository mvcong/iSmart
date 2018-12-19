<%@page import="iCore.model.TaiKhoanThanhVien"%>
<%@page import="iCore.model.TaiKhoanNhanVien"%>
<%@page import="iCore.model.TaiKhoan"%>
<%@page import="iCore.model.ThanhVien"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../iPartial/code-header.jsp"%>

<%
	String action = "";
	// kiểm tra xem tài khoản đang đăng nhập là của sinh viên hay nhân viên
	String maDangNhap = session.getAttribute("maDangNhap") != null
			? session.getAttribute("maDangNhap").toString()
			: "";
	TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute("taiKhoanDangNhap");

	if (taiKhoan != null && taiKhoan instanceof TaiKhoanThanhVien)
		action = "doiMatKhauTaiKhoanSinhVien.action";
	if (taiKhoan != null && taiKhoan instanceof TaiKhoanNhanVien)
		action = "doiMatKhauTaiKhoanNhanVien.action";
%>
<div class="container-fluid">
	<div class="col-md-6 col-md-push-3">
		<div class="panel panel-primary">
			<div class="panel-heading">
				Đổi mật khẩu
				<p style="color: red; display: inline;"><%=!msg.equals("") ? " [" + msg + "]" : ""%></p>
			</div>
			<div class="panel-body">
				<form action="<%=action%>" method="post" class="form-group">
					<div class="form-group">
						<label>Mật khẩu hiện tại <span class="text-danger">(*)</span></label>
						<input name="matKhauHienTai" class="form-control" type="password"
							required="required" />
					</div>
					<div class="form-group">
						<label>Mật khẩu mới <span class="text-danger">(*)</span>
						</label> <input name="matKhau" id="password" class="form-control"
							type="password" onkeyup='check();' required="required" />
					</div>
					<div class="form-group">
						<label>Nhập lại mật khẩu mới <span class="text-danger">(*)</span>
						</label> <input type="password" class="form-control" name="matKhau1"
							id="confirm_password" onkeyup='check();' required="required" />
					</div>
					<span id='message'></span> <input type="submit"
						class="btn btn-block btn-primary" value="Đổi mật khẩu"
						class="form-control" id="submit1">
				</form>
			</div>
		</div>
	</div>
</div>
<%
	session.setAttribute("msg", null);
%>

<script type="text/javascript">
	var check = function() {
		if (document.getElementById('password').value == document
				.getElementById('confirm_password').value) {
			document.getElementById('message').style.color = 'green';
			document.getElementById('message').innerHTML = 'Mật khẩu khớp';
			document.getElementById('submit1').disabled = false;
		} else {
			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'Mật khẩu không khớp';
			document.getElementById('submit1').disabled = true;
		}
	}
</script>