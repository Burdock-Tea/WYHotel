<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../include/header.jsp" %>

    <section>
        <div class="container"> 
          <div class="row">
         <div class="titlebox">
             내정보 수정
         </div>
         <div class="row"> 
             <!-- 목록 -->
             <div class="col-3">
                 <ul class="list-group col-12">
                     <li class="list-group"><h4>마이페이지</h4></li>
                     <hr>
                     <li class="list-group-item"> <a href="./member_modify.html" class="text-secondary">내정보 수정</a></li>
                     <li class="list-group-item"> <a href="./member_Pwmodify.html" class="text-secondary">비밀번호 수정</a></li>
                     <li class="list-group-item"> <a href="./member_delete.html" class="text-secondary">회원탈퇴</a></li>
                 </ul>
             </div>
             
             <div class="col-lg-1"></div>
             <form id="loginForm" class="col-lg-6">
                   <div class="form-group">
                     <label for="inputEmail" class="form-label mt-4">이메일을 입력하세요</label>
                     <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" placeholder="example@gmail.com">
                 </div>
                 <div class="form-group col-12">
                     <label for="inputName" class="form-label mt-4">이름</label>
                     <input type="text" class="form-control" id="inputName" placeholder="이름을 입력해주세요.">
                 </div>
                 <div class="form-group col-12">
                     <label for="inputPhoneNumber" class="form-label mt-4">전화번호</label>
                     <input type="text" class="form-control" id="inputPhoneNumber" placeholder="example 010-0000-0000">
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