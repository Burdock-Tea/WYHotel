<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--modal-->
    <div id="reservationModal" class="modal fade">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header position-relative">
                <h5 class="reservation-modal-title">예약 상세</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="#" method="post" id="modifyReservation" class="hotelForm">
                    <table class="col-md-10">
                        <tbody class="reservation-modify-table">

                            <tr class="reservationCode">
                                <td class="col-md-5"><strong>예약번호</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="reservationCode" id="reservationCode" readonly></td>
                            </tr>
                            <tr class="hotelCode">
                                <td class="col-md-5"><strong>예약지점</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="hotelCode" id="hotelCode" readonly></td>
                            </tr>

                            <!--hotel reservation-->
                            <tr class="roomCode">
                                <td class="col-md-5"><strong>예약객실</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="roomCode" id="roomCode" readonly></td>
                            </tr>
                            <tr class="capacity">
                                <td class="col-md-5"><strong>인원</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="capacity" id="capacity" readonly></td>
                            </tr>
                            <tr class="nights">
                                <td class="col-md-5"><strong>투숙일</strong></td>
                                <td class="col-md-7"><input type="text" value="2박" name="nights" id="nights" readonly></td>
                                <!-- 계산해서 넣어라 아마 el로..-->
                            </tr>
                            <tr class="checkInDate">
                                <td class="col-md-5"><strong>체크인</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="cInDate" id="cInDate" readonly></td>
                            </tr>
                            <tr class="checkOutDate">
                                <td class="col-md-5"><strong>체크아웃</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="cOutDate" id="cOutDate" readonly></td>
                            </tr>

                        </tbody>

                    </table>
                    
                    <button type="button" class="btn bnt-modify btn-dark form-control" id="cancelRoomBtn">예약취소</button>
                    
                </form>

                <!--dining form-->
                <form action="${pageContext.request.contextPath}/reservation/cancelDining" method="post" id="cancelReservation" class="diningForm">
                    <table class="col-md-10">
                        <tbody class="reservation-modify-table">

                            <tr class="reservationCode">
                                <td class="col-md-5"><strong>예약번호</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="reservationCode" id="reservationCode" readonly></td>
                            </tr>
                            <tr class="hotelCode">
                                <td class="col-md-5"><strong>예약지점</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="hotelCode" id="hotelCode" readonly></td>
                            </tr>
                            <tr class="resCode">
                                <td class="col-md-5"><strong>다이닝 선택</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="resCode" id="resCode" readonly></td>
                            </tr>
                            <!--dining reservation-->
                            <tr class="reservationAmount">
                                <td class="col-md-5"><strong>인원</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="reservationAmount" id="reservationAmount" readonly></td>
                            </tr>
                            <tr class="reservationDate">
                                <td class="col-md-5"><strong>예약일</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="date" id="date" readonly></td>
                            </tr>
                            <tr class="reservationTime">
                                <td class="col-md-5"><strong>예약시간</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="reservationTime" id="reservationTime" readonly></td>
                            </tr>


                        </tbody>

                    </table>
                    
                    <button type="button" class="btn bnt-modify btn-dark form-control" id="cancelDiningBtn">예약취소</button>
                    
                </form>


            </div>
              
            </div>
        </div>
    </div>