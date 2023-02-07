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
						<h1 class="mb-3">장바구니</h1>
					</div>
				</div>
				<div class="order">
					<div class="current_navi col-8"
						style="float: none; margin: 0 auto;">
						<ul class="ms-5" style="list-style: none; text-align: center;">
							<li class="active ms-5" style="float: left;"><span
								class="ms-5" style="float: left;">1</span>
								<p class="ms-3" style="float: left;">장바구니</p></li>
							<li class="ms-5" style="float: left;"><span class="ms-5"
								style="float: left;">2</span>
								<p class="ms-3" style="float: left;">주문서 작성</p></li>
							<li class="ms-5" style="float: left;"><span class="ms-5"
								style="float: left;">3</span>
								<p class="ms-3" style="float: left;">주문완료</p></li>
						</ul>
					</div>
				</div>
				
				<div class="cart_list_area row">
					<div class="select_area ">
						<div class="form-check mt-3">
							<input class="form-check-input float-start cbx_chkAll" type="checkbox"
								value="" id="flexCheckDefault"> <label
								class="form-check-label" for="flexCheckDefault"> 전체 선택 </label>
							<button type="button" class="btn btn-sm float-end"
								style="border: 1px solid black;" id="btnDel">선택 삭제</button>
						</div>
						<ul class="cartList mt-4" style="margin: 0 auto;">
							<c:if test="${empty list}">
                                <li class="mt-3 p-3"> 등록된 상품이 없습니다. </li>
                            </c:if>    
                            <c:forEach var="article" items="${list}">    
							<li id="productNo1">
								<div class="img_area form-check col-sm">
									<input type="hidden" name="cartnum" value="${article.cartnum}" id="cartnum">
									<input class="form-check-input float-start delChk" name="chkbox" type="checkbox"
										value="" id="flexCheckDefault"> <label
										class="form-check-label float-start" for="flexCheckDefault">
										<img src="${pageContext.request.contextPath}/img/${article.image}" name="image" width="150" height="150">
									</label>
								</div>
								<div class="txtInfo col-sm">
									<p class="tit" name="name">${article.name}</p>
									
								</div>
								<div class="priceInfo col-sm">
									<div class="count">
										<button type="button" class="minus btn btn-light"
											style="background: white;">-</button>
										<input type="num" id="result" name="quantity" value="${article.quantity}" title="수량" readonly
											style="width: 30px; text-align: center; background: white;">
										<button type="button" class="plus btn btn-light"
											style="background: white;">+</button>
									</div>
									<div class="price mt-1 col-sm">
										<p class="mt-1" name="price">
											가&ensp;격: KRW <span class="eachPrice"><fmt:formatNumber value="${article.price}" pattern="#,###" /></span>
										</p>
										<p class="mt-1 semiTotalPrice" name="totalPrice">
											소&ensp;계: KRW <span class="total"><fmt:formatNumber value="${article.price * article.quantity}" pattern="#,###" /></span>
										</p>
									</div>
								</div>
							</li>
							</c:forEach>
							
						</ul>

					</div>
				</div>
				<div class="totalArea">
					<ul>
						<li>
							<p class="price_name">총 결재금액</p>
							<p class="price">
								KRW <span id="totalPrice">0</span>
							</p>
						</li>
					</ul>
				</div>
				
				<ul class="infoTxt mt-2">
					<li>- 선택하신 상품의 수령을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
					<li>- [계속 쇼핑하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
				</ul>
				<div class="btnArea mt-4">
					<button type="button" class="btn btn-light btn-lg" onclick="location.href='${pageContext.request.contextPath}/eshop/productList'"
						style="border: 2px solid #AD9E87; color: #AD9E87;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계속
						쇼핑하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					<button type="button " class="btn btn-secondary btn-lg" id="buyBtn"
						style="background: #AD9E87; border: 2px solid #AD9E87; color: #fff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품
						구매하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>

			</div>
		</div>
	</section>

</body>
<script>
    
    $('.cartList').on('click', '.plus', function(){
        $amount = $(this)[0].parentNode.children[1];
        $amount.value = +$amount.value + 1;
        // 개별 가격으로 품목별 가격 구함
        eachPrice = $(this)[0].parentNode.parentNode.querySelector('.eachPrice').textContent;
        $total = $(this)[0].parentNode.parentNode.querySelector('.total');
        console.log($total.textContent);

        $total.textContent = (+eachPrice.replaceAll(',','') * $amount.value).toLocaleString();
        // 총 가격 변경
        setTotalPrice();
    })
    $('.cartList').on('click', '.minus', function(){
        $amount = $(this)[0].parentNode.children[1];
        if (+$amount.value > 0){
            $amount.value = +$amount.value - 1;
            // 개별 가격으로 품목별 가격 구함
            eachPrice = $(this)[0].parentNode.parentNode.querySelector('.eachPrice').textContent;
            $total = $(this)[0].parentNode.parentNode.querySelector('.total');

            $total.textContent = (+eachPrice.replaceAll(',','') * $amount.value).toLocaleString();
            
            // 총 가격 변경
            setTotalPrice();
        }
        else return;
    })
    
    $('.cartList').on('change', '.delChk', function() {
    	setTotalPrice();
    });
    	
    

    /**총 가격 설정 함수*/
    function setTotalPrice () {
        // 토탈 배열 가져옴
        const prices = [...document.querySelectorAll('.total')];
        let price = 0;
        prices.forEach(total => {
			const $li = total.parentNode.parentNode.parentNode.parentNode;
			console.log($li, '123123125456');
			if ($li.querySelector('.delChk').checked)
            	price = price + +total.textContent.replaceAll(',','');
        });
        document.querySelector('#totalPrice').textContent = price.toLocaleString();
    }

        
     let checkProduct = [];
     let overLapRemove = [];
		
     $('.cartList').on('change', '.delChk', function() {
    	 if($(this).is(":checked")){
    		 overLapRemove.push($(this).prev().val());
    	 } else {
    		 overLapRemove.splice(overLapRemove.indexOf($(this).prev().val()), 1);
    	 }
    	 
			var total = $("input[type=checkbox]").length;
			var checked = $("input[type=checkbox]:checked").length;

			if(total != checked) $(".cbx_chkAll").prop("checked", false);
			else $(".cbx_chkAll").prop("checked", true); 
     });

        $('#btnDel').click(function() {
			
        	var objParam = {
        		"list" : overLapRemove	
        	};
        	
        	
        	
        	$.ajax({
                url         :   "${pageContext.request.contextPath}/eshop/delCart",
                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                type        :   "post",
                data        :   objParam,
                success     :   function(result){
                	 if (result === 'success') {
						
						alert('정상적으로 삭제되었습니다.');
						location.reload();
					}           
                }
            });
		});
   
     $(document).ready(function() {
    		$(".cbx_chkAll").click(function() {
    			if($(".cbx_chkAll").is(":checked")){
    				$("input[type=checkbox]").prop("checked", true);

			     $("input[name=chkbox]:checked").each(function(){
			    	 const chk = $(this).prev().val();
			    	 checkProduct.push(chk);
			         checkProduct.forEach(function(item, index){
			         	if(!(overLapRemove.indexOf(item) >= 0)){
			         		overLapRemove.push(item);
			         	}
			         }); 
			    	 

			     });
    			}
    			else if ($("input[type=checkbox]").prop("checked", false)){
    				$("input[name=chkbox]").each(function(){
   			    	 var chk = $(this).prev().val();
   			    	 overLapRemove.pop(chk);
   			    	
   			     });
    			};
		     	setTotalPrice();

    		});
    				
    	});               
    
     
		$('#buyBtn').click(function() {
			
			const checked = [];
			const unChecked = [];
			const prods = [...$('.cartList')[0].children];
			prods.forEach(li => {
				if(li.querySelector('.delChk').checked){
					checked.push(
						//'cartnum': li.querySelector('#cartnum').value,
						 li.querySelector('#result').value
						);
				}else{
					unChecked.push(
						li.querySelector('#cartnum').value
					);
				}
			})
			
			if(checked.length === 0){
				alert('주문할 상품을 선택해주세요');
				return;
			}
			var objParam = {
        		"cartnum" : overLapRemove,
        		"quantity" : checked,
        		"unChecked" : unChecked
        		
        	};
			console.log(objParam , '156456456456465');
			$.ajax({
                url         :   "${pageContext.request.contextPath}/eshop/updateOrder",
                contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                type        :   "post",
                data        :   objParam,
                success     :   function(){
                	location.href = "${pageContext.request.contextPath}/eshop/orderList";         
                }
            });
			
		});
    
    
   

</script>
</html>