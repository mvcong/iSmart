<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href=" ">
<title>GYM Smart</title>
<link rel="icon" type="image/png"
	href="login_css/images/icons/favicon.ico" />

<!-- Bootstrap core CSS -->
<link href="content/home/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="content/home/css/custom.css" rel="stylesheet">

<!-- Helper Styles -->
<link href="content/home/css/loaders.css" rel="stylesheet">
<link href="content/home/css/swiper.min.css" rel="stylesheet">
<link rel="stylesheet" href="content/home/css/animate.min.css">
<link rel="stylesheet" href="content/home/css/nivo-lightbox.css">
<link rel="stylesheet"
	href="content/home/css/nivo_themes/default/default.css">
<!-- Font Awesome Style -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">


<%
	String taiKhoanDangNhap = request.getSession().getAttribute("maDangNhap") + "";
	taiKhoanDangNhap = taiKhoanDangNhap.equals("null") ? "" : taiKhoanDangNhap;
	System.out.println(taiKhoanDangNhap);
%>
</head>
<body>
	<div class="loader loader-bg">
		<div class="loader-inner ball-clip-rotate-pulse">
			<div></div>
			<div></div>
		</div>
	</div>

	<!-- Top Navigation -->
	<nav
		class="navbar navbar-toggleable-md mb-4 top-bar navbar-static-top sps sps--abv">
		<div class="container">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarCollapse1"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="#">G-Y-M<span>Smart</span></a>
			<div class="collapse navbar-collapse" id="navbarCollapse1">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="trangchu.jsp">Trang chủ <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="index.jsp">Trang
							quản lý</a></li>
					<li class="nav-item"><a class="nav-link" href="thongbao.jsp">Thông
							báo</a></li>
					<li class="nav-item"><a class="nav-link" href="dangkytap.jsp">Đăng
							ký tập</a></li>
					<li class="nav-item"><a class="nav-link"
						href="trangsanpham.jsp">Cửa hàng</a></li>
					<li class="nav-item">
						<%
							if (!taiKhoanDangNhap.equals("")) {
						%> <a href="dangXuat.action" class="nav-link"><%=taiKhoanDangNhap%></a>
						<%
							} else {
						%><a href="dangnhap.jsp" class="nav-link">Đăng nhập</a> <%
 	}
 %>

					</li>
					<li class="nav-item"><a class="nav-link" href="dangky.jsp">Đăng
							ký</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- Swiper Silder
    ================================================== -->
	<!-- Slider main container -->
	<div class="swiper-container main-slider" id="myCarousel">
		<div class="swiper-wrapper">
			<div class="swiper-slide slider-bg-position"
				style="background: url('content/home/img/gym1.jpg')"
				data-hash="slide1"></div>
			<div class="swiper-slide slider-bg-position"
				style="background: url('content/home/img/gym2.jpg')"
				data-hash="slide2"></div>
			<div class="swiper-slide slider-bg-position"
				style="background: url('content/home/img/gym3.jpg')"
				data-hash="slide3"></div>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Navigation -->
		<div class="swiper-button-prev">
			<i class="fa fa-chevron-left"></i>
		</div>
		<div class="swiper-button-next">
			<i class="fa fa-chevron-right"></i>
		</div>
	</div>
	<div class="container" >
		<div class="row" style="height: 200px; width: 200px">
			<div class="col-md-12">

				<a href="dangkythang.jsp" class="btn btn-primary"> Đăng ký tập
					tháng <i class="fa fa-check"></i>
				</a> <a href="dangkyngay.jsp" class="btn btn-primary"> Đăng ký tập
					ngày <i class="fa fa-check"></i>
				</a>

			</div>
		</div>
	</div>


	<footer>
		<div class="container">
			<div class="row">
				<div>
					<p style="color: white;">Phát triển dự án: Sinh viên Mai Văn
						Công & GVHD</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="content/home/js/jquery.min.js"></script>
	<script src="content/home/js/bootstrap.min.js"></script>
	<script src="content/home/js/scrollPosStyler.js"></script>
	<script src="content/home/js/swiper.min.js"></script>
	<script src="content/home/js/isotope.min.js"></script>
	<script src="content/home/js/nivo-lightbox.min.js"></script>
	<script src="content/home/js/wow.min.js"></script>
	<script src="content/home/js/core.js"></script>

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
