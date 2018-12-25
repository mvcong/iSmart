<%@page import="iCore.dao.SanPhamDAO"%>
<%@page import="sanpham.LoaiSanPham"%>
<%@page import="iCore.dao.LoaiSanPhamDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sanpham.SanPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Shop GYM</title>

<!-- Bootstrap core CSS -->
<link href="content/product/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="content/product/css/shop-homepage.css" rel="stylesheet">

</head>

<body>
	<%
		LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
		SanPhamDAO sanPhamDAO = new SanPhamDAO();
		String maLoai = "";
		if (request.getParameter("loaisanpham") != null) {
			maLoai = request.getParameter("loaisanpham");
		}
	%>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="product.jsp">Shop GYM</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="home.jsp">Trang
						chủ <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="giohang.jsp">Giỏ
						hàng</a></li>

			</ul>
		</div>
	</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				<h4 class="my-4">Loại Sản Phẩm</h4>
				<div class="list-group">
					<ul id="loaisanpham">
						<%
							for (LoaiSanPham lsp : loaiSanPhamDAO.getListLoaiSanPham()) {
						%>

						<li><a href="product.jsp?loaisanpham=<%=lsp.getMaLoai()%>"><%=lsp.getTenLoai()%></a></li>

						<%
							}
						%>

					</ul>
				</div>

			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				<form name="viewsanpham" method="post" action="">
					<div class="row">
						<%
							for (SanPham sp : sanPhamDAO.getListSanPhamByLoaiSanPham(maLoai)) {
						%>

						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<div>
									<a href="chitietsanpham.jsp"><img class="card-img-top"
										src="<%=sp.getAnhSP()%>" alt="<%=sp.getTenSP()%>"
										style="height: 250px; width: 250px"></a>
								</div>
								<div class="card-body">
									<p class="">
										<a href="#"><%=sp.getTenSP()%></a>
									</p>
								</div>
								<div class="card-footer">
									<div align="left">
										<input type="hidden" name="action" value="add"> <input
											type="submit" name="addToCart" value="Add To Cart">
									</div>
									<div align="right">
										<p>
											<span><%=sp.getGiaBan()%></span><span>::VNĐ</span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</form>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">
			Trường Đại Học Giao Thông Vận Tải phân hiệu tại Thành Phố Hồ Chí Minh</br>Hệ
			Thống Quản Lý Phòng Tập GYM </br>SVTH : Mai Văn Công - 5551074008
		</p>
	</div>
	<!-- /.container --> </footer>

	<!-- Bootstrap core JavaScript -->
	<script src="content/product/vendor/jquery/jquery.min.js"></script>
	<script
		src="content/product/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
