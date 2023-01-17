<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="../include/header.jsp" %>
<spring:eval expression="@tossProperties['toss.key']" var="key" />
<script src="https://js.tosspayments.com/v1/payment"></script>
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
            <input type="hidden" value="${reservation.hotelCode}" name="hotelCode" id="hotelCode" readonly>
            <input type="text" class="form-control" id="hotelName" value="" readonly>
        </div>
        <div class="col-md-2"></div>
        <!-- 1그룹 끝 -->
        
        <!-- 2그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">객실</div>
            <div class="col-md-5">
                <input type="hidden" value="${reservation.code}" name="roomCode" id="roomCode" readonly>
                <input type="text" class="form-control" id="roomGrade" value="" readonly>
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
                <input type="text" class="form-control" name="capacity" value="${reservation.capacity}" readonly>
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">인원</div>
            <div class="col-md-5">
                <input type="text" class="form-control" name="reservationAmount" value="${reservation.capacity}" readonly>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 3그룹 끝 -->

        <!-- 4그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">체크인</div>
            <div class="col-md-5">
                <input type="date" value="" class="form-control" name="checkInDate" readonly>
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">예약일</div>
            <div class="col-md-5">
                <input type="text" value="" class="form-control" name="strDate" readonly>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 4그룹 끝 -->

        <!-- 5그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">체크아웃</div>
            <div class="col-md-5">
                <input type="text" value="" class="form-control" name="checkOutDate" readonly>
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">예약시간</div>
            <div class="col-md-5">
                <input type="text" value="${reservation.reservationTime}" class="form-control" name="reservationTime" readonly>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 5그룹 끝 -->

        <!-- 5그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">투숙일</div>
            <div class="col-md-5">
                <input type="text" value="" class="form-control" name="nights" readonly>
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
            <div class="col-md-3">가격<small>(* VAT를 포함한 가격입니다.)</small></div>
            <div class="col-md-5">
                <input type="text" value="" class="form-control" name="roomPrice" id="roomPrice" readonly>
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

        $('#reservTitleSpan').text(('${reservation.category}' === 'dinings' ? '다이닝 예약 선택사항 확인' : '호텔 예약 선택사항 확인'));
        $('#isMember').text(('${member}' === '' ? '(비회원 예약)' : '(회원 예약)'));

        var memCode = '';
        let memName = '';
        let memEmail = '';
        let price;
  



        if ('${reservation.category}' === 'hotels') {
            let nigths = 0;
            let accumulatePoint = 0;
            const daterange = '${reservation.daterange}';
            const checkInDate = daterange.substring(0, daterange.indexOf('/') - 1);
            const checkOutDate = daterange.substring(daterange.indexOf('/') + 2);
            
            document.reservForm.checkInDate.value = checkInDate;
            document.reservForm.checkOutDate.value = checkOutDate;

            nights = (new Date(checkOutDate) - new Date(checkInDate)) / (1000 * 60 * 60 * 24);
            document.reservForm.nights.value = nights + ' 박';
            
            
            let basicPrice;
            switch('${reservation.code}') {
                case '55' :
                    document.getElementById('roomGrade').value = 'Suite';
                    basicPrice = 2000000 * nights;
                    break;
                case '44' :
                    document.getElementById('roomGrade').value = 'Business Deluxe';
                    basicPrice = 1800000 * nights;
                    break;
                case '33' :
                    document.getElementById('roomGrade').value = 'Business';
                    basicPrice = 1700000 * nights;
                    break;
                case '22' :
                    document.getElementById('roomGrade').value = 'Standard Deluxe';
                    basicPrice = 1000000 * nights;
                    break;
                case '11' :
                    document.getElementById('roomGrade').value = 'Standard';
                    basicPrice = 800000 * nights;
                    break;
            }

            
            if ('${member}' !== ''){
                const memberCode = '${member}';
                const isMem = memberCode.substring(0, 1);
                if (isMem !== '1' && isMem !== '2') {
                    $.ajax({
                        type: 'POST',
                        url : '${pageContext.request.contextPath}/member/getInfo',
                        contentType: 'application/JSON',
                        data: memberCode,
                        success: function(memberInfo){
                            const grade = memberInfo.grade;
                            $.ajax({
                                type: 'POST',
                                url : '${pageContext.request.contextPath}/member/getMembershipInfo',
                                contentType: 'application/JSON',
                                data: grade,
                                success: function(membership){
                                	price = Math.floor(basicPrice * 1.1 * (1 - membership.dcPercent));
                                	if('${param.price}' !== '') {
                                   		price = '${param.price}';	
                                	}
                                    document.reservForm.roomPrice.value = price;
                                    accumulatePoint = price * membership.pointAccumulate;                                    
                                    console.log('적립 포인트: ', accumulatePoint);
                                },
                                error: function(){
                                    alert('멤버십 통신 실패');
                                }
                            });
                        },
                        error: function(){
                            alert('통신실패');
                        }
                    });
                    
                } else {
                	price = Math.floor(basicPrice * 1.1);
                	if('${param.price}' !== '') {
                   		price = '${param.price}';	
                	}
                    document.reservForm.roomPrice.value = price;                       
                }
            } else {
            	price = Math.floor(basicPrice * 1.1);
            	if('${param.price}' !== '') {
               		price = '${param.price}';	
            	}
                document.reservForm.roomPrice.value = price;
            }            

            document.getElementById('hotelName').value = 
            (document.reservForm.hotelCode.value === '10' ? 'WY호텔 서울' : (document.reservForm.hotelCode.value === '20' ? 'WY호텔 부산' : 'WY호텔 제주'));

            


            const hotelname = $('#hotelName').val();
            const roomgrade = $('#roomGrade').val();

            console.log(price);
            console.log(hotelname);
            console.log(roomgrade);


            // 결제 및 예약확정 버튼 클릭이벤트 시작
            $('#paymentsBtn').click(function(){
                
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
                        
                        memEmail = $('#email').val();
                        memName = $('#name').val();
                        const tel = $('#phone1').val() + '-' + $('#phone2').val() + '-' + $('#phone3').val();

                        const data = {
                            'email' : memEmail,
                            'name' : memName,
                            'tel' : tel
                        };

                        $.ajax({
                            type: 'POST',
                            url : '${pageContext.request.contextPath}/reservation/createNmemCode',
                            contentType: 'application/JSON',
                            data: JSON.stringify(data),
                            success: function(result) {
                                memCode = result;
                                $('#memberCode').val(memCode);
                                console.log('memberCode: ', $('#memberCode').val());
                            } 
                        });
                        setTimeout(() => {
                            console.log('memCode before purchase: ',$('#memberCode').val());
                            if (confirm('위의 내용대로 예약을 진행하시겠습니까?')){
                                const clientKey = '${key}';
                                const tossPayments = TossPayments(clientKey);
                                console.log('비회원예약 멤버코드', memCode);
                                console.log('비회원예약 이름', memName);
                                console.log('비회원예약 이메일', memEmail);
                                console.log('price ', price);
                                
                                tossPayments.requestPayment('CARD', {
                                    amount : price,
                                    orderId: memCode + new Date().getTime(),
                                    orderName: roomgrade,
                                    customerName: memName,
                                    customerEmail: memEmail,
                                    successUrl: 'http://localhost/${pageContext.request.contextPath}/reservation/success?memberCode=' + $('#memberCode').val()
                                    + '&hotelCode=' + '${reservation.hotelCode}'+ '&roomCode=' + '${reservation.code}'+ '&capacity=' + '${reservation.capacity}'
                                    + '&cInDate=' + checkInDate + '&cOutDate=' + checkOutDate + '&pointAccumulate=' + accumulatePoint,
                                    failUrl: 'http://localhost/${pageContext.request.contextPath}/reservation/reservationPage'
                                });
                            }
                            
                            
                        }, 500);
                        
                    } else {
                        memCode = '${member}';
                        $('#memberCode').val(memCode);
                        console.log(memCode);
                        $.ajax({
                            type: 'POST',
                            url : '${pageContext.request.contextPath}/reservation/getMemberInfo',
                            contentType: 'application/JSON',
                            data: memCode,
                            success: function(info){
                                memEmail = info.email;
                                memName = info.name;
                            },
                            error: function() {
                                alert('통신 실패');
                            }
                        });
                        setTimeout(() => {
                            console.log('memCode before purchase: ',$('#memberCode').val());
                            console.log('적립 포인트: ', accumulatePoint);
                            if (confirm('위의 내용대로 예약을 진행하시겠습니까?')){
                                const clientKey = '${key}';
                                const tossPayments = TossPayments(clientKey);
                                console.log('멤버코드 ', memCode);
                                console.log('이름 ', memName);
                                console.log('이메일 ', memEmail);
                                console.log('price ', price);

                                tossPayments.requestPayment('CARD', {
                                    amount : price,
                                    orderId: memCode + new Date().getTime(),
                                    orderName: roomgrade,
                                    customerName: memName,
                                    customerEmail: memEmail,
                                    successUrl: 'http://localhost/${pageContext.request.contextPath}/reservation/success?memberCode=' + $('#memberCode').val()
                                    + '&hotelCode=' + '${reservation.hotelCode}'+ '&roomCode=' + '${reservation.code}'+ '&capacity=' + '${reservation.capacity}'
                                    + '&cInDate=' + checkInDate + '&cOutDate=' + checkOutDate + '&pointAccumulate=' + accumulatePoint,
                                    failUrl: 'http://localhost/${pageContext.request.contextPath}/reservation/reservationPage'
                                });
                            }  
                            
                        }, 500);
                    }

                } else {
                    console.log('memCode before purchase: ',$('#memberCode').val());
                    console.log('적립 포인트: ', accumulatePoint);
                    if (confirm('위의 내용대로 예약을 진행하시겠습니까?')){
                        const clientKey = '${key}';
                        const tossPayments = TossPayments(clientKey);
                        console.log('멤버코드 ', memCode);
                        console.log('이름 ', memName);
                        console.log('이메일 ', memEmail);
                        console.log('price ', price);

                        tossPayments.requestPayment('CARD', {
                            amount : price,
                            orderId: memCode + new Date().getTime(),
                            orderName: roomgrade,
                            customerName: memName,
                            customerEmail: memEmail,
                            successUrl: 'http://localhost/${pageContext.request.contextPath}/reservation/success?memberCode=' + $('#memberCode').val()
                            + '&hotelCode=' + '${reservation.hotelCode}'+ '&roomCode=' + '${reservation.code}'+ '&capacity=' + '${reservation.capacity}'
                            + '&cInDate=' + checkInDate + '&cOutDate=' + checkOutDate + '&pointAccumulate=' + accumulatePoint,
                            failUrl: 'http://localhost/${pageContext.request.contextPath}/reservation/reservationPage'
                        });
                    }
                            
                }


                
            }); // 결제 및 예약확정 버튼 클릭이벤트 끝






        } else {
            document.getElementById('hotelName').value = 
            (document.reservForm.hotelCode.value === '10' ? 'WY호텔 서울' : (document.reservForm.hotelCode.value === '20' ? 'WY호텔 부산' : 'WY호텔 제주'));
            const daterange = '${reservation.daterange}';
            document.reservForm.strDate.value = daterange;


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


            } else {
                $('#memberCode').val(memCode);
                if (confirm('위의 내용대로 예약하시겠습니까?')){
                    $('#reservForm').attr('action', '${pageContext.request.contextPath}/reservation/roomReserv');
                    $('#reservForm').submit();
                }
            }



            }); // 다이닝 예약확정 종료
            
        }



        
    }); // end jQuery
    
</script>

<%@ include file="../include/footer.jsp" %>