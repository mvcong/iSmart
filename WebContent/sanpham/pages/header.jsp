<%@page import="sanpham.model.LoaiSanPham"%>
<%@page import="sanpham.model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="sanpham.model.Cart"%>
<%@page import="iCore.dao.LoaiSanPhamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
    </head>
    <body>

        <%
            LoaiSanPhamDAO loaiSanPhamDAO = new LoaiSanPhamDAO();
//             Users users = null;
//             if (session.getAttribute("user") != null) {
//                 users = (Users) session.getAttribute("user");
//             }
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

        %>

        <!--header-->
        <div class="header">
            <div class="header-top">
                <div class="container">	
                    <div class="header-top-in">			
                        <div class="logo">
                            <a href="index.jsp"><img src="images/logo.png" alt=" " ></a>
                        </div>
                        <div class="header-in">
                            <ul class="icon1 sub-icon1">
<%--                                 <%if (users != null) {%> --%>
<%--                                 <li><a href="wishlist.html"><%=users.getUserEmail()%></a> </li> --%>
<%--                                     <%}%> --%>
                                <li><a href="wishlist.html">WISH LIST (0)</a> </li>
                                <li><a href="account.html">  MY ACCOUNT</a></li>
                                <li><a href="#"> SHOPPING CART</a></li>
                                <li><a href="checkout.html" >CHECKOUT</a> </li>	
                                <li><div class="cart">
                                        <a href="#" class="cart-in"> </a>
                                        <span> <%=cart.countItem()%></span>
                                    </div>
                                    <ul class="sub-icon1 list">
                                        <h3>Recently added items</h3>
                                        <div class="shopping_cart">

                                            <%for (Map.Entry<String, Item> list : cart.getCartItems().entrySet()) {%>
                                            <div class="cart_box">
                                                <div class="message">
                                                    <div class="alert-close"> </div> 
                                                    <div class="list_img"><img src="<%=list.getValue().getSanPham().getAnhSP()%>" class="img-responsive" alt=""></div>
                                                    <div class="list_desc"><h4><a href="CartServlet?command=remove&maSP=<%=list.getValue().getSanPham().getMaSP()%>"><%=list.getValue().getSanPham().getTenSP()%></a></h4>
                                                        <%=list.getValue().getQuantity()%> x<span class="actual"> $<%=list.getValue().getSanPham().getGiaBan()%></span>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <%}%>

                                        </div>
                                        <div class="total">
                                            <div class="total_left">Cart Subtotal: </div>
                                            <div class="total_right">$<%=cart.totalCart()%></div>
                                            <div class="clearfix"> </div>
                                        </div>
                                        <div class="login_buttons">
                                            <div class="check_button"><a href="checkout.html">Check out</a></div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>

            <div class="header-bottom">
                <div class="container">
                    <div class="h_menu4">
                        <a class="toggleMenu" href="#">Menu</a>
                        <ul class="nav">
                            <li class="active"><a href="home.jsp"><i> </i>Home</a></li>
                            <li><a href="#" >Danh mục</a>
                                <ul class="drop">
                                    <%
                                        for (LoaiSanPham lsp : loaiSanPhamDAO.getListLoaiSanPham()) {
                                    %>
                                    <li><a href="product.jsp?loaisanpham=<%=lsp.getMaLoai()%>"><%=lsp.getTenLoai()%></a></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </li> 						
                            <li><a href="products.html" >  Tablets</a></li>            
                            <li><a href="products.html" >Components</a></li>						  				 
                            <li><a href="products.html" >Software</a></li>
                            <li><a href="products.html" >Phones & PDAs </a></li>
                            <li><a href="products.html" >  Cameras  </a></li>
                            <li><a href="contact.jsp" >Contact </a></li>

                        </ul>
                        <script type="text/javascript" src="content/sanpham/js/nav.js"></script>
                    </div>
                </div>
            </div>
            <div class="header-bottom-in">
                <div class="container">
                    <div class="header-bottom-on">
                        <p class="wel"><a href="#">Welcome visitor you can login or create an account.</a></p>
                        <div class="header-can">
                            <ul class="social-in">
                                <li><a href="#"><i> </i></a></li>
                                <li><a href="#"><i class="facebook"> </i></a></li>
                                <li><a href="#"><i class="twitter"> </i></a></li>					
                                <li><a href="#"><i class="skype"> </i></a></li>
                            </ul>	
                            <div class="down-top">		
                                <select class="in-drop">
                                    <option value="Dollars" class="in-of">Dollars</option>
                                    <option value="Euro" class="in-of">Euro</option>
                                    <option value="Yen" class="in-of">Yen</option>
                                </select>
                            </div>
                            <div class="search">
                                <form>
                                    <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = '';
                                            }" >
                                    <input type="submit" value="">
                                </form>
                            </div>

                            <div class="clearfix"> </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>