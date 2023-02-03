<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="../include/eshopheader.jsp" %>
    <!-- 몸통 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="titlebox p-3">
                    <div class="page_tit mt-5 p-2">
                        <h1 class="mb-3"> 주문내역 </h1>
                    </div>
                </div>
                
                <div class="cart_list_area row">
                        <ul class="cartList mt-4" style="margin: 0 auto; border-top:none;">
                         
  							<c:forEach var="article" items="${list}">
                                <li style="font-size:20px; text-align:left; height:22px; line-height:5px; padding-left:15px !important ; background:#888; color:white;">주문번호: <span>${article.ordernum}</span></li>
                                <c:forEach var="prod" items="${article.prodList}">
                                <li id="productNo1">
                                    <div class="img_area form-check col-sm float-start">
                                        <img src="${pageContext.request.contextPath}/img/${prod.image}" width="150" height="150">
                                    </div>
                                    <div class="txtInfo mt-4 col-sm" style="margin-right: 150px;">
                                        <p class="tit"> ${prod.name}</p>
                                        <p class="tit" style="margin-left : 220px;">KRW <span> <fmt:formatNumber value="${prod.price}" pattern="#,###" /></span> <span class="float-end"> 배송전</span> </p>
                                        <p class="tit">개수 <span> ${prod.quantity} </span></p>
                                    </div>
                                </li>
                                </c:forEach>
                          	</c:forEach>				
                        </ul>
                 </div>
                
                <ul class="infoTxt mt-4">
                   <li>- [쇼핑하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
                </ul>
                <div class="btnArea mt-4">
                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/eshop/productList'" class="btn btn-light btn-lg" style="border: 2px solid #AD9E87; color: #AD9E87;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;쇼핑하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                </div>
                    
                  
            </div>
        </div>
    </section>

</body>
</html>