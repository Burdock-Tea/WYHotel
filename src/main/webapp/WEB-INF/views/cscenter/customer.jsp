<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 자동완성용 ajax 임포트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>Insert title here</title>
	<style>
	    /* font setting */
	    *{ font-family: 'Noto Sans KR', sans-serif; font-weight: 300;}
	    
	    /* list font hover*/
	    .posi{ padding: 80px 0;}
	    .text-secondary:hover { font-weight: 400;}
	    
	    /**/
	    #answer{ width: 200px;}
    </style>   
</head>
<body>
	<%@ include file="../include/header.jsp" %>	
	<!-- nav-->

    <!-- 메인영역 각자 할꺼 여기서 부터 적으세용 -->
    <div class="container posi">
        <!-- Content here -->
        <div class="row">
            <!-- 목록 -->
            <div class="col-3">
                <ul class="list-group">
                    <li class="list-group"><h4>고객센터</h4></li>
                    <hr>
                    <li class="list-group-item"> <a href="${pageContext.request.contextPath}/cscenter/customer" class="text-secondary">문의 하기</a></li>
                    <li class="list-group-item"> <a href="${pageContext.request.contextPath}/cscenter/faq" class="text-secondary">FAQ</a></li>
                </ul>
            </div>

            <div class="col-1"></div>
             
            <div class="col-5">
             	
             	<!--  -->
                <form action="${pageContext.request.contextPath}/cscenter/mailSend" method="post">
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
                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                        <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                    </div>
                    
                    <!-- https://juein.tistory.com/43 << 이런 방식도 있던데 이건 어때요? -->
                    <label class="col-form-label mt-4" for="inputDefault">전화번호</label>
                    <div class="form-group">
                        <div class="d-inline-flex">
                            <select class="form-select" name="phone1">
                                <option>010</option>
                                <option>011</option>
                                <option>018</option>
                            </select>
                            <span class="mt-2 px-2"> - </span>
                            <input type="tel" class="form-control" name="phone2" maxlength="4" placeholder="0000" id="inputDefault"> 
                            <span class="mt-2 px-2"> - </span>
                            <input type="tel" class="form-control" name="phone3" maxlength="4" placeholder="0000" id="inputDefault"> 
                        </div>

                	</div>  <!-- 전화번호 끝 -->
                	
                <div class="form-group">
                    <label class="col-form-label mt-4" for="inputDefault">제목</label>
                    <input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요" id="inputDefault">
                </div>
                
                <div class="form-group mb-4">
                    <label for="exampleTextarea" class="form-label mt-4">내용 </label>
                    <textarea class="form-control" name="content" id="exampleTextarea" rows="3" placeholder="내용을 입력해주세요"></textarea>
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
                        <button type="submit" class="btn btn-dark">문의하기</button>
                    </div>
                </div>
            </form>
                
            </div>
           
        </div> <!-- aco row end-->

        
    </div>

     <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
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
		
		
		/* 확인 버튼 눌렀을 경우 */
		function checkBtn() {
			
		}
		
	</script>

</body>
	<%@ include file="../include/footer.jsp" %>
</html>


