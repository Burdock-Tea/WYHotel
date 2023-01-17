<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	<%@ include file="../include/header.jsp" %>

	<style>

		#questionList .question-items:hover {
			background-color: #FF8242;
			cursor: pointer;
		}

	</style>
		
	<section> <!-- start question body -->
        <div class="container">
            <h2 class="mt-3">
                문의내역 관리 (관리자 시점)
            </h2>
            <div class="row justify-content-end">                
                <div class="col-5">                	
                    <div class="input-group mb-3 align-self-end">
                        <select class="form-select" aria-label="addon" id="category" name="category">
                            <option value="none" selected>선택</option>
                            <option value="name">이름</option>
                            <option value="tel">전화번호</option>
                        </select>
                        <input type="text" class="form-control" placeholder="검색어를 넣어주세요" name="keyword">
                        <button class="btn btn-outline-secondary" type="button" id="search">검색</button>
                    </div>
                </div>
            </div>
            <form id="adminMemberForm" method="post">
	            <table id="memberTable" class="table">
	                <thead>
	                  <tr class="admin-table">
	                    <th>문의코드</th>
						<th>지점</th>
						<th>유형</th>
						<th>제목</th>
						<th>문의날짜</th>
						<th>답변날짜</th>						
	                  </tr>
	                </thead>	                	                
	                <tbody id="questionList">
	                	<!-- 리스트 반복문 시작 지점 -->
	                	<c:forEach items="${ list }" var="question">
		                    <tr class="question-items" data-question-code="${ question.questionCode }">
								<td>${ question.questionCode }</td>
								<td>${ question.hotelCode == "10" ? "WY 서울지점" : (question.hotelCode == "20" ? "WY 부산지점" : "WY 제주지점") }</td>
								<td>${ question.questionCategory == "1" ? "예약변경" : (question.questionCategory == "2" ? "결제문의" : "패키지문의") }</td>
								<td>${ question.questionTitle }</td>
								<td>${ question.questionDate }</td>
								<td>${ question.answerDate }</td>							
		                    </tr>
	                    </c:forEach>
	                    <!-- 리스트 반복문 끝나는 지점 -->                    
	                </tbody>
	            </table>	            
            </form>
            
            <!-- 페이징 지점 -->
            <!-- 
            <nav class="page-wrapper">
			  <ul class="pagination justify-content-center">
			  	<c:if test="${ pc.prev }">
			    	<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/admin/member${ pc.makeURI(pc.beginPage - 1) }">이전</a></li>
			    </c:if>
				<c:forEach var="pageNum" begin="${ pc.beginPage }" end="${ pc.endPage }">
			    	<li class="page-item ${ pc.paging.pageNum == pageNum ? 'active' : '' }"><a class="page-link" href="${ pageContext.request.contextPath }/admin/member${ pc.makeURI(pageNum) }">${ pageNum }</a></li>
			    </c:forEach>
			    <c:if test="${ pc.next }">
			    	<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/admin/member${ pc.makeURI(pc.endPage + 1) }">다음</a></li>
			    </c:if>
			  </ul>
			</nav>
			-->
            
        </div> <!-- end container -->
    </section> <!-- end question body -->
    
    <!-- Modal -->
	<div class="modal fade" id="questionModal" tabindex="-1">
	  <div class="modal-dialog">	
	    <div class="modal-content">
	      <div class="modal-header"> <!-- start modal header -->
	        <h1 class="modal-title fs-5" id="questionModalLabel">문의내역 상세보기</h1>
	      </div> <!-- end modal header -->
	      <div class="modal-body"> <!-- start modal body -->
			<form>
				<input type="hidden" id="questionCode">
				<div class="mb-3">
					<div class="row">
						<div class="col">
							<label for="hotelCode" class="form-label">지점</label>
							<input type="text" class="form-control" id="hotelCode" readonly>
						</div>
						<div class="col">
							<label for="questionCategory" class="form-label">문의유형</label>
							<input type="text" class="form-control" id="questionCategory" readonly>
						</div>
					</div>				
				</div>
				<div class="mb-3">
					<label for="questionTitle" class="form-label">제목</label>
					<input type="text" class="form-control" id="questionTitle" readonly>
				</div>
				<div class="mb-3">
					<label for="questionContent" class="form-label">내용</label>
					<textarea class="form-control" id="questionContent" rows="4" readonly></textarea>
				</div>
				<div class="mb-3">
					<label for="questionAnswer" class="form-label">답변작성</label>
					<textarea class="form-control" id="questionAnswer" rows="4"></textarea>
				</div>
			</form>
	      </div> <!-- end modal-body -->
	      <div class="modal-footer"> <!-- start modal footer -->
			<button id="sendEmailBtn" type="button" class="btn btn-dark">메일보내기</button>
	      </div> <!-- end modal footer -->
	    </div>
	  </div>
	</div>
	<!-- end Modal -->
	
	
    	
    <script>
    
    	// start jQuery
    	$(function() {
    		
    		// 문의내역 리스트 중 하나 클릭시 모달 내용 띄워주기
    		$('#questionList').on('click', '.question-items', function(e) {
				const questionCode = e.target.parentElement.dataset.questionCode;
				$('#hotelCode').val(e.target.parentElement.children[1].textContent);
				$('#questionCategory').val(e.target.parentElement.children[2].textContent);
				$('#questionTitle').val(e.target.parentElement.children[3].textContent);

				$.ajax({
					type: "POST",
					url: "${pageContext.request.contextPath}/admin/getQuestion",
					data: questionCode,
					contentType: 'application/json; charset=utf-8',
					dataType: "json",
					success: function (response) {
						console.log(response);
						$('#questionCode').val(response.questionCode);
						$('#questionContent').val(response.questionContent);
						if(response.questionAnswer !== null) { // 답변을 보냈으면?
							$('#questionAnswer').val(response.questionAnswer);
							$('#questionAnswer').attr('readonly', 'true');
							$('#sendEmailBtn').text('답변완료');
							$('#sendEmailBtn').attr('disabled', 'true');
						} else {
							$('#questionAnswer').val('');
							$('#questionAnswer').removeAttr('readonly');
							$('#sendEmailBtn').text('메일보내기');
							$('#sendEmailBtn').removeAttr('disabled');
						}
						$('#questionModal').modal('show');
					}
				}); // end ajax
			});
    		
			// 답변 내용 이메일로 전송해주기
			$('#sendEmailBtn').click(function(e) {

				if($('#questionAnswer').val().trim() === '') {
					alert('답변 내용이 비어있습니다. 확인해주세요');
					$('#questionAnswer').focus();
					return;
				}

				if(!confirm('문의내역에 대한 답변을 보내시겠습니까?')) {
					return;
				} else {
					const questionCode = $('#questionCode').val();
					const questionAnswer = $('#questionAnswer').val();

					const data = {
						'questionCode': questionCode,
						'questionAnswer': questionAnswer
					};

					$.ajax({
						type: "POST",
						url: "${pageContext.request.contextPath}/admin/replyQuestion",
						data: JSON.stringify(data),
						dataType: "text",
						contentType: 'application/json; charset=utf-8',
						success: function (response) {
							alert('이메일 전송완료! 리스트가 새로고침됩니다.');
							location.reload();
						}
					}); // end ajax
				}				
			});
    		
    	}) // end jQuery
    	
    </script>
    
	<%@ include file="../include/footer.jsp" %>