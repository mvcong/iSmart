<%@page import="org.apache.xmlbeans.impl.xb.xmlschema.SpaceAttribute.Space"%>
<%@page import="sanpham.model.LoaiSanPham"%>
<%@page import="iCore.dao.LoaiSanPhamDAO"%>
<%@page import="sanpham.model.SanPham"%>
<%@page import="sanpham.model.Cart"%>
<%@page import="iCore.dao.SanPhamDAO"%>
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
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
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
				<div class="sidebar col-md-3 col-sm-5">
					<%
						for (LoaiSanPham lsp : loaiSanPhamDAO.getListLoaiSanPham()) {
					%>
					<ul class="list-group margin-bottom-25 sidebar-menu">
						<li class="list-group-item clearfix"><a
							href="shop-product-list.html"><i class="fa fa-angle-right"></i><%=lsp.getTenLoai()%></a></li>
					</ul>
					<%
						}
					%>
				</div>
				<!-- BEGIN CONTENT -->
				<div class="col-md-9 col-sm-7" align="center">
					<div class="row list-view-sorting clearfix">
						<div class="col-md-2 col-sm-2 list-view">
							<a href="javascript:;"><i class="fa fa-th-large"></i></a> <a
								href="javascript:;"><i class="fa fa-th-list"></i></a>
						</div>
						<div class="col-md-10 col-sm-10">
							<div class="pull-right">
								<label class="control-label">Show:</label> <select
									class="form-control input-sm">
									<option value="#?limit=24" selected="selected">24</option>
									<option value="#?limit=25">25</option>
									<option value="#?limit=50">50</option>
									<option value="#?limit=75">75</option>
									<option value="#?limit=100">100</option>
								</select>
							</div>
							<div class="pull-right">
								<label class="control-label">Sort&nbsp;By:</label> <select
									class="form-control input-sm">
									<option value="#?sort=p.sort_order&amp;order=ASC"
										selected="selected">Default</option>
									<option value="#?sort=pd.name&amp;order=ASC">Name (A -
										Z)</option>
									<option value="#?sort=pd.name&amp;order=DESC">Name (Z
										- A)</option>
									<option value="#?sort=p.price&amp;order=ASC">Price
										(Low &gt; High)</option>
									<option value="#?sort=p.price&amp;order=DESC">Price
										(High &gt; Low)</option>
									<option value="#?sort=rating&amp;order=DESC">Rating
										(Highest)</option>
									<option value="#?sort=rating&amp;order=ASC">Rating
										(Lowest)</option>
									<option value="#?sort=p.model&amp;order=ASC">Model (A
										- Z)</option>
									<option value="#?sort=p.model&amp;order=DESC">Model (Z
										- A)</option>
								</select>
							</div>
						</div>
					</div>
					<!-- BEGIN PRODUCT LIST -->
					<div class="row product-list" align="center">
						<%
							for (SanPham sp : sanPhamDAO.getListAllSanPham(maSP)) {
						%>
						<!-- PRODUCT ITEM START -->
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="product-item">
								<div class="pi-img-wrapper">
									<img src="<%=sp.getAnhSP()%>" class="img-responsive"
										alt="Berry Lace Dress">
									<div>
										<a href="<%=sp.getAnhSP()%>"
											class="btn btn-default fancybox-button">Zoom</a> <a
											href="#product-pop-up"
											class="btn btn-default fancybox-fast-view">View</a>
									</div>
								</div>
								<h3>
									<a href="shop-item.html"><%=sp.getTenSP()%></a>
								</h3>
								<div class="pi-price">
									vnđ<%=sp.getGiaBan()%></div>
								<a href="javascript:;" class="btn btn-default add2cart">Add
									to cart</a>
							</div>
						</div>
						<%
							}
						%>
					</div>


					<!-- END PRODUCT LIST -->
					<!-- BEGIN PAGINATOR -->
					<div class="row">
						<div class="col-md-4 col-sm-4 items-info">Items 1 to 9 of 10
							total</div>
						<div class="col-md-8 col-sm-8">
							<ul class="pagination pull-right">
								<li><a href="javascript:;">&laquo;</a></li>
								<li><a href="javascript:;">1</a></li>
								<li><span>2</span></li>
								<li><a href="javascript:;">3</a></li>
								<li><a href="javascript:;">4</a></li>
								<li><a href="javascript:;">5</a></li>
								<li><a href="javascript:;">&raquo;</a></li>
							</ul>
						</div>
					</div>
					<!-- END PAGINATOR -->
				</div>
				<!-- END CONTENT -->
			</div>
			<!-- END SIDEBAR & CONTENT -->
		</div>
	</div>

	<!-- BEGIN BRANDS -->
	<div class="brands">
		<div class="container">
			<div class="owl-carousel owl-carousel6-brands">
				<a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/canon.jpg" alt="canon"
					title="canon"></a> <a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/esprit.jpg" alt="esprit"
					title="esprit"></a> <a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a>
				<a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/next.jpg" alt="next"
					title="next"></a> <a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/puma.jpg" alt="puma"
					title="puma"></a> <a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/zara.jpg" alt="zara"
					title="zara"></a> <a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/canon.jpg" alt="canon"
					title="canon"></a> <a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/esprit.jpg" alt="esprit"
					title="esprit"></a> <a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a>
				<a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/next.jpg" alt="next"
					title="next"></a> <a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/puma.jpg" alt="puma"
					title="puma"></a> <a href="shop-product-list.html"><img
					src="content/assets/pages/img/brands/zara.jpg" alt="zara"
					title="zara"></a>
			</div>
		</div>
	</div>
	<!-- END BRANDS -->

	<!-- BEGIN STEPS -->
	<div class="steps-block steps-block-red">
		<div class="container">
			<div class="row">				
				<div class="col-md-4 steps-block-col">
					<div>						
						<p style="color: white;">
							Phát triển dự án: Sinh viên Mai Văn Công & GVHD
						</p>						
					</div>
				</div>				
			</div>
		</div>
	</div>
	<!-- BEGIN fast view of a product -->
	<div id="product-pop-up" style="display: none; width: 700px;">
		<div class="product-page product-pop-up">
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-3">
					<div class="product-main-image">
						<img src="content/assets/pages/img/products/model7.jpg"
							alt="Cool green dress with red bell" class="img-responsive">
					</div>
					<div class="product-other-images">
						<a href="javascript:;" class="active"><img
							alt="Berry Lace Dress"
							src="content/assets/pages/img/products/model3.jpg"></a> <a
							href="javascript:;"><img alt="Berry Lace Dress"
							src="content/assets/pages/img/products/model4.jpg"></a> <a
							href="javascript:;"><img alt="Berry Lace Dress"
							src="content/assets/pages/img/products/model5.jpg"></a>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-9">
				<%
							for (SanPham sp : sanPhamDAO.getListAllSanPham(maSP)) {
						%>
					<h1><%=sp.getTenSP() %></h1>
					<div class="price-availability-block clearfix">
						<div class="price">
							<strong><span>$</span><%=sp.getGiaBan()%></strong>
						</div>
						<div class="availability">
							Availability: <strong>In Stock</strong>
						</div>
					</div>
					<div class="description">
						<%=sp.getNgayNhapHang() %>
					</div>
					<div class="description">
						<%=sp.getHsd() %>
					</div>
					<div class="product-page-options">
						<div class="pull-left">
							<label class="control-label">Size:</label> <select
								class="form-control input-sm">
								<option>L</option>
								<option>M</option>
								<option>XL</option>
							</select>
						</div>
						<div class="pull-left">
							<label class="control-label">Color:</label> <select
								class="form-control input-sm">
								<option>Red</option>
								<option>Blue</option>
								<option>Black</option>
							</select>
						</div>
					</div>
					<div class="product-page-cart">
						<div class="product-quantity">
							<input id="product-quantity" type="text" value="1" readonly
								name="product-quantity" class="form-control input-sm">
						</div>
						<button class="btn btn-primary" type="submit">Add to cart</button>
						<a href="shop-item.html" class="btn btn-default">More details</a>
					</div>
				</div>
				<%
							}
				%>

				<div class="sticker sticker-sale"></div>
			</div>
		</div>
	</div>
	<!-- END fast view of a product -->

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