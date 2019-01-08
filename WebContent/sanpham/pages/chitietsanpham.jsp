<%@page import="sanpham.model.SanPham"%>
<%@page import="sanpham.dao.SanPhamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail</title>
<link href="content/sanpham/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="content/sanpham/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="content/sanpham/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!--fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!--slider-script-->
<script src="js/responsiveslides.min.js"></script>
<script>
	$(function() {
		$("#slider1").responsiveSlides({
			auto : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>
<!--//slider-script-->
<script>
	$(document).ready(function(c) {
		$('.alert-close').on('click', function(c) {
			$('.message').fadeOut('slow', function(c) {
				$('.message').remove();
			});
		});
	});
</script>
<script>
	$(document).ready(function(c) {
		$('.alert-close1').on('click', function(c) {
			$('.message1').fadeOut('slow', function(c) {
				$('.message1').remove();
			});
		});
	});
</script>
</head>
<body>

	<%
		SanPhamDAO sanPhamDAO = new SanPhamDAO();
		SanPham sanPham = new SanPham();
		String maSP = "";
		if (request.getParameter("maSP") != null) {
			maSP = request.getParameter("maSP");
			sanPham = sanPhamDAO.getSanPham(maSP);
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="single">
			<div class="col-md-9 top-in-single">
				<div class="col-md-5 single-top">

					<a href="optionallink.html"> <img
						class="etalage_thumb_image img-responsive"
						src="<%=sanPham.getAnhSP()%>" alt="">
					</a>

				</div>
				<div class="col-md-7 single-top-in">
					<div class="single-para">
						<h4><%=sanPham.getTenSP()%></h4>
<%-- 						<h4><%=sanPham.getLoaiSanPham().getTenLoai()%></h4> --%>
						<h4><%=sanPham.getNgayNhapHang()%></h4>
						<h4><%=sanPham.getHsd()%></h4>
						<div class="para-grid">
							<span class="add-to">$<%=sanPham.getGiaBan()%></span> <a href="#"
								class="hvr-shutter-in-vertical cart-to">Add to Cart</a>
							<div class="clearfix"></div>
						</div>
						<h5>100 items in stock</h5>
						<div class="available">
							<h6>Available Options :</h6>
							<ul>
								<li>Color: <select>
										<option>Silver</option>
										<option>Black</option>
										<option>Dark Black</option>
										<option>Red</option>
								</select></li>
								<li>Size:<select>
										<option>Large</option>
										<option>Medium</option>
										<option>small</option>
										<option>Large</option>
										<option>small</option>
								</select></li>
								<li>Quality:<select>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
								</select></li>
							</ul>
						</div>


						<a href="#" class="hvr-shutter-in-vertical ">More details</a>

					</div>
				</div>
				<div class="clearfix"></div>
				<div class="content-top-in">
					<div class="col-md-4 top-single">
						<div class="col-md">
							<img src="images/pic8.jpg" alt="" />
							<div class="top-content">
								<h5>Mascot Kitty - White</h5>
								<div class="white">
									<a href="#"
										class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD
										TO CART</a>
									<p class="dollar">
										<span class="in-dollar">$</span><span>2</span><span>0</span>
									</p>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 top-single">
						<div class="col-md">
							<img src="images/pic9.jpg" alt="" />
							<div class="top-content">
								<h5>Mascot Kitty - White</h5>
								<div class="white">
									<a href="#"
										class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD
										TO CART</a>
									<p class="dollar">
										<span class="in-dollar">$</span><span>2</span><span>0</span>
									</p>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 top-single-in">
						<div class="col-md">
							<img src="images/pic10.jpg" alt="" />
							<div class="top-content">
								<h5>Mascot Kitty - White</h5>
								<div class="white">
									<a href="#"
										class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD
										TO CART</a>
									<p class="dollar">
										<span class="in-dollar">$</span><span>2</span><span>0</span>
									</p>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="single-bottom">
					<h4>Categories</h4>
					<ul>
						<li><a href="#"><i> </i>Fusce feugiat</a></li>
						<li><a href="#"><i> </i>Mascot Kitty</a></li>
						<li><a href="#"><i> </i>Fusce feugiat</a></li>
						<li><a href="#"><i> </i>Mascot Kitty</a></li>
						<li><a href="#"><i> </i>Fusce feugiat</a></li>
					</ul>
				</div>
				<div class="single-bottom">
					<h4>Product Categories</h4>
					<ul>
						<li><a href="#"><i> </i>feugiat(5)</a></li>
						<li><a href="#"><i> </i>Fusce (4)</a></li>
						<li><a href="#"><i> </i> feugiat (4)</a></li>
						<li><a href="#"><i> </i>Fusce (4)</a></li>
						<li><a href="#"><i> </i> feugiat(2)</a></li>
					</ul>
				</div>
				<div class="single-bottom">
					<h4>Product Categories</h4>
					<div class="product">
						<img class="img-responsive fashion" src="images/st1.jpg" alt="">
						<div class="grid-product">
							<a href="#" class="elit">Consectetuer adipiscing elit</a> <span
								class="price price-in"><small>$500.00</small> $400.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product">
						<img class="img-responsive fashion" src="images/st2.jpg" alt="">
						<div class="grid-product">
							<a href="#" class="elit">Consectetuer adipiscing elit</a> <span
								class="price price-in"><small>$500.00</small> $400.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product">
						<img class="img-responsive fashion" src="images/st3.jpg" alt="">
						<div class="grid-product">
							<a href="#" class="elit">Consectetuer adipiscing elit</a> <span
								class="price price-in"><small>$500.00</small> $400.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>