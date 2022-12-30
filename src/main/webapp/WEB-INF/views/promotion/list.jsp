<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>
<style>
.promotion-wrap .card{
    margin: 0 auto;
}
</style>
	<section>
        <div class="container">
            <h2 class="text-center mb-2 mt-2">프로모션</h2>
            <!-- 관리자로 로그인 했을때 보이게 하면 됩니다 -->
            <button type="button" class="btn btn-secondary" onclick="location.href='${ pageContext.request.contextPath }/promotion/insert'">프로모션 등록</button>
            <!-- 관리자로 로그인 했을때 보이게 하면 됩니다 -->
            <div class="promotion-wrap">
                <hr>
                <!-- 프로모션 리스트 시작 지점 -->
                <c:forEach items="${ promotionList }" var="list">
	                <div class="card mb-3" style="max-width: 800px;">
	                    <div class="row g-0">
	                      <div class="col-md-4">
	                        <img src="${pageContext.request.contextPath}/promotion/display?fileLocation=${ list.fileLocation }&fileName=${ list.fileName }" class="img-fluid rounded-start" alt="...">
	                      </div>
	                      <div class="col-md-8">
	                        <div class="card-body">
	                          <h5 class="card-title">${ list.promotionName }</h5>
	                          <p class="card-text">${ list.promotionContent }</p>
	                          <span>${ list.startDate } ~ ${ list.endDate }</span> <br>
	                          <strong>${ list.promotionPrice }원</strong>	                          
	                        </div>
	                      </div>
	                    </div>
	                </div>
                </c:forEach>
                <!-- 프로모션 리스트 끝 지점 -->
            </div>
        </div>
    </section>
<%@ include file="../include/footer.jsp" %>