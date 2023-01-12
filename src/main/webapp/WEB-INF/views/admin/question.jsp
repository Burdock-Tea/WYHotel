<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>

	<%@ include file="../include/header.jsp" %>
		
	<section> <!-- start question body -->
        <div class="container">
            <h2 class="mt-3">
                문의내역 관리 (관리자 시점)
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
	            <table id="memberTable" class="table">
	                <thead>
	                  <tr class="admin-table">
	                    <th>문의코드</th>
						<th>지점</th>
						<th>유형</th>
						<th>제목</th>
						<th>문의날짜</th>
						<th>답변날짜</th>
						<th>답변유무</th>
	                  </tr>
	                </thead>	                	                
	                <tbody>
	                	<!-- 리스트 반복문 시작 지점 -->                	
	                    <tr>
							<td>p1</td>
							<td>서울</td>
							<td>결제문의</td>
							<td>결제가 제대로 이루어지지 않았어요</td>
							<td>3일 전</td>
							<td>방금</td>
							<td>O</td> <!-- 체크박스로 하던지 아님 뭘로 하던지.. -->
	                    </tr>
	                    <!-- 리스트 반복문 끝나는 지점 -->                    
	                </tbody>
	            </table>	            
            </form>
            
            <!-- 페이징 지점 -->
            <!-- 
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
			-->
            
        </div> <!-- end container -->
    </section> <!-- end question body -->
    
    <!-- Modal -->
	<div class="modal fade" id="memberModal" tabindex="-1">
	  <div class="modal-dialog">	
	    <div class="modal-content">
	      <div class="modal-header"> <!-- start modal header -->
	        <h1 class="modal-title fs-5" id="memberModalLabel">dummy</h1>	        
	      </div> <!-- end modal header -->
	      <div class="modal-body"> <!-- start modal body -->
	      	
	      </div> <!-- end modal-body -->
	      <div class="modal-footer"> <!-- start modal footer -->
			
	      </div> <!-- end modal footer -->
	    </div>
	  </div>
	</div>
	<!-- end Modal -->
	
	
    	
    <script>
    
    	// start jQuery
    	$(function() {
    		
    	}) // end jQuery
    	
    </script>
    
	<%@ include file="../include/footer.jsp" %>