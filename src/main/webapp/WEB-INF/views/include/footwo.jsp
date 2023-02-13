<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <style>
footer {
	margin-top: 50px;
	background: #000;
    box-sizing: border-box;
    color: white;
	bottom: 0;
	left: 0;
	right: 0;
}

footer .innerbox {
    width: 1280px;
    padding: 0 80px;
    margin: 0 auto;
    border-bottom: 1px solid gray;
}

footer .footerBox {
    float: left;
}

footer .footerBox h1 {
    font-size: 18px;
    color: #9c836a;
}

footer .footer-service {
    padding-left: 150px;
}

footer .footSub .copyright {
    margin-top: 50px;
}

footer .footSub .subfont {
    font-size: 15px; 
    color: lightgray;
}

footer a {
    color: white;
    text-decoration: none;
}

footer .footer-service .social a {
    font-size: 30px;
    line-height: 40px;
}

footer .footer-service .social .kakao {
    font-size: 38px;
}

footer a:hover {
    color:lightgray;
}

footer .footer-service .social {
    float: left;
    padding: 0 20px;
}

footer .copyright {
    font-size: 15px;
    color: lightgray;
    line-height: 20px;
}

footer .logo-img {
    width: 20%;
    float: right;
    filter: invert(100%);
    padding-bottom: 30px;
    
}

footer .footer-div {
    width: 20%;
    float: right;
}
.chat-img{
	 display:inline-block;
	
}
    </style>
	<!-- footer-->
    <footer>

        <div class="container">
            <div class="row">
                <div id="footerWrap" class="innerbox">
                    <div class="footerBox">
                        <h1>호텔 전화번호</h1>
                        <ul>
                            <li>
                                <strong>서울 WY호텔</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                                1888-6888
                            </li>
                            <li>
                                <strong>부산 WY호텔</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                                1888-7888
                            </li>
                            <li>
                                <strong>제주 WY호텔</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                                1888-8888
                            </li>
                        </ul>
                    </div>
                    <div class="footerBox footer-service" style="padding-left: 150px;">
                        <h1>호텔 이메일</h1>
                        <ul>
                            <li>
                                <strong>서울 WY호텔</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#">wy-seoul@gmail.com</a>
                            </li>
                            <li>
                                <strong>부산 WY호텔</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#">wy-busan@gmail.com</a>
                            </li>
                            <li>
                                <strong>제주 WY호텔</strong> &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#">wy-jeju@gmail.com</a>
                            </li>
                        </ul>
                    </div>
                    <div class="footerBox footer-service" style="padding-left: 150px;">
                        <h1>호텔 소셜</h1>
                        <ul>
                            <li class="social">
                                <a href="https://www.facebook.com/people/WYHotel/100088680776393/" target="_blank"><i class="bi bi-facebook"></i></a>
                            </li>
                            <li class="social">
                                <a href="https://www.instagram.com/wy_hotel/" target="_blank"><i class="bi bi-instagram"></i></a>
                            </li>
                            <li class="social social-kakao">
                                <a href="#" class="kakao"><i class="xi-kakaotalk"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-12">
                <div class="footSub">
                    <div class="col-8">
                        <div class="copyright">
                            (주)나는우영 | 대표자: 권우영 | E-mail: info@info.com
                           	 사업자번호: 123-45-67890 | 개인정보보호책임자: 권우영
                        </div>
                        <div class="subfont"   style="display:inline-block;">
                            Tel. 1888-8888, E-mail : wy-hotely@gmail.com, Copyright © WYHOTEL SEGASAMMY Co. Ltd. All rights reserved.
                        </div>
                         <div class="chat-img position-fixed bottom-0 end-0 mb-5 mx-5">
                            <a  href="#" onclick="window.open('${pageContext.request.contextPath}/chat/userchat','chating','dialog=yes, resizable=no, toolbar=no, menubar=no, width=620, height=500, left=250, top=200')">
                             <div style="border-radius: 50%; background : black; width: 40px; height:40px; text-align: center; line-height: 50px; margin-bottom: 20px;">
                             	<i class="xi-message" style="font-size: 30px;"></i>
                             </div>
                             </a>
                        </div>
                        <div class=" position-fixed bottom-0 end-0 mx-5 my-2">
                            <a href="${pageContext.request.contextPath}/eshop/productList">
                             <div style="border-radius: 50%; background : black; width: 40px; height:40px; text-align: center; line-height: 50px; margin-bottom: 10px;">
                             <i class="xi-market" style="font-size: 30px;"></i>
                             </div>
                              </a>
                        </div>
                    </div>
                    	
                        <div class="logo-img col-4 clearfix">
                            <a href="${pageContext.request.contextPath}/"><img src="./img/logo.svg" width="150"></a>
                        </div>
                	</div>
               </div>
           </div>
        </div>
    </footer>
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    

</body>

</html>