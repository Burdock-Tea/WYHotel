<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>

	<section>
        <div class="container">
            <div class="w-50 p-3 mt-3" style="background-color: #eee; margin: 0 auto;">
                <h2 class="mt-3 mb-3">프로모션 수정 (관리자 시점)</h2>
                <hr>
                <form method="post" action="${ pageContext.request.contextPath }/promotion/update" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="hotel" class="form-label">지점선택</label>
                        <select class="form-select" id="hotel" name="hotelCode">
                            <option value='none'>선택</option>
                            <option value="10" ${ promotion.hotelCode == "10" ? "selected" : "" }>서울</option>
                            <option value="20" ${ promotion.hotelCode == "20" ? "selected" : "" }>부산</option>
                            <option value="30" ${ promotion.hotelCode == "30" ? "selected" : "" }>제주</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="room" class="form-label">객실선택</label>
                        <select class="form-select" id="room" name="roomCode">
                            <option value='none'>선택</option>
                            <option value="55" ${ promotion.roomCode == "55" ? "selected" : "" }>Suite</option>
                            <option value="44" ${ promotion.roomCode == "44" ? "selected" : "" }>Business Deluxe</option>
                            <option value="33" ${ promotion.roomCode == "33" ? "selected" : "" }>Business</option>
                            <option value="22" ${ promotion.roomCode == "22" ? "selected" : "" }>Standard Deluxe</option>
                            <option value="11" ${ promotion.roomCode == "11" ? "selected" : "" }>Standard</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">날짜선택</label>
                        <div class="input-group">
                            <span class="input-group-text">시작날짜</span>
                            <input type="date" aria-label="startDate" class="form-control" id="startDate" name="startDate" value="<fmt:formatDate value="${ promotion.startDate }" pattern="yyyy-MM-dd"/>">
                            <span class="input-group-text">마침날짜</span>
                            <input type="date" aria-label="endDate" class="form-control" id="endDate" name="endDate" value="<fmt:formatDate value="${ promotion.endDate }" pattern="yyyy-MM-dd"/>">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="promotionName" class="form-label">프로모션 이름</label>
                        <input type="text" class="form-control" id="promotionName" placeholder="입력" name="promotionName" value="${ promotion.promotionName }">
                    </div>
                    <div class="mb-3">
                        <label for="promotionPrice" class="form-label">프로모션 가격</label>
                        <input type="text" class="form-control" id="promotionPrice" placeholder="입력" name="promotionPrice" value="${ promotion.promotionPrice }">
                    </div>
                    <div class="mb-3">
                        <label for="promotionContent" class="form-label">프로모션 정보</label>
                        <textarea class="form-control" id="promotionContent" rows="3" name="promotionContent">${ promotion.promotionContent }</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="file" class="form-label">이미지 파일 선택</label>
                        <div class="input-group">
						  <input class="form-check-input" type="checkbox" value="" id="imageUpdate">
						  <label class="form-check-label" for="imageUpdate">
						     이미지 수정하기
						  </label>
						</div>
                        <div class="input-group file-group" hidden="true">
                            <input type="file" class="form-control" id="file" name="file">
                        </div>
                    </div>
                    <hr>
                    <div class="mt-3 d-flex justify-content-center">
                        <button type="submit" class="btn btn-outline-secondary">등록하기</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <script>
    
    $(function() {
    	  $('input[name="daterange"]').daterangepicker({
    	    opens: 'left'
    	  }, function(start, end, label) {
    	    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
    	  });
    	  
    	  $('#imageUpdate').change(function (e) {             
              if(e.target.checked) {
                  $('.file-group').removeAttr('hidden');
              } else {
                  $('.file-group').attr('hidden', 'true');
              }
          });
    	  
    	});
    </script>
    
    <%@ include file="../include/footer.jsp" %>