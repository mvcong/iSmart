<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="row" style="align-items: center;">
			<div class="col-md-3">
				<form class="form-inline">
					<script type="text/javascript">
						function myFunction() {
							var recordPerPage = document
									.getElementById("recordPerPage").value;
							var p1 = document.getElementById("p1").value;
							window.location.href = p1 + "&recordPerPage="
									+ recordPerPage;

						}
					</script>
					<input type="hidden" id="p1" value=<%=p1%> /> <label>Số </label>
					lượng: <select class="form-control" name="recordPerPage"
						id="recordPerPage" onchange="myFunction()">
						<option <%if (s_recordPerPage.equals("10")) {%>
							selected="selected" <%}%>>10</option>
						<option <%if (s_recordPerPage.equals("50")) {%>
							selected="selected" <%}%>>50</option>
						<option <%if (s_recordPerPage.equals("100")) {%>
							selected="selected" <%}%>>100</option>
					</select>
				</form>
			</div>
			<div class="col-md-9">
				<div class="row pull-right" style="margin-right: 10px;">
					<!-- 					<div class="col-md-2" style="padding: 1px"> -->
					
					<a type="submit" class="btn  btn-default"
						href="themMoi<%=tenLop%>.action" style="text-align: left;"
						id="nutThemMoi"> <img src="content/images/new-32.png"
						width="16px" height="16px" /> &nbsp; Thêm mới 
						
						<a type="submit"
						class="btn  btn-default" href="taiLai<%=tenLop%>.action"
						style="text-align: left;" style="width: 100%" id="nutTaiLai">
							<img src="content/images/refresh-32.png" width="16px"
							height="16px" /> &nbsp; Tải lại
					</a> <a type="button" class="btn  btn-default"
						style="text-align: left;" data-toggle="modal"
						data-target="#timKiemModal"> <img
							src="content/images/search-32.png" width="16px" height="16px" />
							&nbsp; Tìm kiếm
					</a> <!-- 					</div> --> <!-- 					<div class="col-md-2" style="padding: 1px"> -->
						<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
</div>
<%
	if (session.getAttribute("msg") != null) {
		session.removeAttribute("msg");
	}
%>

