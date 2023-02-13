<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="../include/header.jsp" %>
<spring:eval expression="@tossProperties['toss.key']" var="key" />
<script src="https://js.tosspayments.com/v1/payment"></script>
<style>
    #reservTitleSpan {font-weight: 500;}

</style>

<section class="container posi">

<h2 id="reservTitle" class="text-center mb-5"><span id="reservTitleSpan"></span><small id="isMember"></small></h2>
<form action="#" method="post" id="reservForm" name="reservForm" class="hotelForm">
    
    <div class="row">
        
        <!-- 예약자 정보 (비회원) -->
        <c:if test="${member == null}">
            <div class="col-md-2"></div>
            <div class="col-md-3">이메일</div>
            <div class="col-md-5 mb-3">
                <div class="input-group">
                <input type="text" id="email" class="form-control" name="email" placeholder="example@example.com">
                <div class="input-group-append">
                    <button class="btn btn-dark" type="button" id="button-addon" disabled>인증</button>
                </div>
                </div>
            </div>
            <div class="col-md-2"></div>

            <div class="col-md-2"></div>
            <div class="col-md-3"><div class="check-label">인증번호</div></div>
            <div class="col-md-5 mb-3">
                <div class="input-group">
                <input id="mail-check-input" type="text" class="form-control" 
                    placeholder="인증번호를 6자리를 입력해 주세요." 
                    style="display: inline-block; width: 300px;" readonly>
                <div class="input-group-append">
                    <button type="button" id="number-check" class="btn btn-dark">확인</button>
                </div>
                <span id="mail-check-warn"></span>
                </div>
            </div>
            <div class="col-md-2"></div>
            

            <div class="col-md-2"></div>
            <div class="col-md-3">이름</div>
            <div class="col-md-5 mb-3">
                <input type="text" id="name" class="form-control" name="name" placeholder="홍길동">
            </div>
            <div class="col-md-2"></div>

            <div class="col-md-2"></div>
            <div class="col-md-3">전화번호</div>
            <div class="col-md-5 mb-3">
                <div class="d-inline-flex">
                    <select id="phone1" class="form-select" name="phone1">
                        <option>010</option>
                        <option>011</option>
                        <option>018</option>
                    </select>
                    <span class="mt-2 px-2"> - </span>
                    <input type="tel" id="phone2" class="form-control" name="phone2" maxlength="4" placeholder="0000" id="inputDefault" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> 
                    <span class="mt-2 px-2"> - </span>
                    <input type="tel" id="phone3" class="form-control" name="phone3" maxlength="4" placeholder="0000" id="inputDefault" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> 
                </div>
            </div>
            <div class="col-md-2"></div>
        </c:if>

        <input type="hidden" id="memberCode" name="memberCode" value="">

        <!-- 1그룹 -->
        <div class="col-md-2"></div>
        <div class="col-md-3">예약지점</div>
        <div class="col-md-5 mb-3">
            <input type="hidden" value="${reservation.hotelCode}" name="hotelCode" id="hotelCode" readonly>
            <input type="text" class="form-control" id="hotelName" value="" readonly>
        </div>
        <div class="col-md-2"></div>
        <!-- 1그룹 끝 -->
        
        <!-- 2그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">객실</div>
            <div class="col-md-5 mb-3">
                <input type="hidden" value="${reservation.code}" name="roomCode" id="roomCode" readonly>
                <input type="text" class="form-control" id="roomGrade" value="" readonly>
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">다이닝선택</div>
            <div class="col-md-5 mb-3">
                <select class="form-select" aria-label="Default select example" name="resCode" readonly>
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
            <div class="col-md-5 mb-3">
                <input type="text" class="form-control" name="capacity" value="${reservation.capacity}" readonly>
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">인원</div>
            <div class="col-md-5 mb-3">
                <input type="text" class="form-control" name="reservationAmount" value="${reservation.capacity}" readonly>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 3그룹 끝 -->

        <!-- 4그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">체크인</div>
            <div class="col-md-5 mb-3">
                <input type="date" value="" class="form-control" name="checkInDate" readonly>
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">예약일</div>
            <div class="col-md-5 mb-3">
                <input type="text" value="" class="form-control" name="strDate" readonly>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 4그룹 끝 -->

        <!-- 5그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">체크아웃</div>
            <div class="col-md-5 mb-3">
                <input type="text" value="" class="form-control" name="checkOutDate" readonly>
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">예약시간</div>
            <div class="col-md-5 mb-3">
                <input type="text" value="${reservation.reservationTime}" class="form-control" name="reservationTime" readonly>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 5그룹 끝 -->

        <!-- 5그룹 -->
        <div class="col-md-2"></div>
        <c:if test="${param.category == 'hotels'}">
            <div class="col-md-3">투숙일</div>
            <div class="col-md-5 mb-3">
                <input type="text" value="" class="form-control" name="nights" readonly>
            </div>
        </c:if>
        <c:if test="${param.category == 'dinings'}">
            <div class="col-md-3">요청사항</div>
            <div class="col-md-5 mb-3">
                <textarea name="reservationRequest" class="form-control"></textarea>
            </div>
        </c:if>
        <div class="col-md-2"></div>
        <!-- 5그룹 끝 -->

        <c:if test="${param.category == 'hotels'}">
            <!-- 6그룹 -->
            <div class="col-md-2"></div>
            <div class="col-md-3">가격<small>(* VAT를 포함한 가격입니다.)</small></div>
            <div class="col-md-5 mb-3">
                <input type="text" value="" class="form-control" name="roomPrice" id="roomPrice" readonly>
            </div>
            <div class="col-md-2"></div>
            <!-- 6그룹 끝 -->

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



    $(document).ready(function(){

        $('#reservTitleSpan').text(('${reservation.category}' === 'dinings' ? '다이닝 예약 선택사항 확인' : '호텔 예약 선택사항 확인'));
        $('#isMember').text(('${member}' === '' ? '(비회원 예약)' : '(회원 예약)'));

        var memCode = '';
        let memName = '';
        let memEmail = '';
        let price;
  
        let code = '';
		$('#mail-check-input').hide();
		$('#mail-check-input').next().hide();
        $('.check-label').hide();
        // 약관동의시 로그인 폼 나오게 설정

	    //이메일 양식 유효성 검사.
	    if('${member}' === '') {
	    	
	    	var id = document.getElementById("email");
		    id.onkeyup = function() {
		    	/*자바스크립트의 정규표현식 입니다*/
		    	/*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
		    	var regex =/[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
		    	if (regex.test(document.getElementById("email").value)) {
		    		document.getElementById("email").style.borderColor = "black";
		    		$('#button-addon').attr('disabled', false);
		    	} else {
		    		document.getElementById("email").style.borderColor = "red";
		    		$('#button-addon').attr('disabled', true);
		    	}
		    }//이메일 양식 유효성 검사 끝

	    	//인증번호 이메일 전송
			$('#button-addon').click(function() {
	            const email = $('#email').val();
				console.log('완성된 이메일: ' + email);
				$.ajax({
					type : 'post',
					url : '<c:url value="/member/mailCheck"/>',
					contentType : 'application/json',
					data : email,
					success : function(data) {
						$('#msgId').hide();
						console.log('컨트롤러가 전달한 인증번호: ' + data);
						$('#mail-check-input').attr('readonly', false); //비활성된 인증번호 입력창을 활성화.
						code = data;
						$('#mail-check-input').show();
						$('#mail-check-input').next().show();
	                    $('.check-label').show();
						alert('인증번호가 전송되었습니다. 확인 후 입력란에 정확하게 입력하세요!');
					}
				});
				
			}); //이메일 전송 끝.
			
			// 이메일 인증번호 확인
			 $('#number-check').click(

					function() {
						const inputCode = $('#mail-check-input').val(); // 사용자가 입력한 인증번호
						const $resultMsg = $('#mail-check-warn'); // span

						if (inputCode === code) {
							$resultMsg.html('인증되었습니다');
							$resultMsg.css('color', 'green');
							$('#email').next().hide();
							$(this).css('display', 'none');
							$('#mail-check-input').hide();
							$('#button-addon').css('display', 'none');
	                        $('.check-label').hide();
							$('.hideForm').show();
							$('#email').attr('readonly', true);
							
						} else { 
							$resultMsg.html('인증번호를 다시 확인해 주세요.');
							$resultMsg.css('color', 'red');
							$(this).focus();
						}
						
			}); //인증번호 이벤트 끝.
	    	
	    }
	    	


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
                    basicPrice = 1500000 * nights;
                    break;
                case '44' :
                    document.getElementById('roomGrade').value = 'Business Deluxe';
                    basicPrice = 1000000 * nights;
                    break;
                case '33' :
                    document.getElementById('roomGrade').value = 'Business';
                    basicPrice = 800000 * nights;
                    break;
                case '22' :
                    document.getElementById('roomGrade').value = 'Standard Deluxe';
                    basicPrice = 600000 * nights;
                    break;
                case '11' :
                    document.getElementById('roomGrade').value = 'Standard';
                    basicPrice = 500000 * nights;
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
                                    accumulatePoint = price * membership.pointAccumulate;
                                    console.log('적립 포인트: ', accumulatePoint);
                                	console.log(price);
                                	const priceDisplay = price.toLocaleString();
                                    document.reservForm.roomPrice.value = priceDisplay;
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
                    const priceDisplay = price.toLocaleString();
                    document.reservForm.roomPrice.value = priceDisplay;                    
                }
            } else {
            	price = Math.floor(basicPrice * 1.1);
            	if('${param.price}' !== '') {
               		price = '${param.price}';	
            	}
                const priceDisplay = price.toLocaleString();
                document.reservForm.roomPrice.value = priceDisplay;
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
                        } else if ($('#mail-check-warn').html() !== '인증되었습니다') {
                            alert('이메일 인증을 먼저 진행해주세요');
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
                                    successUrl: 'http://wyhotel.site/reservation/success?memberCode=' + $('#memberCode').val()
                                    + '&hotelCode=' + '${reservation.hotelCode}'+ '&roomCode=' + '${reservation.code}'+ '&capacity=' + '${reservation.capacity}'
                                    + '&cInDate=' + checkInDate + '&cOutDate=' + checkOutDate + '&pointAccumulate=' + accumulatePoint,
                                    failUrl: 'http://wyhotel.site/reservation/reservationPage'
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
                                    successUrl: 'http://wyhotel.site/reservation/success?memberCode=' + $('#memberCode').val()
                                    + '&hotelCode=' + '${reservation.hotelCode}'+ '&roomCode=' + '${reservation.code}'+ '&capacity=' + '${reservation.capacity}'
                                    + '&cInDate=' + checkInDate + '&cOutDate=' + checkOutDate + '&pointAccumulate=' + accumulatePoint,
                                    failUrl: 'http://wyhotel.site/reservation/reservationPage'                                });
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
                            successUrl: 'http://wyhotel.site/reservation/success?memberCode=' + $('#memberCode').val()
                            + '&hotelCode=' + '${reservation.hotelCode}'+ '&roomCode=' + '${reservation.code}'+ '&capacity=' + '${reservation.capacity}'
                            + '&cInDate=' + checkInDate + '&cOutDate=' + checkOutDate + '&pointAccumulate=' + accumulatePoint,
                            failUrl: 'http://wyhotel.site/reservation/reservationPage'
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
                    } else if ($('#mail-check-warn').html() !== '인증되었습니다') {
                        alert('이메일 인증을 먼저 진행해주세요');
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