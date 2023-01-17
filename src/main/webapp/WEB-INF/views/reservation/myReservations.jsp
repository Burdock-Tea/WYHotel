<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<spring:eval expression="@tossProperties['toss.key']" var="key" />
<script src="https://js.tosspayments.com/v1/payment"></script> 

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

        .my-reservations-table tbody tr:hover {
            cursor: pointer;
            transform: scale(1.01);
            transition: 0.5s;
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
                        <div class="tab-pane fade" id="reservationsDining" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">

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






    <%@ include file="./reservationModal.jsp" %>


    <script>

        const msg = '${msg}';
        if (msg === 'reservSuccess'){
            alert('예약 성공');
            if(confirm('추가 예약하시겠습니까?')) {
                window.location.href = '${pageContext.request.contextPath}/reservation/reservationPage';
            }
        } else if (msg !== '') {
            if(confirm('예약번호 ' + msg + '번 예약이 취소되었습니다.\r\n새로 예약하시겠습니까?')) {
                window.location.href = '${pageContext.request.contextPath}/reservation/reservationPage';
            }
        }

        $(document).ready(function(){

            // 예약 취소버튼 활성, 비활성 여부 처리
            const today = new Date();

            /**
             * 호텔 예약버튼
            */
            $('.hotel-reservations tbody').on('click', 'tr', function(e){
                const resvNum = $(this).data('resvNum');
                
                $.ajax({
                    type: 'POST',
                    url : '${pageContext.request.contextPath}/reservation/getReservDetailRoom',
                    contentType: 'application/JSON',
                    data: JSON.stringify(resvNum),
                    success: function(detail) {
                        $('.reservation-modal-title').text('호텔 예약 상세');
                        $('.hotelForm #reservationCode').val(resvNum);
                        $('.hotelForm #hotelCode').val(detail.hotelCode);
                        $('.hotelForm #roomCode').val(detail.roomCode);
                        $('.hotelForm #capacity').val(detail.capacity);

                        const cInDate = new Date(detail.checkInDate);
                        const cOutDate = new Date(detail.checkOutDate);

                        const cInDateStr = cInDate.getFullYear() + '-' + 
                                            (String(cInDate.getMonth() + 1).length === 1 ? '0' + String(cInDate.getMonth() + 1) : String(cInDate.getMonth() + 1)) + '-' + 
                                            (String(cInDate.getDate()).length === 1 ? '0' + String(cInDate.getDate()) : String(cInDate.getDate()));
                        $('.hotelForm #cInDate').val(cInDateStr);
                        const cOutDateStr = cOutDate.getFullYear() + '-' + 
                                            (String(cOutDate.getMonth() + 1).length === 1 ? '0' + String(cOutDate.getMonth() + 1) : String(cOutDate.getMonth() + 1)) + '-' + 
                                            (String(cOutDate.getDate()).length === 1 ? '0' + String(cOutDate.getDate()) : String(cOutDate.getDate()));
                        $('.hotelForm #cOutDate').val(cOutDateStr);

                        const nights = (cOutDate - cInDate) / (60*1000*60*24) + '박';
                        $('.hotelForm #nights').val(nights);

                        const isShow = (today - detail.checkInDate)/(1000*60*60*24);
                        const reviewShow = Math.floor((today - detail.checkOutDate)/(1000*60*60*24));
                        console.log(isShow);
                        if (isShow >= 0) {
                            $('#cancelRoomBtn').addClass('visually-hidden'); 
                            $('#cancelRoomBtn').attr('disabled', true);
                        } else {
                            $('#cancelRoomBtn').removeClass('visually-hidden'); 
                            $('#cancelRoomBtn').attr('disabled', false);
                        }

                        if (reviewShow <= 0) {
                            $('#reviewBtn').addClass('visually-hidden'); 
                            $('#reviewBtn').attr('disabled', true);
                        } else {
                            $('#reviewBtn').removeClass('visually-hidden'); 
                            $('#reviewBtn').attr('disabled', false);
                        }


                        $('.hotelForm').attr('hidden', false);
                        $('.diningForm').attr('hidden', true);
                        $('#reservationModal').modal('show');


                        // 후기 작성 버튼 클릭 이벤트
                        $('#reviewBtn').click( function(e){
                            if (reviewShow <= 0) {
                                e.preventDefault();
                                alert('잘못된 접근입니다.');
                                return;
                            } else if ('${member}'.substring(0,1) === '1' || '${member}'.substring(0,1) === '2') {
                                e.preventDefault();
                                alert('회원전용 기능입니다.');
                                return;
                            } else {
                                $('#modifyReservation').attr('action', '${pageContext.request.contextPath}/review/write');
                                $('#modifyReservation').submit();
                            }
                        }); // 후기 작성 버튼 클릭 이벤트 종료
                    }
                });
                





            }); // 호텔 예약확인 버튼처리 끝

            /**
             * 다이닝 예약버튼
            */
            $('.dining-reservations tbody').on('click', 'tr', function(e){
                const resvNum = $(this).data('resvNum');

                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/reservation/getReservDetailDining',
                    contentType: 'application/JSON',
                    data: JSON.stringify(resvNum),
                    success: function(detail){
                        $('.reservation-modal-title').text('다이닝 예약 상세');
                        $('.diningForm #reservationCode').val(resvNum);
                        $('.diningForm #hotelCode').val(detail.hotelCode);
                        $('.diningForm #resCode').val(detail.resCode);
                        $('.diningForm #reservationAmount').val(detail.reservationAmount);
                        
                        const resvDate = new Date(detail.reservationDate);
                        const resvString = resvDate.getFullYear() + '-' + 
                                            (String(resvDate.getMonth() + 1).length === 1 ? '0' + String(resvDate.getMonth() + 1) : String(resvDate.getMonth() + 1)) + '-' + 
                                            (String(resvDate.getDate()).length === 1 ? '0' + String(resvDate.getDate()) : String(resvDate.getDate()));
                        $('.diningForm #date').val(resvString);
                        $('.diningForm #reservationTime').val(detail.reservationTime);

                        const isShow = (today-detail.reservationDate)/(1000*60*60*24);
                        if(isShow > -1) {
                            $('#cancelDiningBtn').addClass('visually-hidden');
                            $('#cancelDiningBtn').attr('disabled', true);
                        } else {
                            $('#cancelDiningBtn').removeClass('visually-hidden');
                            $('#cancelDiningBtn').attr('disabled', false);
                        }

                        $('.hotelForm').attr('hidden', true);
                        $('.diningForm').attr('hidden', false);
                        $('#reservationModal').modal('show');    
                    }
                });
                
                

            });// 다이닝 예약확인 버튼처리 끝

            
            
            // 다이닝 예약 취소 버튼
            $('#cancelDiningBtn').click(function(){
                
                if(confirm('예약 취소 하시겠습니까?')){
                    $('.diningForm').submit();
                }
                
            }); // 다이닝 예약 취소 이벤트 종료


            // 객실 예약 취소
            $('#cancelRoomBtn').click(function(){
                
                if(confirm('예약 취소하시겠습니까?')){
                    const resvNum = $('#reservationCode').val();
                    $.ajax({
                        type: 'POST',
                        url : '${pageContext.request.contextPath}/reservation/getPaymentKey',
                        contentType: 'application/JSON',
                        data: resvNum,
                        success: function(paymentKey) {
                            const cancelReason = prompt('취소 사유를 입력하세요');
                            console.log(paymentKey);
                            fetch('https://api.tosspayments.com/v1/payments/' + paymentKey + '/cancel', {
                                method: 'POST',
                                headers: {
                                    'Authorization': '${key}',
                                    'Content-Type': 'application/json'
                                },
                                body: JSON.stringify({
                                    'cancelReason': cancelReason
                                })
                            }).then(function(){
                                $('.hotelForm').submit();
                            });
                        },
                        error: function() {
                            alert('통신오류');
                        }
                    });
                }
                
            }); // 객실 예약 취소 이벤트 종료



        
        }); // end jQuery
        
    </script>

<%@ include file="../include/footer.jsp" %>
