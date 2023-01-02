<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>

	<section>
        <div class="container">
            <div class="w-50 p-3 mt-3" style="background-color: #eee; margin: 0 auto;">
                <h2 class="mt-3 mb-3">프로모션 등록 (관리자 시점)</h2>
                <hr>
                <form id="insertForm" method="post" action="${ pageContext.request.contextPath }/promotion/insert" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="hotel" class="form-label">지점선택</label>
                        <select class="form-select" id="hotel" name="hotelCode">
                            <option value="none" selected>선택</option>
                            <option value="10">서울</option>
                            <option value="20">부산</option>
                            <option value="30">제주</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="room" class="form-label">객실선택</label>
                        <select class="form-select" id="room" name="roomCode">
                            <option value="none" selected>선택</option>
                            <option value="55">Suite</option>
                            <option value="44">Business Deluxe</option>
                            <option value="33">Business</option>
                            <option value="22">Standard Deluxe</option>
                            <option value="11">Standard</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">날짜선택</label>
                        <div class="input-group">
                            <span class="input-group-text">시작날짜</span>
                            <input type="date" aria-label="startDate" class="form-control" id="startDate" name="startDate">
                            <span class="input-group-text">마침날짜</span>
                            <input type="date" aria-label="endDate" class="form-control" id="endDate" name="endDate">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="promotionName" class="form-label">프로모션 이름</label>
                        <input type="text" class="form-control" id="promotionName" placeholder="입력" name="promotionName">
                    </div>
                    <div class="mb-3">
                        <label for="promotionPrice" class="form-label">프로모션 가격</label>
                        <input type="text" class="form-control" id="promotionPrice" placeholder="입력" name="promotionPrice" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    </div>
                    <div class="mb-3">
                        <label for="promotionContent" class="form-label">프로모션 정보</label>
                        <textarea class="form-control" id="promotionContent" rows="3" name="promotionContent"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="file" class="form-label">이미지 파일 선택</label>
                        <div class="input-group file-group">
                            <input type="file" class="form-control" id="file" name="file" accept="image/*">
                        </div>
                    </div>
                    <hr>
                    <div class="mt-3 d-flex justify-content-center">
                        <button id="insertBtn" type="button" class="btn btn-outline-secondary">등록하기</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <script>
    
    $(function() {    	  

    	  $('#startDate').val(getDate());    	  
    	  
    	  // 등록버튼 클릭했을때 유효성 검사
    	  $('#insertBtn').click(function() {   		  
    		  
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
    		  
    	  });
    	  
    	  // 파일 업로드시 이미지만 업로드가 가능하게 하자
    	  $('#file').on('change', function() {    		  
    		
			let file = $('#file').val();
    		
			file = file.slice(file.lastIndexOf('.') + 1).toLowerCase();			
			
			if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp' && file !== 'gif') {
				alert('이미지 파일만 업로드가 가능합니다. (jpg, png, jpeg, bmp, gif)');
				$('#file').val('');
				return;
			}
    		  
    	  });
    	  
    	  // 마감 날짜 선택시 처음 날짜보다 과거일 경우 유효성 검사
    	  $('#endDate').on('change', function() {
    		  
    		  let startDate = new Date($('#startDate').val());
              let endDate = new Date($('#endDate').val());
			  
              if(Date.parse(endDate) - Date.parse(startDate) <= 0) {
            	  alert('마침날짜는 시작날짜보다 클수가 없습니다!');
            	  $('#endDate').val('');
              }
              
    	  });
    	  
    	  // 시작 날짜를 오늘 날짜로 하기 위한 함수
    	  function getDate() {
    		  let date = new Date();
    		  
    		  let year = String(date.getFullYear());
              let month = String(date.getMonth() + 1);
              let day = String(date.getDate());

              if(month.length === 1) {
                month = '0' + month;
              }

              if(day.length === 1) {
                day = '0' + day;
              }         
              
              return year + '-' + month + '-' + day;
    	  }
    	  
    	  
    	});
    </script>
    
    <%@ include file="../include/footer.jsp" %>