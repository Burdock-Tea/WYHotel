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
                <form id="updateForm" method="post" action="${ pageContext.request.contextPath }/promotion/update" enctype="multipart/form-data">
                	<input type="hidden" name="promotionCode" value="${ param.promotionCodeData }">
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
                        <label for="file" class="form-label">이미지 파일 선택 (업로드할 파일을 선택하지 않을시 수정되지 않고 유지됩니다.)</label>
                        <div class="input-group">
						  <input class="form-check-input" type="checkbox" name="imageUpdate" id="imageUpdate">
						  <label class="form-check-label" for="imageUpdate">
						     &nbsp; 이미지 수정하기
						  </label>
						  <div class="img-wrapper">
						  	<br>
						  	<label>현재 등록되어 있는 이미지</label>
						  	<img alt="promotion-img" src="${pageContext.request.contextPath}/promotion/display?fileLocation=${ promotion.fileLocation }&fileName=${ promotion.fileName }">
						  </div>
						</div>
                        <div class="input-group file-group" hidden="true">
                            <input type="file" class="form-control" id="file" name="file">
                        </div>
                    </div>
                    <hr>
                    <div class="mt-3 d-flex justify-content-center">
                        <button id="updateBtn" type="button" class="btn btn-outline-secondary">수정하기</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <script>
    
    	$(function() {
    	  
    	  $('#imageUpdate').change(function (e) {             
              if(e.target.checked) {
                  $('.file-group').removeAttr('hidden');
                  $('.img-wrapper').attr('hidden', 'true');
              } else {
                  $('.file-group').attr('hidden', 'true');
                  $('.img-wrapper').removeAttr('hidden');
              }                          
          });
    	  
    	  $('#updateBtn').click(function(e) {
    		  
    		  // 지점 선택 유효성 검사
    		  if($('#hotel').val() === 'none') {
    			  alert('지점을 선택해주세요.');
    			  $('#hotel').focus();
    			  return;
    		  }
    		  
    		  // 객실 선택 유효성 검사
    		  if($('#room').val() === 'none') {
    			  alert('객실을 선택해주세요.');
    			  $('#room').focus();
    			  return;
    		  }
    		  
    		  // 시작 날짜 유효성 검사
    		  if($('#startDate').val() === '') {
    			  alert('시작 날짜를 입력해주세요.');
    			  $('#startDate').focus();
    			  return;
    		  }
    		  
    		  // 마침 날짜 유효성 검사
    		  if($('#endDate').val() === '') {
    			  alert('마침 날짜를 입력해주세요.');
    			  $('#endDate').focus();
    			  return;
    		  }
    		  
    		  // 프로모션 이름 유효성 검사
    		  if($('#promotionName').val().trim() === '') {
    			  alert('프로모션 이름을 입력해주세요.');
    			  $('#promotionName').focus();
    			  return;
    		  }
    		  
    		  // 프로모션 가격 유효성 검사
    		  if($('#promotionPrice').val().trim() === '') {
    			  alert('프로모션 가격을 입력해주세요.');
    			  $('#promotionPrice').focus();
    			  return;
    		  }
    		  
    		  // 프로모션 정보 유효성 검사
    		  if($('#promotionContent').val().trim() === '') {
    			  alert('프로모션 내용을 입력해주세요.');
    			  $('#promotionContent').focus();
    			  return;
    		  }
    		  
    		  // 이미지 파일 수정을 위해서는 체크박스에 체크를 하고, 이미지를 넣어야함
    		  // 체크하고 이미지를 안넣을 경우 클라이언트에서는 튕겨냅시다!
    		  if(($('#imageUpdate').is(':checked')) && ($('#file').val() === '')) {
    			  alert('이미지 파일을 수정하거나, 이미지 수정하기 체크박스를 수정해주세요.');
    			  $('#imageUpdate').focus();
    			  return;
    		  }
    		  
    		  if(confirm('수정하시겠습니까?')) {
    			  $('#updateForm').submit();
    		  } else {
    			  return;
    		  }
    	  });
    	  
    	  $('#file').on('change', function() {    		  
      		
  			let file = $('#file').val();
      		
  			file = file.slice(file.lastIndexOf('.') + 1).toLowerCase();			
  			
  			if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp' && file !== 'gif') {
  				alert('이미지 파일만 업로드가 가능합니다. (jpg, png, jpeg, bmp, gif)');
  				$('#file').val('');
  				return;
  			}
      		  
      	  });
    	  
    	});
    </script>
    
    <%@ include file="../include/footer.jsp" %>