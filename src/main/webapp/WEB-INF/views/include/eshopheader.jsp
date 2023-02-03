<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WYHotel</title>

<!--BOOTSTRAP CDN -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- google font CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- jquery and daterangepicker -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="./css/main.css" />
<!-- ëë¡­ë¤ì´ -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
</head>
<style>
li{list-style-type : none;}

.page_tit {
	height: 100px;
	background: #fff;
	border-bottom: 1px solid #DCDCDC;
	font-size: 17px;
	font-weight: 500;
	text-align: center;
}

.current_navi ul li span {
	width: 25px;
	line-height: 25px;
	background: #999;
	font-size: 16px;
	color: #fff;
	font-weight: 500;
	border-radius: 100%;
	text-indent: -1px;
}

.current_navi ul .active span {
	width: 25px;
	line-height: 25px;
	background: #AD9E87;
	font-size: 16px;
	color: #fff;
	font-weight: 500;
	border-radius: 100%;
	text-indent: -1px;
}

.cart_list_area .select_area {
	margin-bottom: 30px;
}

.cart_list_area .cartList {
	margin-bottom: 30px;
	border-top: 2px solid #333;
	text-align: center;
}

.cart_list_area .cartList>li {
	position: relative;
	padding: 15px 0 30px;
	border-bottom: 1px solid #dcdcdc;
	overflow: hidden;
	padding: 30px 0 !important;
}

.cart_list_area .cart_list>li {
	display: table;
	width: 100%;
	padding: 30px 0;
}

.cart_list_area .cartList .cart {
	position: relative;
	padding: 10px 0 10px;
	border-bottom: 1px solid #dcdcdc;
	overflow: hidden;
}

.totalArea {
	padding: 10px 0;
	text-align: center;
	border-top: 1px solid #333;
	border-bottom: 1px solid #333;
}

.infoTxt li {
	margin-top: 6px;
	color: #999;
}

.btnArea {
	text-align: center;
}

.price .semiTotalPrice {
	margin-left: 180px;
}
.priceInfo input {
	border:none;
	width: 30px; 
	text-align: center; 
	background: white;
}
.priceInfo button{
	border:none;
}
li{list-style-type : none;}
.lnb .pageTitle {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 200px;
	line-height: 1.2;
	font-size: 40px;
	font-weight: 700;
	background: #fff;
	border-bottom: 1px solid #DCDCDC;
	position: relative;
}

.content {
	padding: 40px 20px;
}

.txt {
	margin-left: 14%;
}

.product_lists_page .prd_top .txt em {
	color: #998465;
}

.prd_list {
	margin-left: 11%;
}

.prd_list li {
	float: left;
	width: 25%;
	margin: 1px 3% 0 0;
}

.prd_list li picture a {
	position: relative;
	display: block;
	height: 0;
	padding-bottom: 100%;
	overflow: hidden;
}

.prd_list li .tit {
	margin: 15px 0 11px;
}

.prd_list li .tit .sub_tit {
	display: block;
	margin-bottom: 5px;
	height: 18px;
	color: #666;
	font-size: 12px;
	line-height: 18px;
}

.prd_list li .tit a {
	color: black;
	text-decoration: none;
}

.prd_list li .price {
	padding-top: 11px;
	border-top: 1px solid #DCDCDC;
	font-size: 17px;
	font-weight: 500;
	margin-bottom: 15%;
}

.prd_list li .price em {
	margin: 2px 6px 0px 10px;
	width: 30px;
	font-size: 13px;
	font-weight: 400;
}

.prd_list li .price .price_box {
	float: left;
	width: calc(100% - 36px);
}

.prd_list li .price .price_box .main_price {
	display: block;
	margin-top: 0;
}
li {list-style-type: none;}
        .page_tit {
            height: 100px;
            background: #fff;
            border-bottom: 1px solid #DCDCDC;
            font-size: 17px;
            font-weight: 500;
            text-align: center;
        }
        .current_navi ul li span {
            width: 25px;
            line-height: 25px;
            background: #999;
            font-size: 16px;
            color: #fff;
            font-weight: 500;
            border-radius: 100%;
            text-indent: -2px;
        }
        .current_navi ul .active span {
            width: 25px;
            line-height: 25px;
            background: #AD9E87;
            font-size: 16px;
            color: #fff;
            font-weight: 500;
            border-radius: 100%;
            text-indent: -2px;
        }
        .cart_list_area .cartList {
            margin-bottom: 30px;
            border-top: 2px solid #333;
            text-align: center;
        }        
        .cart_list_area .cartList>li {
            position: relative;
            padding: 15px 0 30px;
            border-bottom: 1px solid #dcdcdc;
            overflow: hidden;
            padding: 30px 0 !important;
        }
        .cart_list_area .cart_list>li {
           display: table;
            width: 100%;
            padding: 30px 0;
        }
        .totalArea {
            padding: 10px 0;
            text-align: center;
            border-top: 1px solid #333;
            border-bottom: 1px solid #333;
        }
        .infoTxt li {
            margin-top: 6px;
            color: #999;
        }
        .btnArea{
            text-align: center;
        }
        ul {padding-inline-start: 20px;}

li {list-style-type: none;}

.page_tit {
	height: 100px;
	background: #fff;
	border-bottom: 1px solid #DCDCDC;
	font-size: 17px;
	font-weight: 500;
	text-align: center;
}

.current_navi ul li span {
	width: 25px;
	line-height: 25px;
	background: #999;
	font-size: 16px;
	color: #fff;
	font-weight: 500;
	border-radius: 100%;
	text-indent: -2px;
}

.current_navi ul .active span {
	width: 25px;
	line-height: 25px;
	background: #AD9E87;
	font-size: 16px;
	color: #fff;
	font-weight: 500;
	border-radius: 100%;
	text-indent: -2px;
}

.orderView {
	margin-bottom: 30px;
	border-top: 2px solid #333;
	text-align: center;
}

.orderView .orderList {
	border-bottom: 1px solid #DCDCDC;
}

.orderView>li {
	position: relative;
}

.formArea input[type='text'] {
	display: inline-block;
	width: 80%;
	height: 30px;
	padding: 0 14px;
	border: 1px solid #999;
	background-color: #fff;
	font-size: 13px;
	color: #333;
	line-height: 50px;
	border-radius: 0;
	vertical-align: top;
}

.formArea>ul>li .l_tit {
	font-weight: 500;
}

.left label {
	width: 110px;
}

.o_tit {
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid #AD9E87;
	font-size: 24px;
	color: #998465;
}

.right label {
	width: 80px;
}

.right .totalArea {
	border: 1px solid #333;
	margin: 20px 0 16px;
	padding: 26px 20px;
}

.right p {
	font-weight: 500;
}

input[type='radio'] {
	position: absolute;
	width: 1px;
	height: 1px;
	margin: 0;
	opacity: 0;
}

input[type='radio']:checked+label {
	border: 2px solid #AD9E87;
	background: #AD9E87;
	font-weight: 500;
	width: 100px;
	height: 45px;
	line-height: 40px;
	border: 2px solid #DCDCDC;
	text-align: center;
	color: #fff;
	display: inline-block;
	cursor: pointer;
	margin-left: 30px;
}

.totalArea li {
	margin-bottom: 25px;
	overflow: hidden;
}

.formArea li:first-child {
	margin-top: 0;
}

.totalArea li:last-child {
	padding-top: 16px;
	margin-bottom: 0;
	border-top: 1px solid #dcdcdc;
}
</style>
<body>
	<header>
		<header> <!-- start header -->
        <nav class="navbar navbar-expand-lg bg-light" style="border: 1px solid #AD9E87;">
            <div class="container">
                <div class="img-wrapper">
                	<a href="${pageContext.request.contextPath}/eshop/productList">
                    <img src="${pageContext.request.contextPath}/img/eshop-logo.svg" width="100">
                    </a>
                </div>
                
                <div>
					<button type="button" class="btn" id="goToCartList" onclick="location.href='${pageContext.request.contextPath}/eshop/cartList'"
							 style="background:#f8f9fa; border : none;">장바구니</button>
					<button type="button" class="btn" id="" onclick="location.href='${pageContext.request.contextPath}/eshop/myOrderList'"
							 style="background:#f8f9fa; border : none;">주문내역</button>
				</div>
			</div>                
        </nav>
        <div class="container" style="padding:0; margin:0; width: 100vw;">
        <div class="row" style="width: 100vw; margin: 0;">
                	<button class="col-6 pb-2 pt-2" type="button" class="btn" id="" onclick="location.href='${pageContext.request.contextPath}/eshop/productList'"
							 style="background:#AD9E87; border-right: 1px solid white; font-size:1.5rem; color:white;  border-left : none; border-bottom : none; border-top : none;">프리미엄 세트</button>
					<button class="col-6 pb-2 pt-2" type="button" class="btn" id="" onclick="location.href='${pageContext.request.contextPath}/eshop/foodList'"
							 style="background:#AD9E87; font-size:1.5rem; color:white; border : none;">푸드</button>		 
          </div>
          </div>
	</header>
	<!-- end header -->