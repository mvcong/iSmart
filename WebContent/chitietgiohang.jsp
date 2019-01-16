<%@page import="java.util.Date"%>
<%@page import="sanpham.model.SanPhamTrongGio"%>
<%@page import="java.util.Map"%>
<%@page
	import="org.apache.xmlbeans.impl.xb.xmlschema.SpaceAttribute.Space"%>
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
<title>GYM Smart</title>
<link rel="icon" type="image/png" href="login_css/images/icons/favicon.ico"/>

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
		GioHang cart = (GioHang) session.getAttribute("cart");
		if (cart == null) {
			cart = new GioHang();
			session.setAttribute("cart", cart);
		}
	%>
	<!-- BEGIN HEADER -->
	<div class="header">
		<div class="container">
			<a class="site-logo" href="trangchu.jsp">GYM Smart</a> <a
				href="javascript:void(0);" class="mobi-toggler"><i
				class="fa fa-bars"></i></a>

			<!-- BEGIN CART -->
			<div class="top-cart-block">
				<div class="top-cart-info">
					<a href="javascript:void(0);" class="top-cart-info-count"><%=cart.countItem()%></a>
					<a href="javascript:void(0);" class="top-cart-info-value">vnđ<%=cart.totalCart()%></a>
				</div>
				<i class="fa fa-shopping-cart"></i>

				<div class="top-cart-content-wrapper">
					<div class="top-cart-content">
						<ul class="scroller" style="height: 250px;">
							<%
								for (Map.Entry<String, SanPhamTrongGio> list : cart.getCartItems().entrySet()) {
							%>
							<li><a href="shop-item.html"><img
									src="<%=list.getValue().getSanPham().getAnhSP()%>"
									alt="Rolex Classic Watch" width="37" height="34"></a> <span
								class="cart-content-count">x <%=list.getValue().getSoLuong()%></span>
								<strong><a href="shop-item.html"><%=list.getValue().getSanPham().getTenSP()%></a></strong>
								<em>vnđ<%=list.getValue().getSanPham().getGiaBan()%></em> <a
								href="CartServlet?command=remove&maSP=<%=list.getValue().getSanPham().getMaSP()%>"
								class="del-goods">&nbsp;</a></li>
							<%
								}
							%>
						</ul>
						<div class="text-right">
							<a href="chitietgiohang.jsp" class="btn btn-default">Xem giỏ
								hàng</a> <a href="dathang.jsp" class="btn btn-primary">Thanh toán</a>
						</div>
					</div>
				</div>
			</div>
			<!--END CART -->

			<!-- BEGIN NAVIGATION -->
			<div class="header-navigation">

				<ul>
					<li><a href="trangsanpha.jsp">Sản phẩm</a></li>
				


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
				<!-- BEGIN CONTENT -->
				<div class="col-md-12 col-sm-12">
					<h1>Giỏ hàng</h1>
					<div class="goods-page">
						<div class="goods-data clearfix">
							<div class="table-wrapper-responsive">
								<table summary="Shopping cart">
									<tr>
										<th class="goods-page-image">Ảnh sản phẩm</th>
										<th class="goods-page-description">Tên sản phẩm</th>
										<th class="goods-page-ref-no">Ngày mua</th>
										<th class="goods-page-quantity">Số lượng</th>
										<th class="goods-page-price">Giá bán</th>
										<th class="goods-page-total" colspan="2">Thành tiền</th>
									</tr>

									<%
										for (Map.Entry<String, SanPhamTrongGio> list : cart.getCartItems().entrySet()) {
									%>
									<tr>
										<td class="goods-page-image"><a href="javascript:;"><img
												src="<%=list.getValue().getSanPham().getAnhSP()%>"
												alt="Berry Lace Dress"></a></td>
										<td class="goods-page-description">
											<h3>
												<a href="chiteitsanpham.jsp"><%=list.getValue().getSanPham().getTenSP()%></a>
											</h3>											
										</td>
										<td class="goods-page-ref-no"><%= new Date()%></td>
										<td class="goods-page-quantity">
											<div class="product-quantity">
												<input id="product-quantity" type="text"
													value="<%=list.getValue().getSoLuong()%>" readonly
													class="form-control input-sm">
											</div>
										</td>
										<td class="goods-page-price"><strong><span>vnđ</span><%=list.getValue().getSanPham().getGiaBan()%></strong>
										</td>
										<td class="goods-page-total"><strong><span>vnđ</span><%=list.getValue().getSoLuong() * list.getValue().getSanPham().getGiaBan()%></strong>
										</td>
										<td class="del-goods-col"><a class="del-goods"
											href="CartServlet?command=remove&maSP=<%=list.getValue().getSanPham().getMaSP()%>">&nbsp;</a>
										</td>

									</tr>
									<%
										}
									%>
								</table>
							</div>

							<div class="shopping-total">
								<ul>
									<li><em>Tổng tiền</em> <strong class="price"><span>vnđ</span><%=cart.totalCart()%></strong>
									</li>
<!-- 									<li><em>Shipping cost</em> <strong class="price"><span>vnđ</span>3.00</strong> -->
<!-- 									</li> -->
<!-- 									<li class="shopping-total-price"><em>Total</em> <strong -->
<%-- 										class="price"><span>vnđ</span><%=cart.totalCart()%></strong></li> --%>
								</ul>
							</div>
						</div>
						<a  href="trangsanpham.jsp"   class="btn btn-default">
							Tiếp tục mua sắm <i class="fa fa-shopping-cart"></i>
						</a>						
						<a href="thanhtoan.jsp" class="btn btn-primary" >
							Thanh toán <i class="fa fa-check"></i>
						</a>
					</div>
				</div>
				<!-- END CONTENT -->
			</div>
		</div>
	</div>

	<!-- 	<!-- BEGIN BRANDS -->
	-->
	<!-- 	<div class="brands"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div class="owl-carousel owl-carousel6-brands"> -->
	<!-- 				<a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/canon.jpg" alt="canon" -->
	<!-- 					title="canon"></a> <a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/esprit.jpg" alt="esprit" -->
	<!-- 					title="esprit"></a> <a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a> -->
	<!-- 				<a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/next.jpg" alt="next" -->
	<!-- 					title="next"></a> <a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/puma.jpg" alt="puma" -->
	<!-- 					title="puma"></a> <a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/zara.jpg" alt="zara" -->
	<!-- 					title="zara"></a> <a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/canon.jpg" alt="canon" -->
	<!-- 					title="canon"></a> <a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/esprit.jpg" alt="esprit" -->
	<!-- 					title="esprit"></a> <a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a> -->
	<!-- 				<a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/next.jpg" alt="next" -->
	<!-- 					title="next"></a> <a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/puma.jpg" alt="puma" -->
	<!-- 					title="puma"></a> <a href="shop-product-list.html"><img -->
	<!-- 					src="content/assets/pages/img/brands/zara.jpg" alt="zara" -->
	<!-- 					title="zara"></a> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 	<!-- END BRANDS -->
	-->

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