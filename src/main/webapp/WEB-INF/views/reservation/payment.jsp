<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>

<section class="container posi">

<h2 id="reservTitle" class="text-center">예약하기</h2>
<form action="#" method="post" id="reservForm" name="reservForm" class="hotelForm">
    
    <div class="row">
        <!-- 1그룹 -->
        <div class="col-md-2"></div>
        <div class="col-md-3">예약지점</div>
        <div class="col-md-5">
            <select class="form-select" aria-label="Default select example" name="hotelCode">
                <option ${hotelCode == null ? 'selected' : ''}>지점선택</option>
                <option value="10" ${reservation.hotelCode == '10' ? 'selected' : ''}>서울WY호텔</option>
                <option value="20" ${reservation.hotelCode == '20' ? 'selected' : ''}>부산WY호텔</option>
                <option value="30" ${reservation.hotelCode == '30' ? 'selected' : ''}>제주WY호텔</option>
            </select>
        </div>
        <div class="col-md-2"></div>
        <!-- 1그룹 끝 -->
        
        <!-- 2그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">객실</div>
            <div class="col-md-5">
                <select class="form-select" aria-label="Default select example" name="hotelCode">
                    <option ${hotelCode == null ? 'selected' : ''}>객실선택</option>
                    <c:forEach var="room" items="${list}">
                        <option value="${room.roomCode}" ${reservation.code == room.roomCode ? 'selected' : ''}>${room.roomGrade}</option>
                        <c:if test="${reservation.code == room.roomCode}">
                            <c:set var="price" value="${room.roomPrice}"/>
                        </c:if>
                    </c:forEach>
                    
                </select>
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">다이닝선택</div>
            <div class="col-md-5">
                <select class="form-select" aria-label="Default select example" name="hotelCode">
                    <option ${hotelCode == null ? 'selected' : ''}>다이닝 선택</option>
                    <c:forEach var="dining" items="${list}">
                        <option value="${dining.resCode}" ${reservation.code == dining.resCode ? 'selected' : ''}>${dining.resName}</option>
                    </c:forEach>
                    
                </select>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 2그룹 끝 -->

        <!-- 3그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">인원</div>
            <div class="col-md-5">
                <select class="form-select" aria-label="Default select example" name="capacity">
                    <option>인원수</option>
                    <option value="1" ${reservation.capacity == '1' ? 'selected' : ''}>1</option>
                    <option value="2" ${reservation.capacity == '2' ? 'selected' : ''}>2</option>
                    <option value="3" ${reservation.capacity == '3' ? 'selected' : ''}>3</option>
                    <option value="4" ${reservation.capacity == '4' ? 'selected' : ''}>4</option>
                </select>
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">인원</div>
            <div class="col-md-5">
                <select class="form-select" aria-label="Default select example" name="reservationAmount">
                    <option>인원수</option>
                    <option value="1" ${reservation.capacity == '1' ? 'selected' : ''}>1</option>
                    <option value="2" ${reservation.capacity == '2' ? 'selected' : ''}>2</option>
                    <option value="3" ${reservation.capacity == '3' ? 'selected' : ''}>3</option>
                    <option value="4" ${reservation.capacity == '4' ? 'selected' : ''}>4</option>
                </select>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 3그룹 끝 -->

        <!-- 4그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">체크인</div>
            <div class="col-md-5">
                <input type="date" value="" class="form-control" name="checkInDate">
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">예약일</div>
            <div class="col-md-5">
                <input type="date" value="" class="form-control" name="reservationDate">
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 4그룹 끝 -->

        <!-- 5그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">체크아웃</div>
            <div class="col-md-5">
                <input type="date" value="" class="form-control" name="checkOutDate">
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">예약시간</div>
            <div class="col-md-5">
                <select class="form-select" aria-label="Default select example" name="reservationTime">
                    <option>시간선택</option>
                    <optgroup label="Lunch">
                        <option ${reservation.reservationTime == '11:30' ? 'selected' : ''}>11:30</option>
                        <option ${reservation.reservationTime == '12:00' ? 'selected' : ''}>12:00</option>
                        <option ${reservation.reservationTime == '12:30' ? 'selected' : ''}>12:30</option>
                        <option ${reservation.reservationTime == '13:00' ? 'selected' : ''}>13:00</option>
                        <option ${reservation.reservationTime == '13:30' ? 'selected' : ''}>13:30</option>
                    </optgroup>
                    <optgroup label="Dinner">
                        <option ${reservation.reservationTime == '17:30' ? 'selected' : ''}>17:30</option>
                        <option ${reservation.reservationTime == '18:00' ? 'selected' : ''}>18:00</option>
                        <option ${reservation.reservationTime == '18:30' ? 'selected' : ''}>18:30</option>
                        <option ${reservation.reservationTime == '19:00' ? 'selected' : ''}>19:00</option>
                        <option ${reservation.reservationTime == '19:30' ? 'selected' : ''}>19:30</option>
                        <option ${reservation.reservationTime == '20:00' ? 'selected' : ''}>20:00</option>
                    </optgroup>
                </select>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 5그룹 끝 -->

        <!-- 5그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">투숙일</div>
            <div class="col-md-5">
                <input type="text" value="" class="form-control" name="nights">
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">요청사항</div>
            <div class="col-md-5">
                <textarea name="reservationRequest" class="form-control"></textarea>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 5그룹 끝 -->

        <c:if test="${param.category == 'hotels'}">
            <!-- 6그룹 -->
            <div class="col-md-2"></div>
            <div class="col-md-3">가격</div>
            <div class="col-md-5">
                <input type="text" value="${price}" class="form-control" name="roomPrice">
            </div>
            <div class="col-md-2"></div>
            <!-- 6그룹 끝 -->

        </c:if>

        <!-- 버튼 -->
        <div class="col-md-5"></div>
        <div class="col-md-2 pt-3">
            <button type="button" class="btn btn-dark form-control" id="modifyBtn">예약하기</button>
        </div>
        <div class="col-md-5"></div>
        <!-- 6그룹 끝 -->

    </div>
    
    
    
</form>
</section>

<script>

    $('#reservTitle').text(('${reservation.category}' === 'dinings' ? '다이닝 예약 선택사항 확인' : '호텔 예약 선택사항 확인'));

    if ('${reservation.category}' === 'hotels') {
        const daterange = '${reservation.daterange}';
        const checkInDate = daterange.substring(0, daterange.indexOf('/') - 1);
        const checkOutDate = daterange.substring(daterange.indexOf('/') + 2)

        document.reservForm.checkInDate.value = checkInDate;
        document.reservForm.checkOutDate.value = checkOutDate;

        const nights = (new Date(checkOutDate) - new Date(checkInDate)) / (1000 * 60 * 60 * 24);
        console.log(nights + ' 박');
        document.reservForm.nights.value = nights + ' 박';

    } else {
        const daterange = '${reservation.daterange}';
        document.reservForm.reservationDate.value = daterange;
    }
    
</script>

<%@ include file="../include/footer.jsp" %>