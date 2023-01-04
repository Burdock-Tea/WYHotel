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
                                <h4>아이디 찾기</h4>
                            </li>
                            <hr>
                            <li class="list-group-item"> <a href="${pageContext.request.contextPath}/member/searchId" class="text-secondary">아이디
                                    찾기</a></li>
                            <li class="list-group-item"> <a href="${pageContext.request.contextPath}/member/searchPw" class="text-secondary">비밀번호
                                    찾기</a></li>
                        </ul>
                    </div>

                    
                    <form id="searchIdForm" action="${pageContext.request.contextPath}/member/searchId" method="post" class="col-lg-6 my-0 mx-auto">
                        <div class="form-group col-8">
                            <label for="inputName" class="form-label mt-4">이름</label>
                            <input type="text" class="form-control col-lg-6" name="name" id="inputName" placeholder="이름을 입력해주세요.">

                        </div>
                        
                        <label class="col-form-label mt-4" for="inputDefault">전화번호</label>
						<div class="form-group">
							<div class="d-inline-flex">
								<select class="form-select select" name="tel" style="width: 125px;">
									<option>010</option>
									<option>011</option>
									<option>018</option>
								</select> <span style="padding: 5px"><strong> - </strong></span> 
								<input type="text" class="form-control" size="6" placeholder="0000"
									id="inputTel" name="tel2"> 
									<span style="padding: 5px"><strong>- </strong></span>
									<input type="text" class="form-control" size="6" placeholder="0000" 
									id="inputDefault" name="tel3">
							</div>
	
						</div>
						
                        <div class="joinButton col-12">
                            <button type="button" class="btn btn-light col-6 clearfix" onclick="${pageContext.request.contextPath}/"
                                style="float: left;">취소</button>
                                <button type="button" class="btn btn-dark col-6 clearfix" id="searchIdBtn" style="float: left;">아이디 찾기</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    
    	<div class="modal"  id="emailModal">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">이메일 확인</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <p id="modalMsg">당신의 이메일은 ${email} 입니다.</p>
		      </div>
		      <div class="modal-footer my-0 mx-auto">
		      	<button type="button" class="btn btn-secondary loginBtn" data-bs-dismiss="modal" onclick="location.href='${pageContext.request.contextPath}/member/login'">로그인 하러 가기</button>
		        <button type="button" class="btn btn-dark searchPwBtn" data-bs-dismiss="modal" onclick="location.href='${pageContext.request.contextPath}/member/searchPw'">비밀번호 찾기</button>
		      </div>
		    </div>
		  </div>
		</div>
    
    
    
    <%@ include file="../include/footer.jsp" %>
    
    
    
    <script>
    
    	$(function() {
			
    		//아이디 찾기 이벤트 처리
    		$('#searchIdBtn').click(function() {
    			
				if($('#inputName').val() === '') {
					alert('이름을 입력해 주세요.');
					$('#inputName').focus();
					return;
				}
				if($('#inputTel').val() === '') {
					alert('전화번호를 입력해 주세요.');
					$('#inputTel').focus();
					return;
				}
				
				$('#searchIdForm').submit()
				
				
			}); //아이디 찾기 이벤트 처리 끝
			
			if('${msg}' === 'success') {
				$('#emailModal').modal('show');
			} else if('${msg}' === 'fail'){
				$('#modalMsg').html('<span style="color: red; font-size: 18px;">-오류-</span><br>이름, 전화번호를 다시 확인해 주세요.');
				$('.loginBtn').html('확인');
				$('.loginBtn').attr('onclick', '');
				$('.searchPwBtn').hide();
				$('#emailModal').modal('show');
			} else {
				return;
			}
			
		});
    
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    