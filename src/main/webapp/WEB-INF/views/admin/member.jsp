<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<%@ include file="../include/header.jsp" %>

	<section>
        <div class="container">
            <h2 class="mt-3">
                회원관리 (관리자 시점)
            </h2>
            <div class="row justify-content-end">                
                <div class="col-5">
                    <div class="input-group mb-3 align-self-end">
                        <select class="form-select" aria-label="Example select with button addon">
                            <option selected>선택</option>
                            <option value="1">이름</option>
                            <option value="2">전화번호</option>
                        </select>
                        <input type="text" class="form-control" placeholder="검색어를 넣어주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
                    </div>
                </div>
            </div>
            <table class="table">
                <thead>
                  <tr class="admin-table">
                    <th>회원코드</th>
                    <th>이메일</th>
                    <th>이름</th>
                    <th>우편번호</th>
                    <th>주소</th>
                    <th>등급</th>
                  </tr>
                </thead>
                <!-- 리스트 반복문 시작 지점 -->
                <tbody>
                    <tr>
                      <td>###########</td>
                      <td>skykuy930201@naver.com</td>
                      <td>권우영</td>
                      <td>02577</td>
                      <td>서울시 동대문구 한빛로 73 용두롯데캐슬리치 102동 1201-가호</td>
                      <td>DIAMOND</td>
                    </tr>
                </tbody>
                <!-- 리스트 반복문 끝나는 지점 -->
            </table>
        </div>
    </section>
    
	<%@ include file="../include/footer.jsp" %>