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

				<h1 class="my-4">Danh mục</h1>
				<div class="list-group">
					<a href="#" class="list-group-item">Thực phẩm chức năng</a> <a
						href="#" class="list-group-item">Category 2</a> <a href="#"
						class="list-group-item">Category 3</a>
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

				<div>
					Chào mừng đến với giỏ hàng của bạn!</br> Hãy chọn mua những món hàng mà
					bạn mong muốn tại :<b><u><a href="product.jsp">Shop GYM</a></b></u>
					của chúng tôi!</br>
					<center>
						<p>
							<font face="Verdana, Arial, Helvetica, sans-serif"> <strong>Shopping
									Cart</strong>
							</font>
						</p>
						<table width="75%" border="1">
							<tr bgcolor="#CCCCCC">
								<td><strong> <font size="2"
										face="Verdana, Arial, Helvetica, sans-serif">Model
											Description </font>
								</strong></td>
								<td><strong> <font size="2"
										face="Verdana, Arial, Helvetica, sans-serif">Quantity</font>
								</strong></td>
								<td><strong> <font size="2"
										face="Verdana, Arial, Helvetica, sans-serif">Unit Price
									</font>
								</strong></td>
								<td><strong> <font size="2"
										face="Verdana, Arial, Helvetica, sans-serif">Total</font>
								</strong></td>
							</tr>
							<jsp:useBean id="cart" scope="session" class="sanpham.SanPham" />

							<c:if test="${cart.lineItemCount == 0}">
								<tr>
									<td colspan="4"><font size="2"
										face="Verdana, Arial, Helvetica, sans-serif">- Cart is
											currently empty -<br />
								</tr>
							</c:if>

							<c:forEach var="cartItem" items="${cart.cartItems}"
								varStatus="counter">
								<form name="item" method="POST" action="servlet/CartController">
									<tr>
										<td><font size="2"
											face="Verdana, Arial, Helvetica, sans-serif"> <b><c:out
														value="${cartItem.partNumber}" /></b><br /> <c:out
													value="${cartItem.modelDescription}" />
										</font></td>
										<td><font size="2"
											face="Verdana, Arial, Helvetica, sans-serif"> <input
												type='hidden' name='itemIndex'
												value='<c:out value="${counter.count}"/>'> <input
												type='number' name="quantity"
												value='<c:out value="${cartItem.quantity}"/>' size='2'>
												<input type="submit" name="action" value="Update"> <input
												type="submit" name="action" value="Delete"></font></td>
										<td><font size="2"
											face="Verdana, Arial, Helvetica, sans-serif">$<c:out
													value="${cartItem.unitCost}" /></font></td>
										<td><font size="2"
											face="Verdana, Arial, Helvetica, sans-serif">$<c:out
													value="${cartItem.totalCost}" /></font></td>
									</tr>
								</form>
							</c:forEach>
							<!--Total-->
							<tr>
								<td colspan="3"></td>
								<td><font size="2"
									face="Verdana, Arial, Helvetica, sans-serif">Subtotal: $<c:out
											value="${cart.orderTotal}" /></font></td>
							</tr>
						</table>
					</center>

				</div>
				/.row

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">SVTH : Mai Văn Công -
			5551074008</p>
	</div>
	<!-- /.container </footer> --> <!-- Bootstrap core JavaScript --> <script
		src="content/product/vendor/jquery/jquery.min.js"></script> <script
		src="content/product/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
