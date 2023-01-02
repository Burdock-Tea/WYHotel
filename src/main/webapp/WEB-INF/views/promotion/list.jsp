<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>
<style>
.promotion-wrap .card{
    margin: 0 auto;
}
</style>
	<section>
        <div class="container">
            <h2 class="text-center mb-2 mt-2">프로모션</h2>
            <!-- 관리자로 로그인 했을때 보이게 하면 됩니다 -->
            <button type="button" class="btn btn-secondary" onclick="location.href='${ pageContext.request.contextPath }/promotion/insert'">프로모션 등록</button>
            <!-- 관리자로 로그인 했을때 보이게 하면 됩니다 -->
            <div class="promotion-wrap">
                <hr>
                <!-- 프로모션 리스트 시작 지점 -->
                <c:forEach items="${ promotionList }" var="list">
	                <div id="${ list.promotionCode }" class="card mb-3" style="max-width: 800px;">
	                    <div class="row g-0">
	                      <div class="col-md-4">
	                      	<div class="img-wrapper">
	                        	<img src="${pageContext.request.contextPath}/promotion/display?fileLocation=${ list.fileLocation }&fileName=${ list.fileName }" class="img-fluid rounded-start" alt="...">
	                        </div>
	                      </div>
	                      <div class="col-md-8">
	                        <div class="card-body clearfix">
	                          <h5 class="card-title">${ list.promotionName }</h5>
	                          <p class="card-text">${ list.promotionContent }</p>
	                          <span class="card-date"><fmt:formatDate value="${ list.startDate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${ list.endDate }" pattern="yyyy-MM-dd"/></span><br>	                          
	                          <strong class="card-price"><fmt:formatNumber value="${ list.promotionPrice }" type="currency"/></strong>	                          
	                          <button type="button" class="btn btn-primary modalBtn float-end" data-bs-toggle="modal" data-bs-target="#detailModal" data-promotion-code="${ list.promotionCode }">
                            	상세보기
                         	  </button>
	                        </div>
	                      </div>
	                    </div>
	                </div>
                </c:forEach>
                <!-- 프로모션 리스트 끝 지점 -->
            </div>
        </div>
    </section>
    
    <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg"> <!-- modal 크기 조절 -->
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="detailModalLabel">프로모션 상세보기</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">              
                <div class="container-fluid">
                    <div class="p-3 mt-3" style="background-color: #eee; margin: 0 auto;">                        
                        <form>
                            <div class="mb-3 clearfix">
                                <div class="img-wrapper">
                                    <img src="./img/to-travel-gb2e60ab1c_1920.jpg" class="img-fluid rounded-start" alt="...">                                
                                </div>
                                <span id="modalDate" class="float-start">2023-01-10 ~ 2023-01~17</span><span id="modalPrice" class="float-end">$200,000</span>
                            </div>
                            <hr>
                            <div class="mb-3">
                                <strong id="modalName">프로모션 이름</strong>
                            </div>
                            <div class="mb-3">                                
                                <textarea class="form-control" id="modalContent" rows="3" style="resize: none;" disabled>프로모션 내용</textarea>
                            </div>
                        </form>
                    </div>
                </div>              
            </div>
            <div class="modal-footer">
            	<form action="#" method="get">
            		<input id="promotionCodeData" name="promotionCodeData" type="hidden"/>
	                <!-- 관리자 로그인시에만 보이게 끔 c:if 사용 -->
	                <button id="updateBtn" type="button" class="btn btn-success">수정하기</button>
	                <button id="deleteBtn" type="button" class="btn btn-danger">삭제하기</button>
	                <!-- 관리자 로그인시에만 보이게 끔 c:if 사용 -->
	                <button id="resvBtn" type="button" class="btn btn-dark">예약하기</button>	                
	           </form>
            </div>
          </div>
        </div>
    </div>
    
    <script>
    
    	$(document).ready(function() {
    		
    		$('.modalBtn').click(function() {
    			
    			// 프로모션 값 가지고 오기 + id 선택자까지
    			const promotionCode = '#' + $(this).data('promotionCode');
    			$('#promotionCodeData').val($(this).data('promotionCode'));
    			
    			// 모달안에 값을 넣어주자
    			$('.modal-body .img-wrapper img').attr('src', $(promotionCode + ' .img-wrapper img').attr('src'));
    			$('#modalName').text($(promotionCode + ' .card-body .card-title').html());
    			$('#modalDate').text($(promotionCode + ' .card-body .card-date').text());
    			$('#modalContent').val($(promotionCode + ' .card-body .card-text').html());
    			$('#modalPrice').text($(promotionCode + ' .card-body .card-price').html());
    			
    		});
    		
    		$('#updateBtn').click(function() {
    			
    			const promotionCode = $('#promotionCodeData').val();
    			$(this).parent().attr('action', '${pageContext.request.contextPath}/promotion/update');
    			$(this).parent().submit();
    			
    		});
    		
    	});
    	
    </script>
<%@ include file="../include/footer.jsp" %>