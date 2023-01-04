<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
                        <select class="form-select" aria-label="addon" id="category" name="category">
                            <option value="none" selected>선택</option>
                            <option value="name">이름</option>
                            <option value="tel">전화번호</option>
                        </select>
                        <input type="text" class="form-control" placeholder="검색어를 넣어주세요" name="search">
                        <button class="btn btn-outline-secondary" type="button" id="search">검색</button>
                    </div>
                </div>
            </div>
            <form id="adminMemberForm" method="post">
	            <table class="table" style="background: #FFCD48">
	                <thead>
	                  <tr class="admin-table">
	                    <th>회원코드</th>
	                    <th>이메일</th>
	                    <th>이름</th>
	                    <th>전화번호</th>
	                    <th>우편번호</th>
	                    <th>주소</th>
	                    <th>등급</th>
	                    <th></th>
	                    <th></th>
	                  </tr>
	                </thead>
	                <!-- 리스트 반복문 시작 지점 -->	                
	                <tbody>                	
	                	<c:forEach items="${ list }" var="member">
		                    <tr>
		                      <td ${ member.admin ? "style='color: red;'" : "" }>${ member.memberCode }</td>
		                      <td>${ member.email }</td>
		                      <td>${ member.name }</td>
		                      <td>${ member.tel }</td>
		                      <td>${ member.zipCode }</td>
		                      <td>${ member.addrBasic }&nbsp;${ member.addrDetail }</td>
		                      <td>${ member.grade }</td>	                      
		                      <td><a class="btn btn-info updateBtn" href="#">수정</a></td>
		                      <td><a class="btn btn-danger delBtn" href="#">삭제</a></td>	                      
		                    </tr>
	                    </c:forEach>                    
	                </tbody>                
	                <!-- 리스트 반복문 끝나는 지점 -->
	            </table>
	            <input type="hidden" name="memberCode">
            </form>
        </div>
    </section>
    
    <script>

        $('#search').click(function(e) {
            const category = $('#category').val();
            const search = $('input[name="search"]').val();
            location.href='${pageContext.request.contextPath}/admin/member?category=' + category + '&search=' + search;
        });
        
        $('.updateBtn').click(function(e) {
        	e.preventDefault();			
		});
        
        $('.delBtn').click(function(e) {
			e.preventDefault();
			const memberCode = $(this).parent().parent().children(':first').text();
			const name = $(this).parent().parent().children(':first').next().next().text();
			console.log(memberCode);
			console.log(name);
			if(confirm('해당 회원의 회원정보를 삭제하시겠습니까?\n회원번호 : ' + memberCode + '\n이름 : ' + name)) {
				$('input[name="memberCode"]').val(memberCode);
				$('#adminMemberForm').attr('action', '${pageContext.request.contextPath}/admin/memberDelete');
				$('#adminMemberForm').submit();
			} else {
				return;
			}
		});

    </script>
    
	<%@ include file="../include/footer.jsp" %>