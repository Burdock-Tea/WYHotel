<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <%@ include file="../include/header.jsp" %>

    <div class="container ">
        <div class="row">
            <div class="titlebox" style="text-align: left;">
               	<span style="font-weight:bold;">비밀번호 확인 </span><br>
                <span style="font-size: 15px">
                	회원님의 개인정보 보호를 위한 확인 절차이오니,<br>
                	회원 로그인 시 사용하시는 비밀번호를 입력해주세요.
                </span>
            </div>
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <div class="mb-3">
                    <input type="text" class="form-control" id="formGroupExampleInput" name="email" value="${email}" readonly>
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" id="pwInput" name="password" placeholder="비밀번호를 입력해 주세요.">
                    <span id="msgId"></span>
                </div>
                <button type="button" class="btn btn-dark col-12" id="pwChkBtn">확인</button>
            </div>
        </div>
    </div>

    <%@ include file="../include/footer.jsp" %>
    
    <script>
    	$(function() {
    		
    		$('#pwChkBtn').click(function() {
    			
    			const password =  $('#pwInput').val();
    			
    			if($('#pwInput').val() === '') {
    				alert('비밀번호를 입력해 주세요.');
    				return;
    			}
    			console.log(password);
    			
    			//statr pwChk ajax
    			 $.ajax({
                 	type: 'post',
                     url: '${pageContext.request.contextPath}/member/pwChk',
                     contentType: 'application/json',
                     data: password,
                     success: function(data) {
 						if(data === 'success') {
 							if(confirm('정보 수정 페이지로 이동 하시겠습니까?')) {
 								location.href='${pageContext.request.contextPath}/member/modify';
 							}
 						} else if(data === 'fail') {
 							$('#msgId').html('비밀번호가 틀렸습니다.');
 							$('#msgId').css('color', 'red');
 						}
                     },
                     error: function() {
                        alert('관리자 문의');
                     }
                 }); //end pwCheck ajax
                 
			}); //end click event
			
			$('#pwInput').keydown(function(e) {
				if(e.key === 'Enter') {
					$('#pwChkBtn').click();	
				} else {
					return;
				}
			});
    		
		}); //end jQuery
    </script>
    
    
    
    
    
    
    
    
    