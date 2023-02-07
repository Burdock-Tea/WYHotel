<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/eshopheader.jsp" %>

	<div class="container">
		<div class="row mt-5">
			<div class="prdimg col">
				<div id="carouselExampleSlidesOnly" class="carousel slide ms-5"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${pageContext.request.contextPath}/img/${list.image}" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/img/${list.image}" class="d-block w-100">
						</div>
					</div>
				</div>
			</div>
			<div class=" prd_con col ms-5">
				<span class="store">[wy hotel]</span>
				<h1 class="mt-4">"wy premium ${list.name}"</h1>
				<p class="txt mt-4"></p>
				<div class="type_price mt-2">
					<dl>
						<dt>판매가</dt>
						<dd>
						
							<p class="price mt-2">
								<em>KRW</em> <span> <span id="main_price"><fmt:formatNumber value="${list.price}" pattern="#,###" /></span>
								</span>
							</p>
						</dd>
					</dl>
				</div>
				<div class="opt_form">
					<dt>수량 선택</dt>
				</div>
				<div class="option_area col-9 mt-3"
					style="background: #F4F4F4; border: 1px solid #DCDCDC">
					<dl class="ms-4 mt-3">
						<dt>[wy hotel premium choice]</dt>
					</dl>
					<div class="bottom ms-3 mb-2">
						<div class="count">
							<button type="button" class="minus btn btn-light"
								onclick='count("minus")' style="background: #F4F4F4; border : none;" disabled>-</button>
							<input type="num" id="result" value="1" title="수량" readonly
								style="width: 30px; text-align: center; background: #F4F4F4; border : none;">
							<button type="button" class="plus btn btn-light"
								onclick='count("plus")' style="background: #F4F4F4; border : none;">+</button>
						</div>
					</div>
				</div>

				<div class="mt-3">
					<dl>
						<dt>총 상품금액</dt>
						<dd>
							<p class="price mt-2">
								<em>KRW</em> <span id="pc_total_price"><fmt:formatNumber value="${list.price}" pattern="#,###" /></span>
							</p>
						</dd>
					</dl>
				</div>
				<div class="mt-4">
					<form action="${pageContext.request.contextPath}/eshop/orderList" method="post" name="buyForm">
					<button type="button" class="btn btn-light btn-lg" id="cartListBtn"
						style="border: 2px solid #AD9E87; color: #AD9E87;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장바구니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					<button type="button" class="btn btn-secondary btn-lg" id="buyBtn"
						style="background: #AD9E87; border: 2px solid #AD9E87; color: #fff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구매하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					<input type="hidden" name="quantity">
					<input type="hidden" name="name">
					<input type="hidden" name="image">
					<input type="hidden" name="price">
					<input type="hidden" name="prodnum">
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
<script>
	function count(type) {
		// 결과를 표시할 element
		const resultElement = document.getElementById('result');
		// 현재 화면에 표시된 값
		let number = resultElement.value;
		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus') {
			number = parseInt(number) - 1;
		}
		// 결과 출력
		resultElement.value = number;
		// 최종 금액
		const mainPrice = $('#main_price').html();
		const totalPrice = $('#pc_total_price');
		if (number >= '2') {
			$('.minus').attr('disabled', false);
			totalPrice.html(
					(parseInt(mainPrice.replace(/,/g, '')) * number).toLocaleString());
		} else if (number < '2') {
			$('.minus').attr('disabled', true);
			totalPrice.html(
					 (parseInt(mainPrice.replace(/,/g, '')) * number).toLocaleString());
			return;
		}
	}
	
	$('#cartListBtn').click(function () {
		console.log(typeof($('#pc_total_price').text()));
		
		const data = {
				'memberCode' : '${member}',
				'prodnum' : '${list.prodnum}',
				'quantity' : $('#result').val(),
				'totalPrice' : $('#pc_total_price').val()
		}
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/eshop/addCartChk',
			contentType: 'application/JSON',
			data : JSON.stringify(data),
			success : function(result) {
				if (result) {
					$.ajax({
			             type : 'post',
			             url : '${pageContext.request.contextPath}/eshop/addCart',
			             contentType : 'application/json',
			             data : JSON.stringify(data),
			             success : function(result){
			           	 		alert('장바구니에 담았습니다.');
			           	 		if(confirm('장바구니로 이동하시겠습니까?')){
			           	 			location.href = '${pageContext.request.contextPath}/eshop/cartList';
			           	 		}
			                 }
			         })
				} else {
					alert('이미 장바구니에 담은 품목입니다.')
				}
			}
		});
		 
	});
	
	$('#buyBtn').click(function () {

		
		const data = {
				'memberCode' : '${member}',
				'prodnum' : '${list.prodnum}',
				'quantity' : $('#result').val(),
				'totalPrice' : $('#pc_total_price').val()
		}
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/eshop/addCartChk',
			contentType: 'application/JSON',
			data : JSON.stringify(data),
			success : function(result) {
				if (result) {
					document.buyForm.prodnum.value = '${list.prodnum}';
					document.buyForm.quantity.value = $('#result').val();
					document.buyForm.name.value = '${list.name}';
					document.buyForm.price.value = '${list.price}';
					document.buyForm.image.value = '${list.image}';
					document.buyForm.submit();
					
				} else {
					alert('이미 장바구니에 담은 품목입니다.')
				}
			}
		});
		 
	});
           	  
             
           	  

           	  
		
	
</script>

</html>