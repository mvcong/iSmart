<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function thayDoiMyFileFileName() {
		var x = document.getElementById("ten");
		x.value = x.value.toUpperCase();

		var b = document.getElementById("myFileName");
		b.value = x.value;

	}
</script>
<div class="modal fade" id="nhapExcelModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel">Nhập dữ liệu từ
					excel</h3>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="import<%=tenLop%>.action" method="post"
				enctype="multipart/form-data">
				<div class="modal-body">
					<label>Chọn tệp</label><input type="file" class="form-control"
						name="myFile" required="required"
						accept="application/vnd.ms-excel"
						onclick="thayDoiMyFileFileName()"> <input type="hidden"
						value="<%=tenLop%>" id="ten" name="tenLop"> <input
						type="hidden" id="myFileName" name="myFileName"></input> <input
						type="hidden" name="myFolder_iCore"
						value="<%=request.getRealPath("iCore/upload")%>" /> 
<!-- 						<input -->
<!-- 						type="hidden" name="myFolder_kTXSm1" -->
<%-- 						value="<%=request.getRealPath("kTXSm1/upload")%>" /> <input --%>
<!-- 						type="hidden" name="myFolder_kTXSm2" -->
<%-- 						value="<%=request.getRealPath("kTXSm2/upload")%>" /> <input --%>
<!-- 						type="hidden" name="myFolder_kTXSm3" -->
<%-- 						value="<%=request.getRealPath("kTXSm3/upload")%>" /> --%>
<!-- 						<input -->
<!-- 						type="hidden" name="myFolder_kTXSm4" -->
<%-- 						value="<%=request.getRealPath("kTXSm4/upload")%>" /> --%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng cửa sổ</button>
					<button type="submit" class="btn btn-primary">Nhập dữ liệu</button>
				</div>
			</form>
		</div>
	</div>
</div>