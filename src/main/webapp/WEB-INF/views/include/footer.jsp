<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<style>
		footer {
		    margin-top: 50px;
		    padding: 30px 0 15px;
		    position: relative;
		    background: #000;
		    box-sizing: border-box;
		    color: white;
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
	</style>

<!-- footer.jsp 파일 시작 부분-->
<!-- footer-->
<footer class="sticky-bottom">
	<div class="container">
		<div class="row">
			<div class="col-8">
				<div class="copyright">(주)나는우영 | 대표자: 권우영 | E-mail:
					info@info.com 사업자번호: 123-45-67890 | 개인정보보호책임자: 권우영</div>
				<div class="subfont">Tel. 1888-8888, E-mail :
					wy-hotely@gmail.com, Copyright © WYHOTEL SEGASAMMY Co. Ltd. All
					rights reserved.</div>
			</div>
			<div class="col-4">
				<div class="logo-img">
					<img src="${pageContext.request.contextPath}/img/logo.svg"
						width="150">
				</div>
			</div>
		</div>
	</div>
</footer>

<!-- Bootstrap Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

</body>
</html>