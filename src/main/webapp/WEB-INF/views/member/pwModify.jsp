<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../include/header.jsp" %>

 <!-- 메인영역 각자 할꺼 여기서 부터 적으세용 -->
 <section>
    <div class="container"> 
      <div class="row">
     <div class="titlebox">
         비밀번호 수정
     </div>
     <div class="row"> 
         <!-- 목록 -->
     <div class="col-3">
         <ul class="list-group col-12">
             <li class="list-group"><h4>마이페이지</h4></li>
             <hr>
             <li class="list-group-item"> <a href="${pageContext.request.contextPath}/member/modify" class="text-secondary">내정보 수정</a></li>
             <li class="list-group-item"> <a href="${pageContext.request.contextPath}/member/pwModify" class="text-secondary">비밀번호 수정</a></li>
             <li class="list-group-item"> <a href="${pageContext.request.contextPath}/member/delete" class="text-secondary">회원탈퇴</a></li>
         </ul>
     </div>
         
         <div class="col-lg-1"></div>
         <form id="loginForm" class="col-lg-6">
             <div class="form-group col-12">
                 <label for="inputPassword" class="form-label mt-4">현재 비밀번호</label>
                 <input type="password" class="form-control" id="inputPassword" placeholder="Password">
               </div>
               <div class="form-group col-12">
                   <label for="inputPassword" class="form-label mt-4">변경 할 비밀번호</label>
                   <input type="password" class="form-control" id="inputPassword" placeholder="New Password">
               </div>
               <div class="form-group col-12">
                   <label for="inputPassword" class="form-label mt-4">비밀번호 확인</label>
                   <input type="password" class="form-control" id="inputPassword" placeholder="New Password Check">
               </div>
         
             <div class="joinButton col-12">
                 <button type="button" class="btn btn-light col-6">취소</button><button type="button" class="btn btn-dark col-6">정보 수정</button>
             </div>
         </form>
         </div>
     </div>
         </div>
      </div>   
 </section>

 <%@ include file="../include/footer.jsp" %>