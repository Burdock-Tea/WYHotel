<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>

<section>
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
</section>

<%@ include file="../include/footer.jsp" %>