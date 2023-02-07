<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/eshopheader.jsp" %>
    <!-- 몸통 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="titlebox p-3">
                    <div class="page_tit mt-5 p-2">
                        <h1 class="mb-3"> 주문완료 </h1>
                    </div>
                </div>
                <div class="order">
                    <div class="current_navi col-8" style="float: none; margin: 0 auto;">    
                        <ul class="ms-5" style="list-style: none; text-align: center;">
                            <li class="ms-5" style="float: left;">
                                <span class="ms-5" style="float: left;">1</span>
                                <p class="ms-3" style="float: left;">장바구니</p>
                            </li>
                            <li class="ms-5" style="float: left;">
                                <span class="ms-5" style="float: left;">2</span>
                                <p class="ms-3" style="float: left;">주문서 작성</p>
                            </li>
                            <li  class="active  ms-5" style="float: left;">
                                <span class="ms-5" style="float: left;">3</span>
                                <p class="ms-3" style="float: left;">주문완료</p>
                            </li>
                        </ul>
                    </div>    
                </div>        
                <div class="cart_list_area row">
                        <ul class="cartList mt-4" style="margin: 0 auto;">
                                <li class="mt-3 p-3"> <em> 주문이 완료되었습니다. </em> </li> 
                        <c:forEach var="article" items="${list}">
                                <li id="productNo1">    
                                    <div class="img_area form-check col-sm float-start">
                                        <img src="${pageContext.request.contextPath}/img/${article.image}" width="150" height="150">
                                    </div>
                                    <div class="txtInfo mt-4 col-sm" style="margin-right: 150px;">
                                        <p class="tit"> ${article.name}</p>
                                        <p class="mt-3">KRW <span class="total"><fmt:formatNumber value="${article.price * article.quantity}" pattern="#,###" /></span></p>
                                    </div>
                                    <div class="count col-sm">
                                        <div class="mt-3 col-sm" style="margin-right: 150px;">
                                        <p class="mt-3">개&ensp;수&ensp;<span class="eachCount">${article.quantity}</span></p>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                 </div>
                 
                <div class="totalArea">
                    <ul>
                        <li>
                            <p class="price_name">총 결재금액</p>
                            <p class="price">KRW
                                <span class="finalPrice">0</span>
                            </p>
                        </li>
                    </ul>
                </div>
                <ul class="infoTxt mt-4">
                   <li>- [계속 쇼핑하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
                </ul>
                <div class="btnArea mt-4">
                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/eshop/productList'" class="btn btn-light btn-lg" style="border: 2px solid #AD9E87; color: #AD9E87;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계속 쇼핑하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                </div>
                    
                  
            </div>
        </div>
    </section>
 	<script>
 		$(document).ready(function() {
 			
 			let totalPrice = [...document.querySelectorAll('.total')];
 		 	let pPrice = 0;
 			
 			totalPrice.forEach( price =>{
 				pPrice += +price.textContent.replaceAll(',','');
 			});
 			
 			$('.finalPrice').text(pPrice.toLocaleString());
 			
		});
 	
 	
 	</script>
</body>
</html>