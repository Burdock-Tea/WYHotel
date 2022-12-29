<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<div class="container posi">
        <!-- Content here -->
        <div class="row">
            <!-- 목록 -->
            <div class="col-3">
                <ul class="list-group">
                    <li class="list-group"><h4>고객센터</h4></li>
                    <hr>
                    <li class="list-group-item"> <a href="./cscenter_customer.html" class="text-secondary">문의 하기</a></li>
                    <li class="list-group-item"> <a href="./cscenter_faq.html" class="text-secondary">FAQ</a></li>
                </ul>
            </div>

            <div class="col-1"></div>
            
            <div class="col-5"> 
                <form action="">

                    <div class="form-group">
                        <label for="exampleSelect1" class="form-label mt-4">호텔 선택</label>
                        <select class="form-select" id="exampleSelect1">
                            <option>WY 서울지점</option>
                            <option>WY 부산지점</option>
                            <option>WY 제주지점</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="exampleSelect1" class="form-label mt-4">질문 유형</label>
                        <select class="form-select" id="exampleSelect1">
                            <option>예약변경</option>
                            <option>결제취소</option>
                            <option>어쩔추가</option>
                        </select>
                    </div>
                    
                    <!-- 이메일 로그인시 비활성화 하면 될덧 -->
                    <div class="form-group">
                        <label for="exampleInputEmail1" class="form-label mt-4">이메일</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    
                    <!-- https://juein.tistory.com/43 << 이런 방식도 있던데 이건 어때요? -->
                    <label class="col-form-label mt-4" for="inputDefault">전화번호</label>
                    <div class="form-group">
                        <div class="d-inline-flex">
                            <select class="form-select">
                                <option>010</option>
                                <option>011</option>
                                <option>018</option>
                            </select>
                            <span class="mt-2 px-2"> - </span>
                            <input type="tel" class="form-control" size="6" placeholder="0000" id="inputDefault"> <span class="mt-2 px-2"> - </span>
                            <input type="tel" class="form-control" size="6" placeholder="0000" id="inputDefault"> 
                        </div>

                </div>  <!-- 전화번호 끝 -->
                <div class="form-group">
                    <label class="col-form-label mt-4" for="inputDefault">제목</label>
                    <input type="text" class="form-control" placeholder="제목을 입력해주세요" id="inputDefault">
                </div>
                <p> 
                    <div class="form-group">
                        <label for="exampleTextarea" class="form-label mt-4">내용 </label>
                        <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="내용을 입력해주세요"></textarea>
                    </div>
                </p>
                
                <p> 
                    자동입력방지 
                </p>
                
                <div class="row">
                    <div class="col-5"></div>
                    <div class="col-4">
                        <button type="button" class="btn btn-dark">문의하기</button>
                    </div>
                    
                </div>
            </form>
                
            </div>
            
            
            
        </div> <!-- aco row end-->

        
    </div>
    
<%@ include file="../include/footer.jsp" %>