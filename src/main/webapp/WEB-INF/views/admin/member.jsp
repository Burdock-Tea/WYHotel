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
                        <input type="text" class="form-control" placeholder="검색어를 넣어주세요" name="keyword">
                        <button class="btn btn-outline-secondary" type="button" id="search">검색</button>
                    </div>
                </div>
            </div>
            <form id="adminMemberForm" method="post">
	            <table id="memberTable" class="table" style="background: #FFCD48">
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
            <nav class="page-wrapper">
			  <ul class="pagination justify-content-center">
			  	<c:if test="${ pc.prev }">
			    	<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/admin/member${ pc.makeURI(pc.beginPage - 1) }">이전</a></li>
			    </c:if>
				<c:forEach var="pageNum" begin="${ pc.beginPage }" end="${ pc.endPage }">
			    	<li class="page-item ${ pc.paging.pageNum == pageNum ? 'active' : '' }"><a class="page-link" href="${ pageContext.request.contextPath }/admin/member${ pc.makeURI(pageNum) }">${ pageNum }</a></li>
			    </c:forEach>
			    <c:if test="${ pc.next }">
			    	<li class="page-item"><a class="page-link" href="${ pageContext.request.contextPath }/admin/member${ pc.makeURI(pc.endPage + 1) }">다음</a></li>
			    </c:if>
			  </ul>
			</nav>
            <button type="button" class="btn btn-outline-secondary" id="excelDownload">엑셀파일 다운로드</button>
        </div>
    </section>
    
    <!-- Modal -->
	<div class="modal fade" id="memberModal" tabindex="-1" aria-labelledby="memberModalLabel" aria-hidden="true">
	  <div class="modal-dialog">	
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="memberModalLabel">dummy</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<form id="adminMemberInfoForm" method="post" action="${ pageContext.request.contextPath }/admin/update">
		        <div class="mb-3">
					<label for="memberCode" class="form-label">회원번호</label>
					<input type="text" class="form-control" name="memberCode" id="memberCode" readonly>
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">이메일</label>
					<input type="text" class="form-control" name="email" id="email" readonly>
				</div>
				<div class="mb-3">
					<label for="name" class="form-label">이름</label>
					<input type="text" class="form-control" name="name" id="name">
				</div>
				<div class="mb-3">
					<label for="tel1" class="form-label">전화번호</label>
					<input type="hidden" id="tel" name="tel">
					<div class="input-group">
						<input type="text" class="form-control" aria-label="tel1" name="tel1" id="tel1">
						<span class="input-group-text">-</span>
						<input type="text" class="form-control" aria-label="tel2" name="tel2" id="tel2">
						<span class="input-group-text">-</span>
						<input type="text" class="form-control" aria-label="tel3" name="tel3" id="tel3">
					</div>
				</div>
				<div class="mb-3">
					<label for="addr" class="form-label">주소</label>
					<div class="input-group w-50 mb-1">
					  <input type="text" class="form-control" id="zipCode" name="zipCode" readonly>
					  <button class="btn btn-outline-secondary" type="button" id="zipCodeBtn" onclick="searchAddress()">검색</button>
					</div>
					<input type="text" class="form-control mb-1" id="addrBasic" name="addrBasic" readonly>
					<input type="text" class="form-control mb-1" placeholder="상세주소" id="addrDetail" name="addrDetail">				
				</div>
				<div class="mb-3">
					<div class="form-check form-switch">
					  <input class="form-check-input" type="checkbox" role="switch" id="admin" name="admin">
					  <label class="form-check-label" for="admin">관리자 어부</label>
					</div>
				</div>
			</form>
	      </div> <!-- end modal-body -->
	      <div class="modal-footer">
			<button type="button" class="btn btn-warning" id="resetPassword">비밀번호 초기화</button>
	        <button type="button" class="btn btn-primary" id="update">수정</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script lang="javascript" src="${pageContext.request.contextPath}/js/xlsx.full.min.js"></script>
    <script>

    	// 관리자 회원관리 검색 버튼
        $('#search').click(function(e) {
            const category = $('#category').val();
            const keyword = $('input[name="keyword"]').val();
            location.href='${pageContext.request.contextPath}/admin/member?category=' + category + '&keyword=' + keyword;
        });
        
    	// 각 회원들의 수정 버튼
        $('.updateBtn').click(function(e) {
        	e.preventDefault();
        	const memberCode = $(this).parent().parent().children(':first').text();			
			console.log(memberCode);

			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/admin/getMemberInfo",
				contentType: 'application/json; charset=utf-8',
				data: memberCode,				
				success: function (response) {
					console.log(response);
					$('#memberModalLabel').text(response.name + '님의 회원정보');
					$('#memberCode').val(response.memberCode);
					$('#email').val(response.email);
					$('#name').val(response.name);
					
					// 전화번호는 받고 -기준으로 잘라서 넣어주기!
					let tel = response.tel.split('-');
					$('#tel1').val(tel[0]);
					$('#tel2').val(tel[1]);
					$('#tel3').val(tel[2]);
					
					$('#zipCode').val(response.zipCode);
					$('#addrBasic').val(response.addrBasic);
					$('#addrDetail').val(response.addrDetail);
					
					if(response.admin) {
						$('#admin').attr('checked', 'checked');
					} else {
						$('#admin').removeAttr('checked');
					}
					
					
					$('#memberModal').modal('show');
				}
			});
			
		});
    	
        // 각 회원들의 삭제 버튼
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
        
		// 모달안에 있는 수정 버튼
		$('#update').click(function(e){
			if(confirm('수정하시겠습니까?')) {
				$('#tel').val($('#tel1').val() + '-' + $('#tel2').val() + '-' + $('#tel3').val());				
				$('#adminMemberInfoForm').submit();
			} else {
				return;
			}
		});

		// 해당 회원의 비밀번호 초기화
		$('#resetPassword').click(function (e) {
			if(confirm('해당 회원의 비밀번호를 초기화 하시겠습니까?')) {
				$('#adminMemberInfoForm').attr('action','${pageContext.request.contextPath}/admin/updateTempPassword')
				$('#adminMemberInfoForm').submit();
			} else {
				return;
			}
		});
		
		// 엑셀파일 다운로드 버튼
		$('#excelDownload').click(function(e) {
			let wb = XLSX.utils.table_to_book(document.getElementById('memberTable'), {sheet:"member",raw:true});
			XLSX.writeFile(wb, ('회원정보.xlsx'));
		});
        
        
        
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
    
	<%@ include file="../include/footer.jsp" %>