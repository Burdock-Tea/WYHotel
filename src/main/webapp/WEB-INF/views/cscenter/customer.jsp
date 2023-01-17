<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

	<style>
	    /* font setting */
	    *{ font-family: 'Noto Sans KR', sans-serif; font-weight: 300;}
	    
	    /* list font hover*/
	    .posi{ padding: 80px 0;}
	    .text-secondary:hover { font-weight: 400;}
	    
	    /*캡차 사이즈*/
	    #answer{ width: 200px;}
    </style>
	
    <div class="container posi">
        <!-- Content here -->
        <div class="row">
            <!-- 목록 -->
            <div class="col-3">
                <ul class="list-group">
                    <li class="list-group"><h4>고객센터</h4></li>
                    <hr>
                    <li class="list-group-item"> <a href="${pageContext.request.contextPath}/cscenter/faq" class="text-secondary">FAQ</a></li>
                    <li class="list-group-item"> <a href="${pageContext.request.contextPath}/cscenter/customer" class="text-secondary">문의 하기</a></li>
                </ul>
            </div>

            <div class="col-1"></div>
             
            <div class="col-5">
             	
                <form action="${pageContext.request.contextPath}/cscenter/mailSend" method="post" id="emailForm">
                    <div class="form-group">
                        <label for="exampleSelect1" class="form-label mt-4">호텔 선택</label>
                        <select class="form-select" id="exampleSelect1" name="branch">
                            <option>WY 서울지점</option>
                            <option>WY 부산지점</option>
                            <option>WY 제주지점</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="exampleSelect1" class="form-label mt-4">질문 유형</label>
                        <select class="form-select" id="exampleSelect1" name="qnaType">
                            <option>예약변경</option>
                            <option>결제문의</option>
                            <option>패키지문의</option>
                        </select>
                    </div>
                    
                    <!-- 이메일 로그인시 비활성화 하면 될덧 -->
                    <div class="form-group">
                        <label for="exampleInputEmail1" class="form-label mt-4">이메일</label>
                        <input type="email" name="email" class="form-control"  id="email" aria-describedby="emailHelp" placeholder="Enter email">
                    </div>
                    
                    <!-- 전화번호 -->
                    <label class="col-form-label mt-4" for="inputDefault">전화번호</label>
                    <div class="form-group">
                        <div class="d-inline-flex">
                            <select class="form-select" name="phone1">
                                <option>010</option>
                                <option>011</option>
                                <option>018</option>
                            </select>
                            <span class="mt-2 px-2"> - </span>
                            <input type="tel" class="form-control" name="phone2" maxlength="4" placeholder="0000" id="phone2" > 
                            <span class="mt-2 px-2"> - </span>
                            <input type="tel" class="form-control" name="phone3" maxlength="4" placeholder="0000" id="phone3"> 
                        </div>
                	</div> 
                	
                <div class="form-group">
                    <label class="col-form-label mt-4" for="inputDefault">제목</label>
                    <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해주세요" >
                </div>
                
                <div class="form-group mb-4">
                    <label for="exampleTextarea" class="form-label mt-4">내용 </label>
                    <textarea class="form-control" name="content" id="content" rows="3" placeholder="내용을 입력해주세요"></textarea>
                </div>
                
		           <!-- 자동입력방지 시작 -->         
					<div class="form-group" id="captchaForm">
						<div class="col-6 d-inline-flex">
							<img id="captchaImg" src="${pageContext.request.contextPath}/cscenter/captchaImg" alt="캡차이미지" />
							<div id="ccaudio" class="btn"></div>						
							<div class="col-6 d-inline-flex">
								<input id="answer" type="text" class="form-control" > 
								<input id="check" type="button" class="btn btn-dark ms-2" value="확인" />
							</div>   
							</div>
							<div class="form-group">
								<input id="reload" type="button" 
									onclick="javaScript:getImage()" value="새로고침" /> 
								<input id="soundOn" type="button" 
									onclick="javaScript:audio()" value="음성듣기" />
							</div>
						</div>
						
	           			<!-- 자동입력방지 끝 -->         
	                
	                <div class="row">
	                    <div class="col-5"></div>
	                    <div class="col-4">
	                        <button type="submit" id="formSubmit" class="btn btn-dark">문의하기</button>
	                    </div>
	                </div>
	            </form>
	                
	            </div>
	           
	        </div> <!-- aco row end-->        
	    </div>
	
   
	
	<script type="text/javascript">
	
		window.onload = function(){
			getImage();	// 이미지 가져오기
			
			document.querySelector('#check').addEventListener('click', function(){
				
				var params = {answer : document.getElementById('answer').value};
				var answer = document.getElementById('answer').value;
				
				$.ajax({
					type: 'post',
					url: '${pageContext.request.contextPath}/cscenter/chkAnswer',
					contentType: 'application/json',
					data: answer,
					success: function(data) {
						if(data == 1){
							alert('입력값이 일치합니다.');
							$('#captchaForm').hide();
						}else{
							alert('입력값이 일치하지 않습니다.');
							getImage();
							document.querySelector('#answer').setAttribute('value', '');
						}
					},
					error: function() {
						alert('서버 에러입니다. 관리자에게 문의하세요.');
					}
					
				});
				
			});//addEventListener
			
		}
		
		/*매번 랜덤값을 파라미터로 전달하는 이유 : IE의 경우 매번 다른 임의 값을 전달하지 않으면 '새로고침' 클릭해도 정상 호출되지 않아 이미지가 변경되지 않는 문제가 발생된다*/
		function audio(){
			var rand = Math.random();
			var uAgent = navigator.userAgent;
			var soundUrl = '${pageContext.request.contextPath}/cscenter/captchaAudio?rand='+rand;
			if(uAgent.indexOf('Trident')>-1 || uAgent.indexOf('MISE')>-1){	/*IE 경우 */
				audioPlayer(soundUrl);
			}else if(document.createElement('audio').canPlayType){ /*Chrome 경우 */
				
				try {
					new Audio(soundUrl).play();
				} catch (e) {
					audioPlayer(soundUrl);
				}
				
			}else{
				window.open(soundUrl,'','width=1,height=1');
			}
		}
			
		function getImage(){
			var rand = Math.random();
			var url = '${pageContext.request.contextPath}/cscenter/captchaImg?rand='+rand;
			document.querySelector('#captchaImg').setAttribute('src', url);
		}
		
		function audioPlayer(objUrl){
			document.querySelector('#ccaudio').innerHTML = '<bgsoun src="' +objUrl +'">';
		}
			
		
		/* 유효성 검사 */
		$('#formSubmit').click(function () {
			
			if($('#email').val() === '') {
				alert('이메일은 필수값 입니다');
				return;
			}
			if($('#phone2').val() === '' && $('#phone3').val() === '') {
				alert('핸드폰 번호를 입력해 주세요');
				return;
			}
			if($('#title').val() === '') {
				alert('제목을 입력해 주세요');
				return;
			}
			if($('#content').val() === '') {
				alert('내용을 입력해 주세요');
				return;
			}
			if($('#answer').val() === '') {
				alert('자동 입력 방지를 입력해 주세요');
				return;
			}
			
			if(confirm('관리자에게 이메일을 전송합니다')) {
				$('#emailForm').submit();
				alert('발송 성공!');
			} else {
				return;
			}
			
		});
		

		/* 이메일 전송시 로딩처리*/
        function openLoading() {
			// 화면의 가로 길이, 세로 길이를 구해서 저장
			const maskWidth = window.document.body.clientWidth;
			const maskHeight = $(document).height();
			
			// mask(로딩창이 화면에 드러날 때 주변을 어둡게 지정하기 위한 틀)
			// 간단한 디자인을 지정합니다
	        const $mask = '<div id="mask" style="position: fixed; left: 0; top: 0; z-index: 9999; background: #000000; display: none;"></div>';
			
			// 로딩 이미지 요소 생성 및 속성 지정
			let $loadingImg = '';
			$loadingImg += '<div id="loadingImg" style="position: fixed; left:50%; top: 50%; transform: translate(-50%, -50%); width: 100%; z-index: 999999;">';
			$loadingImg += `<img src="<c:url value='/img/loading.gif' />" style="positon: relative; display: block; margin: 0 auto;" />`;
			$loadingImg += '</div>';
			
			// 위에 준비한 mask와 loading 이미지를 배치 
			$('body').append($mask).append($loadingImg);
			
			// mask의 가로, 세로를 지정해주고, 투명도를 조절해 주겠습니다
			$('#mask').css({
				'width' : maskWidth,
				'heigth' : maskHeight,
				'opacity' : '0.6'
			});
			
			// mask와 이미지를 화면에 표시
			$('#mask').show();
			$('#loadingImg').show();
			
		}
		
	</script>

	<%@ include file="../include/footer.jsp" %>