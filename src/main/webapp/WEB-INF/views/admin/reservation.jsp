<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

    <%@ include file="../include/header.jsp" %>


    <style>
        /* reservations page css */
        a {
            color: inherit;
            text-decoration: none;
        }

        .reservations{
            margin: 50px auto;
            
        }
        
        .resv-select{
            text-align: center;
            border: none;
        }

        .resv-select li {
            
            height: 50px;
            line-height: 50px;
            background: #ccc;
            border-bottom: none;
        }

        #pills-tab li a {
            border: 1px solid black;
            color: #8c8c8c;
            display: block;
            width: 100%;
            height: 100%;
            line-height: 30px;
            border-radius: 0px;
        }

        #pills-tab .active {
            background-color: white;
            color: #000;
            border-radius: 0px;
            border-bottom: none;
        }

        .tab-content .active {color: black;}

        .date-inp {
            width: 20%;
            display: inline;
            border: 1px solid black;
            text-align: center;
        }

        .hotel-select {
            width: 20%;
            display: inline;
            border: 1px solid black;
            text-align: center;
        }

        .date-search-form{
            background: #f0f0f0;
            width: 100%;
            padding: 10px;
            text-align: center;
        }

        .date-search-form .btn {
            background: white;
            display: inline;
            width: 10%;
            border: 1px solid black;
            border-radius: 5px;
        }

        .reservation-title {
            margin-top: 30px;
            border-bottom: 1px solid #c8c8c8;
            padding-bottom: 20px;
        }

        .my-reservations-table {
            margin-top: 20px;
            text-align: center;
            width: 100%;
            
        }

        .my-reservations-table thead th {
            font-weight: 400;
            padding-bottom: 5px;
        }

        .my-reservations-table tbody {
            font-size: 0.8em;
            padding-bottom: 5px;
        }

        /*reservation modal*/
        #reservationModal .modal-content {
            border-radius: 20px;
        }

        .reservation-modal-title {
            text-align: center;
            margin: 0 auto;
            padding: 20px;
            font-weight: 400;
        }

        #modifyReservation .reservation-modify-table {
            margin: 0 auto;
        }

        #modifyReservation .reservation-modify-table tr td {
            padding: 15px 0;
        }

        #modifyReservation .reservation-modify-table strong {
            padding-left: 30px;
            box-sizing: border-box;
        }

        #modifyReservation input, #modifyReservation select {
            width: 100%;
        }

        #reservationModal .btn-close {
            position: absolute;
            top: 40px;
            right: 40px;
        }

        #modifyBtn, #updateBtn {
            width: 50%;
            display: block;
            margin: 10px auto;
        }
        
        .btn { border-radius: 0;}

        .passed {color: #c8c8c8;}


    </style>

    <!-- 메인영역 각자 할꺼 여기서 부터 적으세용 -->
     <section>

        <div class="container">

            <div class="row">			
				
                <div class="col-sm-12 col-md-10 col-lg-9 reservations">
                
                	<form id="searchReservationForm" action="${ pageContext.request.contextPath }/admin/reservation" method="post">
	                	<div class="input-group mb-3">
	                	  <select id="selectCategory" class="form-select" name="category">
	                	  	<option value="email">이메일</option>					    
						    <option value="reservationCode">예약번호</option>					    					    
						  </select>
						  <select id="selectIsMem" class="form-select" name="isMem">				    
						    <option value="member">회원</option>
						    <option value="notMember">비회원</option>			    
						  </select>
						  <input type="text" class="form-control" name="keyword">
						  <button id="searchBtn" class="btn btn-outline-dark" type="button">검색</button>
						</div>
					</form>
					
                    <ul class="nav nav-pills mb-3 resv-select" id="pills-tab" role="tablist">
                        <li class="nav-item col-sm-12 col-md-6" role="presentation">
                          <a class="nav-link active" id="pills-hotel-tab" data-bs-toggle="pill" data-bs-target="#reservationsHotel" type="button" role="tab" aria-controls="pills-hotel" aria-selected="true">HOTEL</a>
                        </li>
                        <li class="nav-item col-sm-12 col-md-6" role="presentation">
                          <a class="nav-link" id="pills-dining-tab" data-bs-toggle="pill" data-bs-target="#reservationsDining" type="button" role="tab" aria-controls="pills-dining" aria-selected="false">DINE &amp; DRINKS</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
                        
                        <!--hotel toggle begin-->
                        <div class="tab-pane fade show active" id="reservationsHotel" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">

                            <h4 class="reservation-title">내 호텔 예약정보</h4>

                            <table class="my-reservations-table hotel-reservations">
                                <thead>
                                    <tr>
                                        <th class="col-md-2">예약번호</th>
                                        <th class="col-md-2">예약지점</th>
                                        <th class="col-md-2">예약객실</th>
                                        <th class="col-md-1">인원</th>
                                        <th class="col-md-1">투숙일</th>
                                        <th class="col-md-2">체크인</th>
                                        <th class="col-md-2">체크아웃</th>
                                        <th class="col-md-2"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:set var="today" value="<%= new java.sql.Timestamp(System.currentTimeMillis()) %>" />
                                    <fmt:parseDate value="${today}" var="todayPlanDate" pattern="yyyy-MM-dd" />
                                    <fmt:parseNumber value="${todayPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>
                                    <c:if test="${roomList.size() > 0}">
                                    <c:forEach var="reserv" items="${roomList}">
                                        <fmt:parseDate value="${reserv.checkInDate}" var="strPlanDate" pattern="yyyy-MM-dd"/>
                                        <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
                                        <fmt:parseDate value="${reserv.checkOutDate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
                                        <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
                                    
                                        <tr data-resv-num="${reserv.reservationCode}" class="${today - endDate > 0 ? 'passed' : ''}">
                                            <td>${reserv.reservationCode}</td>
                                            <td>${reserv.hotelCode}</td>
                                            <td>${reserv.roomCode}</td>
                                            <td>${reserv.capacity}</td>
                                            <td>${endDate - strDate} 박</td>
                                            <td><fmt:formatDate value="${reserv.checkInDate}" pattern="yyyy-MM-dd" /></td>
                                            <td><fmt:formatDate value="${reserv.checkOutDate}" pattern="yyyy-MM-dd" /></td>
                                            <td><button type="button" class="btn btn-outline-danger cancelRoomBtn">X</button></td>
                                        </tr>
                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${roomList.size() == 0}">
                                    	<tr>
                                    		<td colspan="7">
                                    			<h3 class="my-0 mx-auto text-center">검색 결과가 없습니다.</h3>
                                    		</td>
                                    	</tr>
                                    </c:if>
                                </tbody>

                            </table>


                        </div>
                        <!--hotel toggle end-->

                        <!--dining toggle begin-->
                        <div class="tab-pane fade" id="reservationsDining" role="tabpanel" tabindex="0">

                            <h4 class="reservation-title">내 다이닝 예약정보</h4>

                            <table class="my-reservations-table dining-reservations">
                                <thead>
                                    <tr>
                                        <th class="col-md-2">예약번호</th>
                                        <th class="col-md-3">예약지점</th>
                                        <th class="col-md-3">다이닝 선택</th>
                                        <th class="col-md-1">인원</th>
                                        <th class="col-md-2">예약일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${diningList.size() > 0}">
                                    <c:forEach var="reserv" items="${diningList}">
                                    <fmt:parseDate value="${reserv.reservationDate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
                                    <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
                                    <tr data-resv-num="${reserv.reservationCode}" class="${today - endDate > 0 ? 'passed' : ''}">
                                        <td>${reserv.reservationCode}</td>
                                        <td>${reserv.hotelCode}</td>
                                        <td>${reserv.resCode}</td>
                                        <td>${reserv.reservationAmount}</td>
                                        <td><fmt:formatDate value="${reserv.reservationDate}" pattern="yyyy-MM-dd" /></td>
                                        <td><button type="button" class="btn btn-outline-danger cancelDiningBtn">X</button></td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>
                                    <c:if test="${diningList.size() == 0}">
                                    	<tr>
                                    		<td colspan="5">
                                    			<h3 class="my-0 mx-auto text-center">검색 결과가 없습니다.</h3>
                                    		</td>
                                    	</tr>
                                    </c:if>
                                    
                                </tbody>

                            </table>
                        </div>
                        <!--dining toggle end-->

                    </div> <!--end tab contents-->
                    

                </div>

            </div>

        </div>



    </section>

    <script>        

        $(document).ready(function(){

            

            // 검색버튼 이벤트
			$('#searchBtn').click(function() {
				$('#searchReservationForm').submit();
			});
            
            $('#selectCategory').change(function(){
            	if($(this).val() === 'email') {
            		$('#selectIsMem').removeAttr('disabled');
            		return;
            	} else if ($(this).val() === 'reservationCode') {
            		$('#selectIsMem').attr('disabled', 'true');
            		return;
            	}
            });
            
            // 취소 이벤트 (객실)
            $('.cancelRoomBtn').click(function() {
                if(!confirm('해당 예약을 삭제하시겠습니까?')) {
                    return;
                } else {
                    const reservationCode = $(this).parent().parent().data('resvNum');                    
                    console.log(reservationCode);
                    // TODO : 비동기 통신으로 resvNum 넘겨서 객실 예약에서 삭제 시켜버리기
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/admin/cancelRoomReservation",
                        data: JSON.stringify(reservationCode),
                        dataType: "text",
                        contentType: "application/json; charset=UTF-8",
                        success: function (response) {
                            if(response === 'success') {
                                alert('삭제처리 되었습니다.');
                                location.reload();
                            }
                        }
                    });
                }
            });
            
            
            // 취소 이벤트 (다이닝)            
            $('.cancelDiningBtn').click(function() {
                if(!confirm('해당 예약을 삭제하시겠습니까?')) {
                    return;
                } else {
                    const reservationCode = $(this).parent().parent().data('resvNum');                    
                    console.log(reservationCode);
                    // TODO : 비동기 통신으로 resvNum 넘겨서 객실 예약에서 삭제 시켜버리기
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/admin/cancelDiningReservation",
                        data: JSON.stringify(reservationCode),
                        dataType: "text",
                        contentType: "application/json; charset=UTF-8",
                        success: function (response) {
                            if(response === 'success') {
                                alert('삭제처리 되었습니다.');
                                location.reload();
                            }
                        }
                    });
                }
            });

        
        }); // end jQuery
        
    </script>

<%@ include file="../include/footer.jsp" %>
