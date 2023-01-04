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
                                <td class="col-md-7">
                                    <select type="text" value="" name="hotelCode" id="hotelCode" class="form-control"
                                    onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;" readonly>
                                        <option value="entire">전체</option>
                                        <option value="sl" selected>WY호텔 서울</option>
                                        <option value="bn">WY호텔 부산</option>
                                        <option value="jj">WY호텔 제주</option>
                                    </select>
                                </td>
                            </tr>

                            <!--hotel reservation-->
                            <tr class="roomCode">
                                <td class="col-md-5"><strong>예약객실</strong></td>
                                <td class="col-md-7">
                                    <select name="roomCode" id="roomCode" class="form-control"
                                    onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;" readonly>
                                        <option value="su" selected>Suite</option>
                                        <option value="bd">Business Delux</option>
                                        <option value="bs">Business</option>
                                        <option value="sd">Standard Delux</option>
                                        <option value="st">Standard</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="capacity">
                                <td class="col-md-5"><strong>인원</strong></td>
                                <td class="col-md-7">
                                    <select name="capacity" id="capacity" class="form-control"
                                    onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;" readonly>
                                        <option>1</option>
                                        <option selected>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="nights">
                                <td class="col-md-5"><strong>투숙일</strong></td>
                                <td class="col-md-7"><input type="text" value="2박" name="nights" id="nights" readonly></td>
                                <!-- 계산해서 넣어라 아마 el로..-->
                            </tr>
                            <tr class="checkInDate">
                                <td class="col-md-5"><strong>체크인</strong></td>
                                <td class="col-md-7"><input type="date" value="2022-12-23" name="checkInDate" id="checkInDate" class="form-control" readonly></td>
                            </tr>
                            <tr class="checkOutDate">
                                <td class="col-md-5"><strong>체크아웃</strong></td>
                                <td class="col-md-7"><input type="date" value="2022-12-25" name="checkOutDate" id="checkOutDate" class="form-control" readonly></td>
                            </tr>

                        </tbody>

                    </table>
                    
                    <button type="button" class="btn bnt-modify btn-dark form-control" id="modifyBtn">예약 변경하기</button>
                    
                </form>

                <!--dining form-->
                <form action="#" method="post" id="modifyReservation" class="diningForm">
                    <table class="col-md-10">
                        <tbody class="reservation-modify-table">

                            <tr class="reservationCode">
                                <td class="col-md-5"><strong>예약번호</strong></td>
                                <td class="col-md-7"><input type="text" value="" name="reservationCode" id="reservationCode" readonly></td>
                            </tr>
                            <tr class="hotelCode">
                                <td class="col-md-5"><strong>예약지점</strong></td>
                                <td class="col-md-7">
                                    <select type="text" value="" name="hotelCode" id="hotelCode" class="form-control"
                                    onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;" readonly>
                                        <option value="entire">전체</option>
                                        <option value="sl" selected>WY호텔 서울</option>
                                        <option value="bn">WY호텔 부산</option>
                                        <option value="jj">WY호텔 제주</option>
                                    </select>
                                </td>
                            </tr>
                            <!--dining reservation-->
                            <tr class="reservationAmount">
                                <td class="col-md-5"><strong>인원</strong></td>
                                <td class="col-md-7">
                                    <select name="reservationAmount" id="reservationAmount" class="form-control"
                                    onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;" readonly>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option selected>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="resCode">
                                <td class="col-md-5"><strong>다이닝 선택</strong></td>
                                <td class="col-md-7">
                                    <select name="resCode" id="resCode" class="form-control"
                                    onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;" readonly>
                                        <option value="s1">별론데 비싼 다이닝</option>
                                        <option value="s2">적당히 맛있고 싼 다이닝</option>
                                        <option value="s3" selected>죤맛탱 다이닝</option>
                                        <option value="s4">뭐넣지 블라블라 다이닝</option>
                                        <option value="s5">다이닝쓰</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="reservationTime">
                                <td class="col-md-5"><strong>예약시간</strong></td>
                                <td class="col-md-7"><input type="text" value="17:30" name="reservationTime" id="reservationTime" class="form-control" readonly></td>
                            </tr>
                            <tr class="reservationDate">
                                <td class="col-md-5"><strong>예약일</strong></td>
                                <td class="col-md-7"><input type="date" value="2022-12-25" name="reservationDate" id="reservationDate" class="form-control" readonly></td>
                            </tr>


                        </tbody>

                    </table>
                    
                    <button type="button" class="btn bnt-modify btn-dark form-control" id="modifyBtn">예약 변경하기</button>
                    
                </form>


            </div>
              
            </div>
        </div>
    </div>