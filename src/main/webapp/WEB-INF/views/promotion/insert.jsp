<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>

	<section>
        <div class="container">
            <div class="w-50 p-3 mt-3" style="background-color: #eee; margin: 0 auto;">
                <h2 class="mt-3 mb-3">프로모션 등록 (관리자 시점)</h2>
                <hr>
                <form method="post" action="${ pageContext.request.contextPath }/promotion/insert" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="hotel" class="form-label">지점선택</label>
                        <select class="form-select" id="hotel" name="hotelCode">
                            <option selected>선택</option>
                            <option value="10">서울</option>
                            <option value="20">부산</option>
                            <option value="30">제주</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="room" class="form-label">객실선택</label>
                        <select class="form-select" id="room" name="roomCode">
                            <option selected>선택</option>
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
                        <input type="text" class="form-control" id="promotionPrice" placeholder="입력" name="promotionPrice">
                    </div>
                    <div class="mb-3">
                        <label for="promotionContent" class="form-label">프로모션 정보</label>
                        <textarea class="form-control" id="promotionContent" rows="3" name="promotionContent"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="file" class="form-label">이미지 파일 선택</label>
                        <div class="input-group">
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
    	});
    </script>
    
    <%@ include file="../include/footer.jsp" %>