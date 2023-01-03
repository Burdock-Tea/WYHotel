<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<!-- 메인영역 각자 할꺼 여기서 부터 적으세용 -->
<div class="container">
    <div class="row">
        <div id="titlebox1" class="titlebox1">
            SIGN IN
        </div>
        <span class="titlebox2">당신이 머무는 이 모든 순간이 특별해 집니다.</span>
        <div class="loginDiv">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item col-lg-6 col-md-6 col-sm-6 col-6 check-login" role="presentation">
                    <button class="nav-link active col-lg-12 col-md-12 col-sm-12 col-12 check-btn" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">회원 로그인</button>
                </li>
                <li class="nav-item col-lg-6 col-md-6 col-sm-6 col-6 check-login" role="presentation">
                    <button class="nav-link col-lg-12 col-md-12 col-sm-12 col-12 check-btn" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">비회원 예약</button>
                </li>
            </ul>
        </div>
        <div class="col-lg-4"></div>
          <div class="tab-content col-lg-4 login-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                <!-- 회원 로그인 -->
                <div>
                    <form id=" login-form">
                        <div class="mb-3">
                            <input type="text" class="form-control" id="formGroupExampleInput" placeholder="이메일">
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" id="formGroupExampleInput2" placeholder="비밀번호">
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                            <label class="form-check-label" for="flexCheckDefault">
                              아이디 저장
                            </label>
                          </div>  &nbsp;&nbsp;
                        <div class="form-check auto-login clearfix">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                            <label class="form-check-label" for="flexCheckChecked">
                                자동 로그인
                            </label> 
                        </div>
                        <a href="#" class="id-pw-search">아이디/비밀번호 찾기 ▶</a>
                            <div class="d-grid gap-2 login-btn">
                                <button type="button" class="btn btn-dark userLogin-btn"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">로그인</font></font></button>
                                <button type="button" class="btn btn-secondary userLogin-btn"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원가입</font></font></button>
                        </div>
                    </form>
                </div>
                <!--회원 로그인 끝-->
            </div>
            <div class="col-lg-4"></div>
            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                <!-- 비회원 로그인 -->
                <div>
                    <form id=" login-form">
                        <div class="mb-3">
                            <input type="text" class="form-control" id="formGroupExampleInput" placeholder="예약번호">
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" id="formGroupExampleInput2" placeholder="이메일">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                            <label class="form-check-label" for="inlineRadio1">객실</label>
                          </div>
                          <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                            <label class="form-check-label" for="inlineRadio2">다이닝</label>
                          </div>
                            <div class="d-grid gap-2 login-btn">
                                <button type="button" class="btn btn-dark userLogin-btn"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">예약확인</font></font></button>
                        </div>
                    </form>
                </div>
                <!--비회원 로그인 끝-->
            </div>
          </div>
        
    </div>
</div>

<%@ include file="../include/footer.jsp" %>