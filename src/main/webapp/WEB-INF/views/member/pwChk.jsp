<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../include/header.jsp" %>

    <div class="container ">
        <div class="row">
            <div class="titlebox">
                비밀번호 확인 <br>
                <span>회원님의 개인정보 보호를 위한 확인 절차이오니,<br>회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</span>
            </div>
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <div class="mb-3">
                    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="아이디" readonly>
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="비밀번호를 입력해 주세요.">
                </div>
                <button type="button" class="btn btn-dark col-12">확인</button>
            </div>
        </div>
    </div>

    <%@ include file="../include/footer.jsp" %>