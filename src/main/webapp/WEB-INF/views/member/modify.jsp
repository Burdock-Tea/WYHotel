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
                        aria-label="Recipient's username" id="inputEmail" value="${member.email}" readonly
                        aria-describedby="button-addon2" name="email">
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
                  <span id="nameMsg"></span>
               </div>

               <label class="col-form-label mt-4" for="inputDefault">전화번호</label>
               <p id="telMsg"></p>
                   <div class="form-group">
                       <div class="d-inline-flex">
                           <select class="form-select select" id="tel" name="tel">
                               <option>010</option>
                               <option>011</option>
                               <option>018</option>
                           </select>
                         <span style="padding: 5px"><strong> - </strong></span> 
                         <input type="text" class="form-control" name="tel2" size="6" maxlength="4" placeholder="0000" id="tel2">
                         <span style="padding: 5px"><strong> - </strong></span> 
                         <input type="text" class="form-control" name="tel3" size="6" maxlength="4" placeholder="0000" id="tel3">
                         <input type="hidden" name="memberCode" value="${member.memberCode}">
                       </div>
                       
                       	<div class="addrForm">
					<div class="form-group">
						<label for="inputPhoneNumber" class="form-label mt-4">주소</label>
						<div class="input-group" id="addrForm">
							<input type="text" name="zipCode" id="zipCode" value="${member.zipCode}"
								class="form-control w-50"  placeholder="우편번호"
								 readonly>
							<div class="input-group-addon">
								<button type="button" id="addrBtn" class="btn btn-primary" onclick="searchAddress()">주소찾기</button>
							</div>
						</div>
					</div>
					<div class="form-group">
						<input type="text" name="addrBasic" id="addrBasic" value="${member.addrBasic}"
							class="form-control" id="addrBasic" placeholder="기본주소">
					</div>
					<div class="form-group">
						<input type="text" name="addrDetail" id="addrDetail" value="${member.addrDetail}"
							class="form-control" id="addrDetail" placeholder="상세주소">
					</div>
				</div>
                   
                   </div>
				<span id="telChk"></span>
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

<!-- 다음 api 주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

   <script>
   		//전화번호 값 넣기
   		const str = '${member.tel}';
   		const arr = str.split('-');
   		$('#tel').val(arr[0]);
   		$('#tel2').val(arr[1]);
   		$('#tel3').val(arr[2]);
   
		// 이름 입력값 검증
	    const getNameCheck = RegExp(/^[가-힣]+$/);
		$('#inputName').keyup(function() {
			//이름값 유효성 검사
			if(getNameCheck.test($(this).val())) {
				$(this).css('borderColor', 'green');
				$('#nameMsg').html('');
			} else {
				$(this).css('borderColor', 'red');
				$('#nameMsg').html('이름은 한글로만 작성하세요.');
				$('#nameMsg').css('color', 'red');
			}
		}); //이름 입력 검증 끝
		
		//전화번호 입력값 검증
		const regTel2 = /^([0-9]{3,4})$/;
		const regTel3 = /^([0-9]{4})$/;
		$('#tel2').keyup(function() {
			if(regTel2.test($(this).val())) {
				$(this).css('borderColor', 'green');
				$('#telChk').html('');
			} else {
				$(this).css('borderColor', 'red');
				$('#telChk').html('3~4글자, 숫자로만 입력하세요.');
				$('#telChk').css('color', 'red');
			}
		});
		$('#tel3').keyup(function() {
			if(regTel3.test($(this).val())) {
				$(this).css('borderColor', 'green');
				$('#telChk').html('');
			} else {
				$(this).css('borderColor', 'red');
				$('#telChk').html('4글자, 숫자로만 입력하세요.');
				$('#telChk').css('color', 'red');
			}
		}); //전화번호 입력값 검증 끝
		
		//전화번호 중복체크
		$('#tel3').blur(function() {
			const tel = $('#tel').val() + '-' + $('#tel2').val() + '-' + $('#tel3').val();
			console.log('완성된 전화번호' + tel);
			
			$.ajax({
				type: 'post',
				url : '${pageContext.request.contextPath}/member/telCheck2',
				data : JSON.stringify({
					'tel' : tel,
					'memberCode': '${member.memberCode}'
				}),
				dataType : 'text',
				contentType : 'application/json',
				success: function(result) {
					console.log(result);
					if(result === 'mytel') {
						$('#telMsg').html('');
					} else if(result === 'telFail') {
						$('#telMsg').html('<span id="tel6" style="font-size: 14px">중복된 전화번호가 있습니다. 다시 확인해 주세요</span>');
						$('#telMsg').css('color', 'red');
					} else {
						$('#telMsg').html('<span id="tel6" style="font-size: 14px">중복된 전화번호가 없습니다.</span>');
						$('#telMsg').css('color', 'green');
					}
				},
				error: function() {
					alert('일시적인 오류 발생. 관리자에게 문의해 주세요.');
				}
			});//비동기통신 끝
		}); //전화번호 중복체크 끝
      
      $(function() {
         //정보수정 버튼클릭 이벤트0
         $('#modiBtn').click(function() {
            
            const chk1 = true, chk2 = true, chk3 = true, chk4 = true, chk5 = true, chk6 = true, chk7 = true;
            
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
            if($('#nameMsg').html() === '이름은 한글로만 작성하세요.') {
				alert('이름을 확인해 주세요.');
				$('#inputName').focus();
				chk6 = false;
				return;
			}
            if($('#tel6').html() === '중복된 전화번호가 있습니다. 다시 확인해 주세요') {
            	alert('전화번호 중복! 다시 확인해 주세요.');
            	$('#tel2').focus();
            	chk7 = false;
            	return;
            }
            if($('#telChk').html() === '4글자, 숫자로만 입력하세요.') {
            	alert('전화번호를 확인해 주세요.');
            	$('#tel3').focus();
            	return;
            }
            if($('#telChk').html() === '3~4글자, 숫자로만 입력하세요.') {
            	alert('전화번호를 확인해 주세요.');
            	$('#tel2').focus();
            	return;
            }
            
            //정보수정 이벤트
            if(chk1 === true && chk2 === true && chk3 === true 
                  && chk4 === true && chk5 === true && chk6 === true && chk7 === true) {
               if(confirm('정보 수정 하시겠습니까?')) {
                  
                  alert('수정 완료! 다시 로그인 해주세요.');
                  $('#modifyForm').submit();
               } else {
                  return;
               }
            }
            
         });//정보수정 버튼클릭 이벤트 끝
         
         //이메일 인증 숨김
         $('#mailForm').hide();
       
      }); //end jquery
      
    //다음 주소 API 사용해 보기
      function searchAddress() {
               new daum.Postcode({
                   oncomplete: function(data) {
                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분..
                       var extraAddr = ''; // 참고항목 변수
                       
           	        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if(extraAddr !== ''){
                           extraAddr = ' (' + extraAddr + ')';
                       }

   					// 사용자가 선택한 값 해당 요소에 입력해주기.
                       $('#addrBasic').val(data.roadAddress);
   					$('#zipCode').val(data.zonecode);
   					$('#addrDetail').focus();
       				
                   }
               }).open();
           }
   
   </script>

