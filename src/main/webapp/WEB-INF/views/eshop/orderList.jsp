<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/eshopheader.jsp" %>

	<!-- 몸통 -->
	<section>
	<form action="<c:url value='/eshop/endOrder'/>" id="orderForm" method="post">	
		<div class="container">
			<div class="row">
				<div class="titlebox p-3">
					<div class="page_tit mt-5 p-2">
						<h1 class="mb-3">주문서 작성</h1>
					</div>
				</div>
				<div class="order">
					<div class="current_navi col-8"
						style="float: none; margin: 0 auto;">
						<ul class="ms-5" style="list-style: none; text-align: center;">
							<li class="ms-5" style="float: left;"><span class="ms-5"
								style="float: left;">1</span>
								<p class="ms-3" style="float: left;">장바구니</p></li>
							<li class="active ms-5" style="float: left;"><span
								class="ms-5" style="float: left;">2</span>
								<p class="ms-3" style="float: left;">주문서 작성</p></li>
							<li class="ms-5" style="float: left;"><span class="ms-5"
								style="float: left;">3</span>
								<p class="ms-3" style="float: left;">주문완료</p></li>
						</ul>
					</div>
				</div>
				<div class="orderView mt-5">
					<ul>
						<c:forEach var="article" items="${list}">
							<input type="hidden" name="quantity" value="${article.quantity}">
							<input type="hidden" name="prodnum" value="${article.prodnum}">
							<li class="orderList p-2">
								<div class="img_area form-check col-sm mt-2 float-start">
									<img
										src="${pageContext.request.contextPath}/img/${article.image}"
										width="150" height="100">
								</div>
								<div class="txtInfo col-sm">
									<p class="tit">${article.name}</p>
								</div>
								<div class="priceInfo col-sm">
									<div class="price  col-sm">
										<p class=" semiTotalCount">
											총 <span class="totalCount"> ${article.quantity} </span>개
										</p>
										<p class=" semiTotalPrice">
											KRW <span class="total"><fmt:formatNumber value="${article.price * article.quantity}" pattern="#,###" /></span>
										</p>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			
				<div class="formArea left col mt-3 ms-5">
					<h3 class="o_tit d-flex justify-content-start">
						<span>주문자</span>
					</h3>
					<ul>
						<li>
							<div class="form_box d-flex justify-content-start mb-3 mt-4"
								style="width: 300px; height: 25px;">
								<label for="orderName"
									class="l_tit d-flex justify-content-start"
									style="margin-right: 15px;">주문자명</label> <input type="text"
									id="orderName" value="${member.name}" name="orderName"
									placeholder="이름을 입력하세요">
							</div>
						</li>
						<li>
							<div class="form_box d-flex justify-content-start mb-3 mt-4"
								style="width: 300px; height: 25px;">
								<label for="orderPhone" class="l_tit bd-highlight"
									style="margin-right: 15px;">연락처</label> <input type="text"
									id="orderPhone" name="orderPhone" value="${member.tel}" placeholder="연락처를 입력하세요">
							</div>
						</li>
					</ul>
					<h3 class="o_tit mb-3 mt-5">
						<span>받는 사람</span>
						<div class="checkbox float-end">
							<input type="hidden" name="memberCode" id="memCo" value="">
							<input class="form-check-input sameChk" type="checkbox" value=""
								id="flexCheckDefault"
								style="width: 20px; height: 20px; border-color: #000;">
							<label class="form-check-label" for="flexCheckDefault"
								style="font-size: 12px; color: #000;"> 주문자와 동일 </label>
						</div>
					</h3>
					 <ul>
                            <li>
                                <div class="form_box d-flex justify-content-start mb-3 mt-4" style="width: 300px; height: 25px;">
                                    <label for="reOrderName" class="l_tit d-flex justify-content-start" style="margin-right: 15px;">수령인명</label>
                                    <input type="text" id="takeUser" name="takeUserName" placeholder="이름을 입력하세요">
                                </div>
                            </li>
                            <li>
                                <div class="form_box d-flex justify-content-start mb-3 mt-4" style="width: 300px; height: 25px;">
                                    <label for="reOrderPhone" class="l_tit d-flex justify-content-start" style="margin-right: 15px;">연락처</label>
                                     <input type="text" id="takeUserPhone" name="takeUserPhone" placeholder="연락처를 입력하세요">
                                </div>
                            </li>
                            <li style="display: table;">
                                <div class="form_box d-flex justify-content-start mb-3 mt-2" style="width: 300px; height: 25px;">
                                    <label for="reOrderName" class="l_tit d-flex justify-content-start" style="margin-right: 15px; font-size: 14.3px;">배송지 주소</label>
                                    <input type="text" id="zipCode" name="takeUserZipnum" placeholder="우편번호" >
                                </div>
                                <div class="form_box d-flex justify-content-start mb-3 mt-2" style="width: 300px; height: 25px;">                                       
                                    <button type="button" id="addrBtn" class="d-flex justify-content-start text-center" style="width: 95px; font-size: 13px; background: #AD9E87; border: 2px solid #AD9E87; color: #fff; padding-left: 10px;" onclick="searchAddress()">주소검색</button>
                                     <input class="ms-4" type="text" id="addrBasic" name="takeUserAddrB" placeholder="기본주소" >
                                </div>
                                <div class="form_box d-flex justify-content-start mb-3 mt-2" style="width: 300px; height: 25px;">
                                    <label for="reOrderName" class="l_tit d-flex justify-content-start" style="margin-right: 15px; font-size: 14.3px;"></label>                                       
                                     <input type="text" id="addrDetail" name="takeUserAddrD" placeholder="상세주소" >
                                </div>
                            </li>
                        </ul> 
				</div>
				<div class="formArea right col mt-3 ms-5">
					<h3 class="o_tit d-flex justify-content-start">
						<span> 결제정보 </span>
					</h3>

					<ul style="display: inline-block;">
						<li class="total_l l_tit" style="display: block;">
							<div class="form_box">
								<p class="price">
									총구매금액 <em class="ms-3" style="font-weight: 500;">KRW</em> <span
										class="orderPrice">0</span>
								</p>

							</div>
						</li>
						<li class="pay l_tit" style="display: block;">
							<div class="form_box">
								<p class="float-start">결제수단</p>
								<input type="radio" value="20" checked> <label for="">신용카드</label>
							</div>
						</li>
					</ul>
					<div class="totalArea">
						<ul>
						<li>
							<p class="priceName l_tit float-start">상품금액</p>
							<p class="price float-end">
								KRW <span class="orderPrice">0</span>
							</p>
						</li>
						<li>
							<p class="priceName l_tit float-start">배송비</p>
							<p class="price float-end">
								KRW <span class="transPrice">0</span>
							</p>
						</li>
						<li>
							<p class="priceName l_tit float-start">총 결제금액</p>
							<p class="price float-end">
								KRW <span class="finalPrice">0</span>
								<input type="hidden" id="abc" name="totalPrice" value="0">
							</p>
						</li>
						</ul>
					</div>
				</div>
				<div class="btnArea mt-5 d-flex justify-content-center">
					<button type="button" class="btn btn-light btn-lg" onclick="location.href='${pageContext.request.contextPath}/eshop/cartList'"
						style="border: 2px solid #AD9E87; color: #AD9E87;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이전
						단계&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					<button type="button" class="btn btn-secondary btn-lg ms-1 buyBtn"
						style="background: #AD9E87; border: 2px solid #AD9E87; color: #fff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제
						하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
			</div>
		</div>
	</form>
	</section>
	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	$(document).ready(function() {
	 	let totalPrice = [...document.querySelectorAll('.total')];
	 	let pPrice = 0;
		
		totalPrice.forEach( price =>{
			pPrice += +price.textContent.replaceAll(',','');
		});
		
		$('.orderPrice').text(pPrice.toLocaleString());
		$('.finalPrice').text(pPrice.toLocaleString());
		$('#abc').val(pPrice);
		memberCode = '${member.memberCode}';
		$('#memCo').val(memberCode);
		
		
		
		
	 $('.left').on('change', '.sameChk', function() {
		
		if($(this).is(":checked")){	
		 $('#takeUser').val('${member.name}');
		 $('#takeUserPhone').val('${member.tel}');
		 $('#zipCode').val('${member.zipCode}');
		 $('#addrBasic').val('${member.addrBasic}');
		 $('#addrDetail').val('${member.addrDetail}');
		 
		 }else{
			 $('#takeUser').val(''); 
			 $('#takeUserPhone').val('');
			 $('#zipCode').val('');
			 $('#addrBasic').val('');
			 $('#addrDetail').val('');
		 }
     });
	 
	 $('.buyBtn').click(function() {
			if($('#takeUser').val()===''){
				alert('입력하세요!');
				return;
				
			}else if($('#takeUserPhone').val() === ''){
				alert('입력하세요!');
				return;
				
			}else if($('#zipCode').val() === ''){
				alert('입력하세요!');
				return;
				
			}else if( $('#addrBasic').val() === ''){
				alert('입력하세요!');
				return;
				
			}else if( $('#addrDetail').val() === ''){
				alert('입력하세요!');
				return;
			}else{
				alert('결재 진행!');
				$('#orderForm').submit();
			}
	});
	 
	});
	
			 
	
	 function searchAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분..
                    var extraAddr = ''; // 참고항목 변수
                    
        	        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }

					// 사용자가 선택한 값 해당 요소에 입력해주기.
                    $('#addrBasic').val(data.roadAddress);
					$('#zipCode').val(data.zonecode);
					$('#addrDetail').focus();
    				
                }
            }).open();
        }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
</body>