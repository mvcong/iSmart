<%@page import="sanpham.model.LoaiSanPham"%>
<%@page import="sanpham.dao.LoaiSanPhamDAO"%>
<%@page import="sanpham.model.SanPham"%>
<%@page import="sanpham.model.GioHang"%>
<%@page import="sanpham.dao.SanPhamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
<meta charset="utf-8">
<title>GYM SHOP</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta content="Metronic Shop UI description" name="description">
<meta content="Metronic Shop UI keywords" name="keywords">
<meta content="keenthemes" name="author">

<meta property="og:site_name" content="-CUSTOMER VALUE-">
<meta property="og:title" content="-CUSTOMER VALUE-">
<meta property="og:description" content="-CUSTOMER VALUE-">
<meta property="og:type" content="website">
<meta property="og:image" content="-CUSTOMER VALUE-">
<!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">

<link rel="shortcut icon" href="favicon.ico">

<!-- Fonts START -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all"
	rel="stylesheet" type="text/css">
<!-- Fonts END -->

<!-- Global styles START -->
<link
	href="content/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="content/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link href="content/assets/plugins/fancybox/source/jquery.fancybox.css"
	rel="stylesheet">
<link href="content/assets/plugins/owl.carousel/assets/owl.carousel.css"
	rel="stylesheet">
<link href="content/assets/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css">
<link
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css">
<!-- for slider-range -->
<link href="content/assets/plugins/rateit/src/rateit.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin styles END -->

<!-- Theme styles START -->
<link href="content/assets/pages/css/components.css" rel="stylesheet">
<link href="content/assets/corporate/css/style.css" rel="stylesheet">
<link href="content/assets/pages/css/style-shop.css" rel="stylesheet"
	type="text/css">
<link href="content/assets/corporate/css/style-responsive.css"
	rel="stylesheet">
<link href="content/assets/corporate/css/themes/red.css"
	rel="stylesheet" id="style-color">
<link href="content/assets/corporate/css/custom.css" rel="stylesheet">
<!-- Theme styles END -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var x_timer;
		$("#email").keyup(function(e) {
			clearTimeout(x_timer);
			var email = $(this).val();
			x_timer = setTimeout(function() {
				check_email_ajax(email);
			}, 1000);
		});

		function check_email_ajax(email) {
			$("#result").html('<img src="img/ajax-loader.gif"/>');
			$.post('CheckEmailServlet', {
				'email' : email
			}, function(data) {
				$("#result").html(data);
			});
		}

	});
</script>
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">

	<%
		LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
		SanPhamDAO sanPhamDAO = new SanPhamDAO();
		String maSP = "";
		if (request.getParameter("sanpham") != null) {
			maSP = request.getParameter("sanpham");
		}
		String maLoai = "";
		if (request.getParameter("loaisanpham") != null) {
			maLoai = request.getParameter("loaisanpham");
		}
		GioHang cart = (GioHang) session.getAttribute("cart");
		if (cart == null) {
			cart = new GioHang();
			session.setAttribute("cart", cart);
		}
	%>
	<!-- BEGIN HEADER -->
	<div class="header">
		<div class="container">
			<a class="site-logo" href="home.jsp">GYM Shop</a> <a
				href="javascript:void(0);" class="mobi-toggler"><i
				class="fa fa-bars"></i></a>

			<!-- BEGIN CART -->
			<div class="top-cart-block">
				<div class="top-cart-info">
					<a href="javascript:void(0);" class="top-cart-info-count"><%=cart.countItem()%></a>
					<a href="javascript:void(0);" class="top-cart-info-value">VNĐ<%=cart.totalCart()%></a>
				</div>
				<i class="fa fa-shopping-cart"></i>

				<div class="top-cart-content-wrapper">
					<div class="top-cart-content">
						<ul class="scroller" style="height: 250px;">
							<li><a href="shop-item.html"><img
									src="content/assets/pages/img/cart-img.jpg"
									alt="Rolex Classic Watch" width="37" height="34"></a> <span
								class="cart-content-count">x 1</span> <strong><a
									href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
								href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
							<li><a href="shop-item.html"><img
									src="content/assets/pages/img/cart-img.jpg"
									alt="Rolex Classic Watch" width="37" height="34"></a> <span
								class="cart-content-count">x 1</span> <strong><a
									href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
								href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
							<li><a href="shop-item.html"><img
									src="content/assets/pages/img/cart-img.jpg"
									alt="Rolex Classic Watch" width="37" height="34"></a> <span
								class="cart-content-count">x 1</span> <strong><a
									href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
								href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
							<li><a href="shop-item.html"><img
									src="content/assets/pages/img/cart-img.jpg"
									alt="Rolex Classic Watch" width="37" height="34"></a> <span
								class="cart-content-count">x 1</span> <strong><a
									href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
								href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
							<li><a href="shop-item.html"><img
									src="content/assets/pages/img/cart-img.jpg"
									alt="Rolex Classic Watch" width="37" height="34"></a> <span
								class="cart-content-count">x 1</span> <strong><a
									href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
								href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
							<li><a href="shop-item.html"><img
									src="content/assets/pages/img/cart-img.jpg"
									alt="Rolex Classic Watch" width="37" height="34"></a> <span
								class="cart-content-count">x 1</span> <strong><a
									href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
								href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
							<li><a href="shop-item.html"><img
									src="content/assets/pages/img/cart-img.jpg"
									alt="Rolex Classic Watch" width="37" height="34"></a> <span
								class="cart-content-count">x 1</span> <strong><a
									href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
								href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
							<li><a href="shop-item.html"><img
									src="content/assets/pages/img/cart-img.jpg"
									alt="Rolex Classic Watch" width="37" height="34"></a> <span
								class="cart-content-count">x 1</span> <strong><a
									href="shop-item.html">Rolex Classic Watch</a></strong> <em>$1230</em> <a
								href="javascript:void(0);" class="del-goods">&nbsp;</a></li>
						</ul>
						<div class="text-right">
							<a href="shop-shopping-cart.html" class="btn btn-default">View
								Cart</a> <a href="shop-checkout.html" class="btn btn-primary">Checkout</a>
						</div>
					</div>
				</div>
			</div>
			<!--END CART -->

			<!-- BEGIN NAVIGATION -->
			<div class="header-navigation">

				<ul>
					<li><a href="shop-item.html">Kids</a></li>
					<li><a href="shop-item.html">Kids</a></li>
					<li><a href="shop-item.html">Kids</a></li>
					<li><a href="shop-item.html">Kids</a></li>
					<li><a href="shop-item.html">Kids</a></li>
					<li><a href="shop-item.html">Kids</a></li>


					<li class="menu-search"><span class="sep"></span> <i
						class="fa fa-search search-btn"></i>
						<div class="search-box">
							<form action="#">
								<div class="input-group">
									<input type="text" placeholder="Search" class="form-control">
									<span class="input-group-btn">
										<button class="btn btn-primary" type="submit">Search</button>
									</span>
								</div>
							</form>
						</div></li>
					<!-- END TOP SEARCH -->
				</ul>

			</div>
			<!-- END NAVIGATION -->
		</div>
	</div>
	<!-- Header END -->

	<div class="title-wrapper">
		<div class="container">
			<div class="container-inner">
				<h1>
					<span>MEN</span> CATEGORY
				</h1>
				<em>Over 4000 Items are available here</em>
			</div>
		</div>
	</div>

	<div class="main">
		<div class="container">
			<!-- BEGIN SIDEBAR & CONTENT -->
			<div class="row margin-bottom-40">
				<!-- BEGIN SIDEBAR -->
				<!-- BEGIN CONTENT -->
				<div class="col-md-12 col-sm-12">
					<h1>Đăng ký thành viên</h1>
					<!-- BEGIN CHECKOUT PAGE -->
					<div class="panel-group checkout-page accordion scrollable"
						id="checkout-page">
						<!-- BEGIN PAYMENT ADDRESS -->
						<div class="panel-body row">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
									<label for="maTV">Mã thành viên <span class="require">*</span></label>
									<input type="text" name="maTV" id="maTV" class="form-control">
									<span></span>
								</div>
								<div class="form-group">
									<label for="tenTV">Họ và tên <span class="require">*</span></label>
									<input type="text" name="tenTV" id="tenTV" class="form-control">
									<span id="result"></span>
								</div>
								<div class="form-group">
									<label for="email">Email <span class="require">*</span></label>
									<input type="text" name="email" id="email" class="form-control">
									<span id="result"></span>
								</div>
								<div class="form-group">
									<label for="gioiTinh">Giới tính </label> <input type="text"
										name="gioiTinh" id="gioiTinh" class="form-control"> <span
										id="result"></span>
								</div>
								<div class="form-group">
									<label for="ngaySinh">Ngày sinh </label> <input type="text"
										name="ngaySinh" id="ngaySinh" class="form-control"> <span
										id="result"></span>
								</div>
								<div class="form-group">
									<label for="sDT">Số điện thoại</label> <input type="text"
										name="sDT" id="sDT" class="form-control"> <span></span>
								</div>
								<div class="form-group">
									<label for="diaChi">Địa chỉ </label> <input type="text"
										name="diaChi" id="diaChi" class="form-control"> <span
										id="result"></span>
								</div>
								<div>
									<input type="hidden" value="insert" name="command"> <input type="submit" value="Đăng ký"> 
								</div>
							</div>
						</div>

						<!-- END PAYMENT ADDRESS -->
					</div>
					<!-- END CHECKOUT PAGE -->
				</div>
				<!-- END CONTENT -->
			</div>
			<!-- END SIDEBAR & CONTENT -->
		</div>
	</div>
	<!-- BEGIN STEPS -->
	<div class="steps-block steps-block-red">
		<div class="container">
			<div class="row">
				<div class="col-md-4 steps-block-col">
					<div>
						<p style="color: white;">Phát triển dự án: Sinh viên Mai Văn
							Công & GVHD</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Load javascripts at bottom, this will reduce page load time -->
	<!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.min.js"></script>  
    <![endif]-->
	<script src="content/assets/plugins/jquery.min.js"
		type="text/javascript"></script>
	<script src="content/assets/plugins/jquery-migrate.min.js"
		type="text/javascript"></script>
	<script src="content/assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="content/assets/corporate/scripts/back-to-top.js"
		type="text/javascript"></script>
	<script
		src="content/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
	<script
		src="content/assets/plugins/fancybox/source/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<!-- pop up -->
	<script src="content/assets/plugins/owl.carousel/owl.carousel.min.js"
		type="text/javascript"></script>
	<!-- slider for products -->
	<script src="content/assets/plugins/zoom/jquery.zoom.min.js"
		type="text/javascript"></script>
	<!-- product zoom -->
	<script
		src="content/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js"
		type="text/javascript"></script>
	<!-- Quantity -->
	<script src="content/assets/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<script src="content/assets/plugins/rateit/src/jquery.rateit.js"
		type="text/javascript"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"
		type="text/javascript"></script>
	<!-- for slider-range -->

	<script src="content/assets/corporate/scripts/layout.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			Layout.init();
			Layout.initOWL();
			Layout.initTwitter();
			Layout.initImageZoom();
			Layout.initTouchspin();
			Layout.initUniform();
			Layout.initSliderRange();
		});
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>