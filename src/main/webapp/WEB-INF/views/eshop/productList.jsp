<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/eshopheader.jsp" %>
	<section id="content">
		<div class="container">
			<div class="lnb">
				<div class="pageTitle">
					<h1>wy hotel premium set</h1>
				</div>
			</div>
			<div class="content product product_lists_page">
				<div class="prd_top">
					<p class="txt" style="height: 0px;">
						"총 <em id="list_total"></em> 개의 상품이 있습니다."
					</p>
					<div id="sort" class="dropdown" style="margin-left: 77%; height: 30px;">
						<button class="btn float-right" id="dLabel" type="button"
							data-bs-toggle="dropdown" aria-expanded="false">높은 가격순</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="reg">등록순</a></li>
                            <li><a class="dropdown-item" href="low">낮은 가격순</a></li>
                            <li><a class="dropdown-item" href="high">높은 가격순</a></li>
						</ul>
					</div>
				</div>
				<!-- 리스트 돌리고돌리고 -->
				<div class="prd_list">
					<ul id="product_ul">
					<!-- <c:forEach var="article" items="${list}">	
						<li><picture> <a
								href="${pageContext.request.contextPath}/eshop/productDetail/${article.prodnum}"> <img
								src="${pageContext.request.contextPath}/img/${article.image}" style="width:100%">
							</a> </picture>
							<p class="tit">
								<span class="sub_tit"> <em class="cate">[wy premium]</em>
								</span> <a href="/eshop/product/product_view?product_cd=LH20215021">
									${article.name}</a>
							</p>
							<p class="price">
								<span class="price_box"> <span class="main_price">${article.price}<em>KRW</em></span>
								</span>
							</p></li>
					</c:forEach> -->
					</ul>
						
				</div>
			</div>
		</div>

	</section>
	
	<!-- 스크립트 -->
	<script>
	  $(document).ready(function(){
          
          function status(condition){
              const $productUl = $('#product_ul')[0];
              console.log('------------', $productUl);
              const arr = [...$productUl.children];
              if (arr.length !== 0) {
                  $productUl.replaceChildren();
              }
              $.ajax({
                  type : 'post',
                  url : '${pageContext.request.contextPath}/eshop/productList',
                  contentType : 'application/json',
                  data : condition,
                  success : function(result){
                	  let $frag = document.createDocumentFragment();
                	  $('#list_total').text(result.length);
                	  for(let article of result){
                    	  let $li = 
                        	  `<li><picture> <a
								href="${pageContext.request.contextPath}/eshop/productDetail/`+ article.prodnum +`"> <img
								src="${pageContext.request.contextPath}/img/`+article.image+` " style="width:100%">
							</a> </picture>
							<p class="tit">
								<span class="sub_tit"> <em class="cate">[wy premium]</em>
								</span> <a href="${pageContext.request.contextPath}/eshop/productDetail/`+article.prodnum+`">
									`+article.name+ `</a>
							</p>
							<p class="price">
								<span class="price_box"> <span class="main_price">`+ article.price.toLocaleString() + `<em>KRW</em></span>
								</span>
							</p></li>
                          `;
                          //$productUl.append($li);
                          $('#product_ul').append($li);
                      }
//                	  $('#product_ul').appendChild($frag);
                	  
                  }
              })
          }
         // let $li = '';
			status('high');
          
          $(document).on('click', '#sort a', function (e) {
              e.preventDefault();

              $('#dLabel').text($(this).text());
              const condition = $(this).attr('href');
              console.log(condition);
              status(condition);
          });
      });

	</script>
</body>
</html>