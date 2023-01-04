<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
    #reservTitleSpan {font-weight: 500;}

</style>

<section class="container posi">

<h2 id="reservTitle" class="text-center"><span id="reservTitleSpan"></span><small id="isMember"></small></h2>
<form action="#" method="post" id="reservForm" name="reservForm" class="hotelForm">
    
    <div class="row">
        
        <!-- 예약자 정보 -->
        <c:if test="${member == null}">
            <div class="col-md-2"></div>
            <div class="col-md-3">이메일</div>
            <div class="col-md-5">
                <input type="text" id="email" class="form-control" name="email" placeholder="example@example.com">
            </div>
            <div class="col-md-2"></div>

            <div class="col-md-2"></div>
            <div class="col-md-3">이름</div>
            <div class="col-md-5">
                <input type="text" id="name" class="form-control" name="name" placeholder="홍길동">
            </div>
            <div class="col-md-2"></div>

            <div class="col-md-2"></div>
            <div class="col-md-3">전화번호</div>
            <div class="col-md-5">
                <div class="d-inline-flex">
                    <select id="phone1" class="form-select" name="phone1">
                        <option>010</option>
                        <option>011</option>
                        <option>018</option>
                    </select>
                    <span class="mt-2 px-2"> - </span>
                    <input type="tel" id="phone2" class="form-control" name="phone2" maxlength="4" placeholder="0000" id="inputDefault"> 
                    <span class="mt-2 px-2"> - </span>
                    <input type="tel" id="phone3" class="form-control" name="phone3" maxlength="4" placeholder="0000" id="inputDefault"> 
                </div>
            </div>
            <div class="col-md-2"></div>
        </c:if>

        <input type="hidden" id="memberCode" name="memberCode" value="">

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
                <select class="form-select" aria-label="Default select example" name="roomCode">
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
                <select class="form-select" aria-label="Default select example" name="resCode">
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
                <input type="date" value="" class="form-control" name="strDate">
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
            <!-- 7그룹 -->
            <div class="col-md-2"></div>
            <div class="col-md-3">결제방식</div>
            <div class="col-md-5">
                <select class="form-select" aria-label="Default select example" name="paymentMethod" id="paymentMethod">
                    <option value="none">선택</option>
                    <option value="practiceKakao">카카오페이</option>
                    <option value="naver">네이버페이</option>
                    <option value="payco">PAYCO</option>
                    <option value="practiceToss">Toss</option>
                </select>
            </div>
            <div class="col-md-2"></div>
            <!-- 7그룹 끝 -->

        </c:if>

        <!-- 버튼 -->
        <div class="col-md-5"></div>
        <div class="col-md-2 pt-3">
            <c:if test="${param.category == 'hotels'}">
                <button type="button" class="btn btn-dark form-control" id="paymentsBtn">결제 및 예약확정</button>
            </c:if>
            <c:if test="${param.category == 'dinings'}">
                <button type="button" class="btn btn-dark form-control" id="diningReservBtn">예약확정</button>
            </c:if>
        </div>
        <div class="col-md-5"></div>
        <!-- 버튼 끝-->

    </div>
    
    
    
</form>
</section>

<script>

    let memCode = '';

    $('#reservTitleSpan').text(('${reservation.category}' === 'dinings' ? '다이닝 예약 선택사항 확인' : '호텔 예약 선택사항 확인'));
    $('#isMember').text(('${member}' === '' ? '(비회원 예약)' : '(회원 예약)'));

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
        document.reservForm.strDate.value = daterange;
    }

    // iamport (결제) 함수 생성
    function iamport(selectedMethod, membercode, mPrice, mEmail, mName, mTel){
		//가맹점 식별코드
		IMP.init('imp23063478');
		IMP.request_pay({
		    pg : 'kcp.A52CY',
		    pay_method : selectedMethod,
		    merchant_uid : membercode + '-' + new Date().getTime(),
		    amount : price, //실제 결제되는 가격
		    buyer_email : mEmail,
		    buyer_name : mName,
		    buyer_tel : mTel,
            m_redirect_url: '${pageContext.request.contextPath}/'
		}, function(rsp) {
			console.log(rsp);
		    if ( !rsp.success ) {
		    	var msg = '결제에 실패하였습니다.';
		        msg += '\r\n에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}

    $(document).ready(function(){

        

        //다이닝 예약확정 버튼 클릭(비회원)
        $('#diningReservBtn').click(function(){

            
            if (memCode === ''){
                if ('${member}' === '') {

                    if ($('#email').val().trim() === '') {
                        alert('이메일을 입력하세요');
                        $('#email').val('');
                        $('#email').focus();
                        return;
                    } else if ($('#name').val().trim() === '') {
                        alert('이름을 입력하세요');
                        $('#name').val('');
                        $('#name').focus();
                        return;
                    } else if ($('#phone2').val().trim() === '') {
                        alert('전화번호를 입력하세요');
                        $('#phone2').val('');
                        $('#phone2').focus();
                        return;
                    } else if ($('#phone3').val().trim() === '') {
                        alert('전화번호를 입력하세요');
                        $('#phone3').val('');
                        $('#phone3').focus();
                        return;
                    }
                    const email = $('#email').val();
                    const name = $('#name').val();
                    const tel = $('#phone1').val() + '-' + $('#phone2').val() + '-' + $('#phone3').val();

                    const data = {
                        'email' : email,
                        'name' : name,
                        'tel' : tel
                    };

                    $.ajax({
                        type: 'POST',
                        url : '${pageContext.request.contextPath}/reservation/createNmemCode',
                        contentType: 'application/JSON',
                        data: JSON.stringify(data),
                        success: function(result) {
                            memCode = result;
                            console.log(memCode);
                            console.log($('#memberCode'));
                            $('#memberCode').val(memCode);
                            if (confirm('위의 내용대로 예약하시겠습니까?')){
                                $('#reservForm').attr('action', '${pageContext.request.contextPath}/reservation/diningReserv');
                                $('#reservForm').submit();
                            }
                        } 
                    });
                    
                } else {
                    memCode = '${member}';
                    console.log(memCode);
                    $('#memberCode').val(memCode);
                    if (confirm('위의 내용대로 예약하시겠습니까?')){
                        $('#reservForm').attr('action', '${pageContext.request.contextPath}/reservation/diningReserv');
                        $('#reservForm').submit();
                    }
                }


            }

            
        }); // 다이닝 예약확정 종료

        // 결제방식 선택 버튼 클릭이벤트 시작
        $('#paymentsBtn').click(function(){
            if ($('#paymentMethod').val() === 'none') {
                alert('결제방식을 선택하세요');
                $('#paymentMethod').focus();
                return;
            } else {

            }
        }); // 결제방식 선택 버튼 클릭이벤트 끝
        
    });
    
</script>

<%@ include file="../include/footer.jsp" %>