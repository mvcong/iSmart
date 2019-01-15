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
					<li class="nav-item"><a class="nav-link" href="dangnhap.jsp">Đăng
							nhập</a></li>
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

	<!-- Benefits
    ================================================== -->
	<section class="service-sec" id="benefits">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading text-md-center text-xs-center">
						<h2>
							<small>Lợi ích của việc tập GYM</small>Giúp bạn có thân hình đẹp,
							thu hút người khác phái, nâng cao sức khỏe, phòng ngừa bệnh
							tật,...
						</h2>
					</div>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-6 text-sm-center service-block">
							<i class="fa fa-plus" aria-hidden="true"></i>
							<h3>Tập gym cho bạn thân hình đẹp, săn chắc</h3>
							<p>Luyện tập thể hình thường xuyên, đúng cách và kết hợp với
								chế độ dinh dưỡng hợp lý giúp bạn có vóc dáng cân đối, săn chắc.</p>
							<p>Người béo tập gym có tác dụng giảm mỡ thừa, khiến cơ bắp
								sắn chắc và thân hình thon gọn. Tập gym giúp người gầy tăng cân,
								cơ thể săn chắc, khỏe khoắn.</p>
						</div>
						<div class="col-md-6 text-sm-center service-block">
							<i class="fa fa-leaf" aria-hidden="true"></i>
							<h3>Tập gym tăng cường sức mạnh cơ bắp</h3>
							<p>Việc tập gym đặc biệt phát huy tác dụng với cánh mày râu,
								giúp nam giới tăng cường sức mạnh cơ bắp, thực hiện các công
								việc đòi hỏi thể lực cao thật dễ dàng.</p>
							<p>Khi luyện tập thể hình, các bài tập cơ vai, cơ lưng, cơ
								bụng, chân có tác dụng tăng cường sức mạnh, độ dẻo dai và khả
								năng chịu đựng của các cơ.</p>
						</div>
						<div class="col-md-6 text-sm-center service-block">
							<i class="fa fa-leaf" aria-hidden="true"></i>
							<h3>Tập gym giúp xương chắc khỏe</h3>
							<p>Theo tuổi tác, các mô xương bị thoái hóa dần, thậm chí
								nhiều người còn bị tình trạng loãng xương ngay khi còn trẻ.</p>
							<p>Luyện tập thể hình tạo điều kiện cho việc kích thích quá
								trình tạo xương mới, giúp xương khớp khỏe mạnh, ngăn ngừa chấn
								thương, làm giảm tình trạng thoái hóa xương và phòng ngừa loãng
								xương hiệu quả.</p>
						</div>
						<div class="col-md-6 text-sm-center service-block">
							<i class="fa fa-bell" aria-hidden="true"></i>
							<h3>Tập gym có tác dụng phòng ngừa bệnh tật</h3>
							<p>Rất nhiều nghiên cứu của các nhà khoa học chỉ ra rằng: Tập
								gym thường xuyên giúp cải thiện sức khỏe tim mạch, giảm
								cholesterol, phòng bệnh tai biến mạch máu não, nhồi máu cơ tim,
								cao huyết áp, xơ vữa động mạch…</p>
							<p>Bên cạnh đó, bạn còn phòng tránh được các bệnh như loãng
								xương, tiểu đường, béo phì, ung thư. Luyện tập thường xuyên
								khiến cơ thể khỏe mạnh hơn, tăng cường sức đề kháng để chống lại
								bệnh tật.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<img src="content/home/img/side-01.jpg" class="img-fluid" />
				</div>
			</div>
			<!-- /.row -->
		</div>
	</section>

	<!-- About 
    ================================================== -->
<!-- 	<section class="about-sec parallax-section" id="about"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-3"> -->
<!-- 					<h2> -->
<!-- 						<small>Thông báo mới</small> -->
<!-- 					</h2> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4"> -->
<!-- 					<p style="color: white;"> -->
<!-- 					<ul> -->
<!-- 						<li><a -->
<!-- 							href="https://bizlive.vn/cau-chuyen-kinh-doanh/dua-mo-phong-gym-trieu-do-1890342.html"><span>*</span>Mở -->
<!-- 								các phòng GYM triệu đô</a></li> -->
<!-- 					</ul> -->
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				      <div class="col-md-4"> -->
<!-- 				       <p> <a href="https://bizlive.vn/cau-chuyen-kinh-doanh/dua-mo-phong-gym-trieu-do-1890342.html">Mở các phòng GYM triệu đô</a></p> -->
<!-- 				      </div> -->
<!-- 				      <div class="col-md-4"> -->
<!-- 				<!--         <p>Our greatest happiness does not depend on the condition of life in which chance has placed us, but is always the result of a good conscience, good health, occupation, and freedom in all just pursuits.</p> -->
<!-- 				<!--         <p>Being in control of your life and having realistic expectations about your day-to-day challenges are the keys to stress management, which is perhaps the most important ingredient to living a happy, healthy and rewarding life.</p> -->
<!-- 				<!--         <p><a href="#" class="btn btn-transparent-white btn-capsul">Explore More</a></p> -->
<!-- 				      </div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->

	<!-- BLOG
    ================================================== -->

	<section class="blog-sec" id="blog">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading text-md-center text-xs-center">
						<h2>
							<small>Tin nổi bật</small>
						</h2>
					</div>
				</div>
				<div class="col-md-4 blog-box">
					<div class="blog-image-block">
						<img src="content/home/img/phonggym.jpg" alt="" class="img-fluid">
					</div>
					<h3 class="blog-title">
						<small>Phòng GYM</small><a href="https://bizlive.vn/cau-chuyen-kinh-doanh/dua-mo-phong-gym-trieu-do-1890342.html">Đua mở phòng GYM triệu đô</a>
					</h3>
				</div>
				<div class="col-md-4 blog-box">
					<div class="blog-image-block">
						<img src="content/home/img/thidau.jpg" alt="" class="img-fluid">
					</div>
					<h3 class="blog-title">
						<small>Giải đấu, cuộc thi</small><a href="https://thethaovanhoa.vn/the-thao/khoi-dong-cuoc-thi-the-hinh-giai-thuong-500-ty-dong-trien-lam-lam-cho-cuoc-song-tot-dep-hon-n20180724200654591.htm">Khởi động cuộc thi thể hình giải thưởng 500 tỷ đồng, triển lãm 'Làm cho cuộc sống tốt đẹp hơn'</a>
					</h3>				
				</div>
				<div class="col-md-4 blog-box">
					<div class="blog-image-block">
						<img src="content/home/img/loiich.jpg" alt="" class="img-fluid">
					</div>
					<h3 class="blog-title">
						<small>Tin khác</small><a href="http://www.nshapefitness.vn/6-loi-ich-tuyet-voi-khien-ban-muon-tap-gym-ngay-nd462289/">6 lợi ích từ việc tập GYM</a>
					</h3>
					
				</div>
			</div>
		</div>
	</section>

	<!-- VIDEO
    ================================================== -->
	<section class="video-sec parallax-section">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="wow fadeInUp" data-wow-delay="0.5s">
						Watch the video<small>Without health life is not life; it
							is only a state of langour and suffering - an image of death.</small>
					</h2>
					<a href="#"><i class="fa fa-play"></i></a> <small><em>Video
							by: Health Tips</em></small>
				</div>
			</div>
		</div>
	</section>
	<section class="gallery-sec" id="gallery">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading text-md-center text-xs-center">
						<h2>
							<small>Stroy Through Images</small>Fitness Image Gallery
						</h2>
					</div>
				</div>
				<div class="col-md-12">
					<!-- iso section -->
					<div class="iso-section text-md-center text-xs-center"
						data-wow-delay="0.5">
						<ul class="filter-wrapper clearfix">
							<li><a href="#" data-filter="*" class="selected opc-main-bg">All</a></li>
							<li><a href="#" class="opc-main-bg" data-filter=".london">London</a></li>
							<li><a href="#" class="opc-main-bg" data-filter=".paris">Paris</a></li>
							<li><a href="#" class="opc-main-bg" data-filter=".ny">New
									York</a></li>
							<li><a href="#" class="opc-main-bg" data-filter=".hn">Hong
									Kong</a></li>
						</ul>

						<!-- iso box section -->
						<div class="iso-box-section wow fadeInUp" data-wow-delay="0.9s">
							<div class="iso-box-wrapper col4-iso-box">
								<div class="iso-box london paris ny col-md-4 col-sm-6">
									<div class="gallery-thumb">
										<a href="content/home/img/photo-gallery-01.jpg"
											data-lightbox-gallery="food-gallery"> <img
											src="content/home/img/photo-gallery-01.jpg" class="fluid-img"
											alt="Gallery">
											<div class="gallery-overlay">
												<div class="gallery-item">
													<i class="fa fa-search"></i>
												</div>
											</div>
										</a>
									</div>
								</div>
								<div class="iso-box london ny hn col-md-4 col-sm-6">
									<div class="gallery-thumb">
										<a href="content/home/img/photo-gallery-02.jpg"
											data-lightbox-gallery="food-gallery"> <img
											src="content/home/img/photo-gallery-02.jpg" class="fluid-img"
											alt="Gallery">
											<div class="gallery-overlay">
												<div class="gallery-item">
													<i class="fa fa-search"></i>
												</div>
											</div>
										</a>
									</div>
								</div>
								<div class="iso-box hn col-md-4 col-sm-6">
									<div class="gallery-thumb">
										<a href="content/home/img/photo-gallery-03.jpg"
											data-lightbox-gallery="food-gallery"> <img
											src="content/home/img/photo-gallery-03.jpg" class="fluid-img"
											alt="Gallery">
											<div class="gallery-overlay">
												<div class="gallery-item">
													<i class="fa fa-search"></i>
												</div>
											</div>
										</a>
									</div>
								</div>
								<div class="iso-box london col-md-4 col-sm-6">
									<div class="gallery-thumb">
										<a href="content/home/img/photo-gallery-04.jpg"
											data-lightbox-gallery="food-gallery"> <img
											src="content/home/img/photo-gallery-04.jpg" class="fluid-img"
											alt="Gallery">
											<div class="gallery-overlay">
												<div class="gallery-item">
													<i class="fa fa-search"></i>
												</div>
											</div>
										</a>
									</div>
								</div>
								<div class="iso-box ny col-md-4 col-sm-6">
									<div class="gallery-thumb">
										<a href="content/home/img/photo-gallery-05.jpg"
											data-lightbox-gallery="food-gallery"> <img
											src="content/home/img/photo-gallery-05.jpg" class="fluid-img"
											alt="Gallery">
											<div class="gallery-overlay">
												<div class="gallery-item">
													<i class="fa fa-search"></i>
												</div>
											</div>
										</a>
									</div>
								</div>
								<div class="iso-box paris lunch col-md-4 col-sm-6">
									<div class="gallery-thumb">
										<a href="content/home/img/photo-gallery-06.jpg"
											data-lightbox-gallery="food-gallery"> <img
											src="content/home/img/photo-gallery-06.jpg" class="fluid-img"
											alt="Gallery">
											<div class="gallery-overlay">
												<div class="gallery-item">
													<i class="fa fa-search"></i>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact-sec" id="contact">
		<div class="container">
			<h2>
				Get in Touch <small>Our work is the presentation of our
					capabilities.</small>
			</h2>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="exampleName">Name</label> <input type="text"
							class="form-control" id="exampleName"
							aria-describedby="emailHelp">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="examplePhone">Phone Number</label> <input type="text"
							class="form-control" id="examplePhone"
							aria-describedby="emailHelp">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp"> <small id="emailHelp"
							class="form-text text-muted">We'll never share your email
							with anyone else.</small>
					</div>
				</div>
				<div class="col-md-12">
					<label for="exampleTextarea">Enter your Message</label>
					<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
				</div>
				<div class="col-md-12 text-xs-center action-block">
					<a href="#" class="btn btn-capsul btn-aqua">Submit</a>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-4">
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#">Benefits</a></li>
						<li><a href="#">About</a></li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-4">
					<ul>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Image Gallery</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-4">
					<ul>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Term and Services</a></li>
						<li><a href="#">About Burnout</a></li>
					</ul>
				</div>
				<div class="col-md-6 col-sm-12">
					<h2>About our Blog</h2>
					<p>To enjoy good health, to bring true happiness to one's
						family, to bring peace to all, one must first discipline and
						control one's own mind. If a man can control his mind he can find
						the way to Enlightenment.</p>
				</div>
			</div>
			<div class="row copy-footer">
				<div class="col-sm-6 col-md-3">
					&copy;
					<script type="text/javascript">
						document.write(new Date().getFullYear());
					</script>
					<a target="_blank" rel="nofollow" href="https://grafreez.com/"></a>
					Grafreez.com
				</div>
				<div class="col-sm-6 col-md-3 pull-right text-xs-right">
					Created with <i class="fa fa-heart"></i>
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
