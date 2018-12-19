<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="timKiemModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel">Tìm kiếm thông
					tin</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="timKiem<%=tenLop%>.action">
				<div class="modal-body">
					<%
// 						int n = 4;
					%>
					<div class="form-group">
						<label> Tìm kiếm theo </label><select name="timKiemTheo"
							class="form-control">
							<%
								for (int i = 0; i < tk_value.length; i++) {
							%>
							<option value=<%=tk_value[i]%>><%=tk_show[i]%></option>
							<%
								}
							%>
						</select>
					</div>
					<div class="form-group">
						<label> Từ khóa: </label><input class="form-control" type="text"
							name="tuKhoa" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng cửa sổ</button>
					<button type="submit" class="btn btn-primary">Tìm kiếm</button>
				</div>
			</form>
		</div>
	</div>
</div>