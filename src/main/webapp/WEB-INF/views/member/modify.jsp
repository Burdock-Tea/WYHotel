<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<%@ include file="../include/header.jsp"%>

<!-- 메인영역 각자 할꺼 여기서 부터 적으세용 -->
<section>
	<div class="container">
		<div class="row">
			<div class="titlebox">내정보 수정</div>
			<div class="row">
				<!-- 목록 -->
				<div class="col-3">
					<ul class="list-group col-12">
						<li class="list-group"><h4>마이페이지</h4></li>
						<hr>
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/member/modify"
							class="text-secondary">내정보 수정</a></li>
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/member/pwModify"
							class="text-secondary">비밀번호 수정</a></li>
						<li class="list-group-item"><a href="${pageContext.request.contextPath}/member/delete"
							class="text-secondary">회원탈퇴</a></li>
					</ul>
				</div>

				<div class="col-lg-1"></div>
				<form id="modifyForm" action="${pageContext.request.contextPath}/member/modify" method="post" class="col-lg-6">
					<div class="form-group">
						<label for="inputEmail" class="form-label mt-4">이메일을 입력하세요</label>
						<div class="input-group mb-3 w-70">
							<input type="text" class="form-control" placeholder="이메일을 입력하세요."
								aria-label="Recipient's username" id="inputEmail"
								aria-describedby="button-addon2" name="email">
							<button class="btn btn-dark" type="button"
								id="mail-check">인증</button>
						</div>
						<div id="mailForm">
							<input type="text" class="form-control"
								id="checkNum" placeholder="인증번호를 입력해 주세요."
								style="display: inline-block; width: 300px;">
							<button type="button" id="mail-check-btn" class="btn btn-dark">확인</button>
						</div>
					</div>
					<span id="mail-check-warn"></span>
					<div class="form-group col-12">
						<label for="inputName" class="form-label mt-4">이름</label> <input
							type="text" class="form-control" id="inputName" name="name"
							value="${member.name}">
					</div>
					<input type="hidden" value="${member.memberCode}" name="memberCode">
					<label class="col-form-label mt-4" for="inputDefault">전화번호</label>
	                <div class="form-group">
	                    <div class="d-inline-flex">
	                        <select class="form-select select" id="tel" name="tel">
	                            <option>010</option>
	                            <option>011</option>
	                            <option>018</option>
	                        </select>
	                      <span style="padding: 5px"><strong> - </strong></span> <input type="text" class="form-control" name="tel2" size="6" placeholder="0000" id="inputDefault">
	                      <span style="padding: 5px"><strong> - </strong></span> <input type="text" class="form-control" name="tel3" size="6" placeholder="0000" id="inputDefault">
	                    </div>
	
	                </div>

					<div class="joinButton col-12">
						<button type="button" class="btn btn-light col-6 clearfix" onclick="location.href='${pageContext.request.contextPath}/'"
							 style="float: left;">취소</button>
						<button type="button" class="btn btn-dark col-6 clearfix" id="modiBtn"
							 style="float: left;">정보 수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>



	<script>
		
		$(function() {
			//정보수정 버튼클릭 이벤트0
			$('#modiBtn').click(function() {
				
				const chk1 = true, chk2 = true, chk3 = true, chk4 = true, chk5 = true;
				
				if($('#inputEmail').val() === '') { //이메일
					alert('이메일 필수 입력 사항입니다.');
					$('#inputEmail').focus();
					chk1 = false;
					return;
				}
				if($('#inputName').val() === '') { //이름
					alert('이름은 필수 입력 사항입니다.');
					$('#inputName').focus();
					chk2 = false;
					return;
				}
				if($('#tel').val() === '') { //전화번호
					alert('전화번호는 필수 입력 사항입니다.');
					tel.focus();
					chk3 = false;
					return;
				}
				if($('#tel2').val() === '') { //전화번호
					alert('전화번호는 필수 입력 사항입니다.');
					$('#tel2').focus();
					chk4 = false;
					return;
				}
				if($('#tel3').val() === '') { //전화번호
					alert('전화번호는 필수 입력 사항입니다.');
					$('#tel3').focus();
					chk5 = false;
					return;
				}
				
				//정보수정 이벤트
				if(chk1 === true && chk2 === true && chk3 === true 
						&& chk4 === true && chk5 === true) {
					if(confirm('정보 수정 하시겠습니까?')) {
						const tel = $('#tel').val() + $('#tel2').val() + $('#tel3').val();
						console.log(tel);
						
						alert('수정 완료! 다시 로그인 하세요');
						$('#modifyForm').submit();
					} else {
						return;
					}
				}
				
			});//정보수정 버튼클릭 이벤트 끝
			
			//이메일 인증 숨김
			$('#mailForm').hide();
			
			//인증번호 이메일 전송
			$('#mail-check').click(function() {
				if($('#inputEmail').val() === '') {
					alert('이메일은 필수사항 입니다.');
					return;
				}
				openLoading();
				const email = $('#inputEmail').val();
				console.log('완성된 이메일: ' + email);
				
				$.ajax({
					type: 'get',
					url: '<c:url value="/member/mailCheck?email=" />' + email, 
					success: function(data) {
						console.log('컨트롤러가 전달한 인증번호: ' + data);
						closeLoading();
						code = data; //인증 번호를 전역변수에 저장.
						alert('인증번호가 전송 되었습니다. 확인 후 입력란에 정확하게 입력하세요!');
						$('#mailForm').show();
					}
				});
			}); //이메일 전송 끝
			
			//인증번호 비교
			$('#mail-check-btn').click(function() {
				const inputCode = $('#checkNum').val(); //사용자가 입력한 인증번호
				const $resultMsg = $('#mail-check-warn'); //span
				
				if(inputCode === code) {
					$('#mailForm').hide();
					$resultMsg.html('인증번호가 일치합니다.');
					$resultMsg.css('color', 'green');
					$('#checkNum').css('display', 'none');
				} else {
					$resultMsg.html('계정이 없거나 인증번호가 틀렸습니다.');
					$resultMsg.css('color', 'red');
					$(this).val('');
					$(this).focus();
				}
				
			}); //인증번호 이벤트 끝
			
			//인증번호 인풋창 엔터키 이벤트
			$('#checkNum').keyup(function(e) {
				if(e.key === 'Enter') {
					$('#mail-check-btn').click();
				}
			});
			
			//로딩창 보여주는 함수
	        function openLoading() {
				//화면의 가로, 세로길이 구해서 저장.
				const maskWidth = window.document.body.cliendWidth; //바닐라
				const maskHeight = $(document).height(); //jQuery
				
				//mask(로딩창이 화면에 드러날 때 주변을 어둡게 지정하기 위한 틀) 요소를 생성하고
				//간단한 디자인을 지정한다.
		         const $mask = '<div id="mask" style="position: fixed; left: 0; top: 0; z-index: 9999; background: #000000; display: none;"></div>';
	         
		         //로딩 이미지 요소 생성 및 속성 지정
		         let $loadingImg = '';
		         $loadingImg += '<div id="loadingImg" style="position: fixed; left:50%; top: 50%; transform: translate(-50%, -50%); width: 100%; z-index: 999999;">';
		         $loadingImg += `<img src="<c:url value='/img/loading.gif' />" style="position: relative; display: block; margin: 0 auto;"  />`;
		         $loadingImg += '</div>';
				
				//위에 준비한 mask와 loading이미지를 배치.
				$('body').append($mask).append($loadingImg);
				
				//mask의 가로, 세로를 지정해주고, 투명도를 조절해 주겠다.
				$('#mask').css({
					'with': maskWidth,
					'height': maskHeight,
					'opacity': '0.5'
				});
				
				//mask와 이미지를 화면에 표시
				$('#mask').show();
				$('#loadingImg').show();
			}
			
	        //로딩창 숨겨주는 함수
	        function closeLoading() {
				$('#maxk, #loadingImg').remove();
			}
			
		}); //end jquery
	
	</script>


