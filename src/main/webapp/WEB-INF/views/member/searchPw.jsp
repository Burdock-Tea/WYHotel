<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

<!-- 메인영역 각자 할꺼 여기서 부터 적으세용 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="titlebox">
                    아이디/비밀번호 찾기
                </div>
                <div class="row">
                    <!-- 목록 -->
                    <div class="col-3">
                        <ul class="list-group col-12">
                            <li class="list-group">
                                <h4>비밀번호 찾기</h4>
                            </li>
                            <hr>
                            <li class="list-group-item"> <a href="${pageContext.request.contextPath}/member/searchId" class="text-secondary">아이디
                                    찾기</a></li>
                            <li class="list-group-item"> <a href="${pageContext.request.contextPath}/member/searchPw" class="text-secondary">비밀번호
                                    찾기</a></li>
                        </ul>
                    </div>

                    
                    <form id="searchPwForm" action="${pageContext.request.contextPath}/member/searchPw" method="post" class="col-lg-6 my-0 mx-auto">
                        <div class="form-group col-12">
                            <div class="form-group">
                                <label for="inputEmail" class="form-label mt-4">이메일</label>
                                <div class="input-group mb-3" style="width: 380px;">
                                    <input type="text" class="form-control" placeholder="등록된 이메일을 입력하세요."
                                        aria-label="Recipient's username" id="inputEmail"
                                        aria-describedby="button-addon2" name="email">
                                    <button class="btn btn-dark" type="button"
                                        id="mail-check">인증</button>
                                </div>
                                 <span id="mailMsg"></span>
                                <div id="mailForm">
	                                <div class="input-group mb-3" style="width: 380px;">
	                                    <input type="text" id="checkNum" class="form-control" placeholder="인증번호를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
	                                    <button class="btn btn-dark" type="button" id="mail-check-btn">확인</button>
	                                </div>
                                </div>
                                <span id="mail-check-warn"></span>
                                <div id="pwChk">
	                                <div class="form-group col-8" style="margin-top: 10px; width: 380px;">
			                            <label for="inputPassword" class="form-label mt-4">변경 할 비밀번호</label> 
			                            <input type="password" class="form-control" id="newPw" placeholder="New Password" name="newPw">
			                            <span id="pwMsg"></span>
			                        </div>
			                        <div class="form-group col-8" style="width: 380px;">
			                            <label for="inputPassword" class="form-label mt-4">비밀번호 확인</label>
			                            <input type="password" class="form-control" id="newPwChk"
			                                placeholder="New Password Check">
			                        <span id="msgId"></span>
			                        </div>
		                        </div>
                            </div>
                        </div>

                        <div class="joinButton col-12">
                            <button type="button" class="btn btn-secondary col-6 clearfix" style="float: left;" onclick="${pageContext.request.contextPath}/">취소</button>
                            <button type="button" id="searchPw" class="btn btn-dark col-6 clearfix" style="float: left;">비밀번호 수정</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <%@ include file="../include/footer.jsp" %>
    
    
    
    <script>
    	
    	$(function() {
    		
    		//이메일 양식 유효성 검사.
    		var id = document.getElementById("inputEmail");
    		id.onkeyup = function() {
    			/*자바스크립트의 정규표현식 입니다*/
    			/*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
    			var regex =/[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
    			if (regex.test(document.getElementById("inputEmail").value)) {
    				document.getElementById("inputEmail").style.borderColor = "black";
    				$('#mailMsg').html('');
    				$('#mail-check').attr('disabled', false);
    			} else {
    				document.getElementById("inputEmail").style.borderColor = "red";
    				$('#mailMsg').html('이메일 양식을 확인해 주세요.');
    				$('#mailMsg').css('color', 'red');
    				$('#mail-check').attr('disabled', true);
    			}
    		}//이메일 양식 유효성 검사 끝
    		
    		//비밀번호 양식 유효성 검사
    		var pw = document.getElementById('newPw');
    		pw.onkeyup = function() {
    			var regex = /^[A-Za-z0-9+]{8,16}$/;
    			if(regex.test(document.getElementById('newPw').value)) {
    				document.getElementById('newPw').style.borderColor = "black";
    				$('#pwMsg').html('');
    			} else {
    				document.getElementById('newPw').style.borderColor = "red";
    				$('#pwMsg').html('비밀번호는 영어나 숫자가 8~16자 이어야 합니다.');
    				$('#pwMsg').css('color', 'red');
    			}

    		}// 비밀번호 양식 유효성검사 끝
    		
    		//비밀번호 클릭 이벤트 시작
    		$('#searchPw').click(function() {
				
    			if($('#newPw').val() === '') {
    				alert('비밀번호를 입력해 주세요.');
    				$('#newPw').focus();
    				return;
    			}
    			if($('#newPwChk').val() === '') {
    				alert('비밀번호 확인란을 입력해 주세요.');
    				$('#newPwChk').focus();
    				return;
    			}
    			if($('#pwMsg').html() === '비밀번호는 영어나 숫자가 8~16자 이어야 합니다.') {
    				alert('비밀번호를 확인해 주세요.');
    				$('#newPw').focus();
    				return;
    			}
    			if(!$('#mail-check').attr('disabled')) {
    				alert('이메일 양식을 확인해 주세요.');
    				$('#email').focus();
    				return;
    			}
    			if($('#newPw').val() === $('#newPwChk').val()) {
    				$('#searchPwForm').submit();
    				alert('비밀번호 변경 완료. 로그인 해주세요.');
    			} else {
    				alert('비밀번호 확인란을 확인해 주세요.');
    				$('#newPwChk').val('');
    				$('#newPwChk').focus();
    				return;
    			}
			});//비밀번호  클릭 이벤트 끝
			
			//비밀번호 키보드 처리
			$('#newPwChk').keyup(function() {
				if($('#newPw').val() === $('#newPwChk').val()) {
    				$('#msgId').html('비밀번호가 일치합니다.');
    				$('#msgId').css('color', 'green');
    			} else {
    				$('#msgId').html('비밀번호가 일치하지 않습니다..');
    				$('#msgId').css('color', 'red');
    			}
			}); //키보드 처리 끝
			
    		//이메일 인증 숨김
			$('#mailForm').hide();
    		//비밀번호 창 숨김
    		$('#pwChk').hide();
			
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
					type: 'post',
					url: '<c:url value="/member/mailCheck" />', 
					contentType : 'application/json',
					data : email,
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
					$('#mailForm').hide();
					$('#inputEmail').attr('readonly', true);
					$('#mail-check').attr('disabled', true);
					$('#pwChk').show();
				} else {
					$resultMsg.html('계정이 없거나 인증번호가 틀렸습니다.');
					$resultMsg.css('color', 'red');
					$('#checkNum').val('');
					$('#checkNum').focus();
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
    		
		}); //end jQuery
    
    </script>
    
    
    
    
    
    
    
    
    