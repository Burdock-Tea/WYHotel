<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<!-- 메인영역 각자 할꺼 여기서 부터 적으세용 -->
<section>
	<div class="container">
		<div class="row">
			<div class="titlebox">비밀번호 수정</div>
			<div class="row">
				<!-- 목록 -->
				<div class="col-3">
					<ul class="list-group col-12">
						<li class="list-group"><h4>마이페이지</h4></li>
						<hr>
						<li class="list-group-item"><a
							href="${pageContext.request.contextPath}/member/modify"
							class="text-secondary">내정보 수정</a></li>
						<li class="list-group-item"><a
							href="${pageContext.request.contextPath}/member/pwModify"
							class="text-secondary">비밀번호 수정</a></li>
						<li class="list-group-item"><a
							href="${pageContext.request.contextPath}/member/delete"
							class="text-secondary">회원탈퇴</a></li>
					</ul>
				</div>

				<div class="col-lg-1"></div>
				<form id="pwForm" action="${pageContext.request.contextPath}/member/pwModify" method="post" class="col-lg-6">
					<div class="form-group col-12">
						<label for="inputPassword" class="form-label mt-4">변경 할
							비밀번호</label> <input type="password" class="form-control"
							id="newPw" placeholder="New Password" name="newPw">
					</div>
					<div class="form-group col-12">
						<label for="inputPassword" class="form-label mt-4">비밀번호 확인</label>
						<input type="password" class="form-control" id="newPwChk"
							placeholder="New Password Check">
					<input type="hidden" value="${member.memberCode}" name="memberCode">
					<span id="msgId"></span>
					</div>

					<div class="joinButton col-12">
						<button type="button" class="btn btn-light col-6" onclick="location.href='${pageContext.request.contextPath}/'"
							style="float: left">취소</button>
						<button type="button" class="btn btn-dark col-6" 
							style="float: left" id="pwBtn">정보 수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>


	<script>
		
		$(function() {
			
			//비밀번호 수정버튼 클릭 이벤트
			$('#pwBtn').click(function() {
				
				if($('#newPw').val() === '') {
					alert('비밀번호 입력해주세요.');
					$('#newPw').focus();
					return;
				}
				if($('#newPwChk').val() === '') {
					alert('비밀번호 확인란을 확인 해주세요.');
					$('#newPwChk').focus();
					return;
				}
				if($('#newPw').val() === $('#newPwChk').val()) {
					if(confirm('정보 수정 하시겠습니까?')) {
						alert('정보수정 완료. 다시 로그인 해주세요');
						$('#pwForm').submit();
					} else {
						return;
					}
				} else {
					alert('비밀번호가 일치하지 않습니다.');
					$('#newPwChk').focus();
					$('#newPwChk').val('');
				}
				
			}); //비밀번호 수정 이벤트 끝
			
			//비밀번호 인풋 키업 이벤트
			$('#newPwChk').keyup(function() {
				if($('#newPwChk').val() === $('#newPw').val()) {
					$('#msgId').html('비밀번호가 일치합니다.');
					$('#msgId').css('color', 'green');
				} else {
					$('#msgId').html('비밀번호가 틀립니다.');
					$('#msgId').css('color', 'red');
				}
			});
			
		});
	
	</script>

