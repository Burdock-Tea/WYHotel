<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%@ include file="./include/headtwo.jsp" %>

<style>
	input[name="daterange"] {
            text-align: center;
    }
    
    #mainPopup {
        display: block;
        position: fixed;
        border: 5px black solid;
        width: 400px;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        background-color: #fff;
        z-index: 999999;
    }
</style>

<section class="main"> <!-- start main -->
        <div class="container">
            <div class="row">
               <div class="main-introduce" id="main-introduce">
                    <img src="${pageContext.request.contextPath}/img/logo.svg" alt="#" width="150">
                    <p>
                        WY HOTEL is new but has <br> luxurious rooms and delicious dining
                    </p>
               </div>
               <hr>
                <div class="main-room-content" style="text-align: center;">
                    <p class="room">Special Room</p>
                    <p class="room-name">Suite Room</p>
                    <span class="room-content">
                        WYHOTEL에는 최신 유행하는 스타일의 선진적 아름다움이 있습니다. <br>
                      	  머무는 공간마다 시대를 초월하는 클래식의 미학, 최신의 감각을 만족시키는 럭셔리가 조화롭게 공존합니다. <br>
                      	  선별된 가치와 오감을 자극하는 다층적 경험으로 공감각적 아름다움을 이어갑니다.
                    </span>

                    <div class="main-more">
                        <a href="${ pageContext.request.contextPath }/introduce/hotels">Show More</a>
                    </div>
                </div>
                <div class="guest-room">
                    <img src="${pageContext.request.contextPath}/img/to-travel-gb2e60ab1c_1920.jpg" alt="#">
                </div>
                <hr>
                <div class="main-dining-content">
                    <p class="dining">dining</p>
                    <p class="dining-name">존맛탱 다이닝</p>
                    <span class="dining-content">
                        WYHOTEL은, 시대를 대표하는 예술가들과 정치, 경제, 문화적 소양가들은<br>
                        WYHOTEL의 다이닝 공간에서 품격있는 모임과 휴식을 누려왔습니다. WYHOTEL은 우아한<br>
                    	식문화 선도 정신을 이어 미식을 즐기는 방식과 순간의 경험을 진화시킵니다. 최고의 맛이란 수식어로는 충분하지 않습니다.<br>
                       	 오늘의 미식가들을 만족시킬 새롭고 독창적인 파인 다이닝 문화가 펼쳐집니다.
                    </span>
                    <div class="main-more">
                        <a href="${ pageContext.request.contextPath }/reservation/reservationPage">Show More</a>
                    </div>
                </div>
                <div class="dining-1">
                    <img src="${pageContext.request.contextPath}/img/hotel-g080e39db0_1920.jpg" alt="#">
                </div>
            </div>
        </div>
        
        <div id="mainPopup" class="mainPopup" style="display: none;">
            <div class="logo-wrapper mx-2 my-2">
                <img src="${pageContext.request.contextPath}/img/chrome_logo.svg" alt="#">
            </div>
            <br>
            <div class="popupContent text-center">
	            <p>이 페이지는 크롬 브라우저로 최적화가 되어 있습니다.</p>
            </div>
            <div class="text-center mb-3">
                <button class="btn btn-primary" onclick="window.open('https://www.google.co.kr/chrome')">Chrome Download</button>
            </div>
            <div class="form-check">
                <input class="form-check-input ms-1" type="checkbox" value="" id="noShow">
                <label class="form-check-label" for="noShow">오늘 하루 그만 보기</label>
            </div>
        </div>
    
        <hr>
        <div class="container wrapper promotion"><!-- start promotion -->
            <h3>Promotion</h3>
            <span>
                WYHOTEL은, 반분기 단위로 새로운 프로모션을<br>
                진행하고 있습니다. 아래에서 고객님께 해당하는 프로모션을<br>
                찾아 보다 저렴하게 이용 하시기 바랍니다.
            </span>
            <div class="swiper mySwiper" style="margin-top: 50px;">
                <div class="swiper-wrapper">
                	<!-- swiper 내 프로모션 배치 시작 -->
                	<c:forEach items="${ promotionList }" var="list">
                    <div class="swiper-slide">
<<<<<<< HEAD
                        <div class="card" style="width: 22rem;" data-promotion-code="${ list.promotionCode }">
=======
                        <div class="card" style="width: 22rem;">
>>>>>>> 06cb26c48408d6a4da419e554568fcc5be432b48
                            <img src="${pageContext.request.contextPath}/promotion/display?fileLocation=${ list.fileLocation }&fileName=${ list.fileName }" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">${ list.promotionName }</h5>
                              <p class="card-text">${ list.promotionContent }</p>                              
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- swiper 내 프로모션 배치 끝 -->
                </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>            
            </div>            
        </div> <!-- end promotion -->
    </section> <!-- end main -->


<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/js.cookie.min.js"></script>
    <script>
    
    	const msg = '${msg}';
    	if(msg === 'logout') {
    		alert('로그아웃 성공');
    	}
    
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 3,
            spaceBetween: 30,
            slidesPerGroup: 3,
            loop: true,
            loopFillGroupWithBlank: true,
            pagination: {
            el: ".swiper-pagination",
            clickable: true,
            },
            navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
            },
        });

        function isBrowserCheck(){ 
        	const agent = window.navigator.userAgent.toLowerCase();
    		let browserName;
    		switch (true) {
    			case agent.indexOf("edge") > -1: 
    				browserName = "MS Edge"; // MS 엣지
    				break;
    			case agent.indexOf("edg/") > -1: 
    				browserName = "Edge (chromium based)"; // 크롬 기반 엣지
    				break;
    			case agent.indexOf("opr") > -1 && !!window.opr: 
    				browserName = "Opera"; // 오페라
    				break;
    			case agent.indexOf("chrome") > -1 && !!window.chrome: 
    				browserName = "Chrome"; // 크롬
    				break;
    			case agent.indexOf("trident") > -1: 
    				browserName = "MS IE"; // 익스플로러
    				break;
    			case agent.indexOf("firefox") > -1: 
    				browserName = "Mozilla Firefox"; // 파이어 폭스
    				break;
    			case agent.indexOf("safari") > -1: 
    				browserName = "Safari"; // 사파리
    				break;
    			default: 
    				browserName = "other"; // 기타
    		}
    		return browserName;
        }

     	// jQuery 시작
        $(function() {
        	
        	// 브라우저 체크, 크롬 브라우저가 아닐 시 해당 로직 실행
        	if(isBrowserCheck() !== 'Chrome') {
        		
                if(Cookies.get('noPopup') !== 'true') { // 쿠키가 없니?

                    // 만약 언어가 한국이 아니면, 비동기 통신 시작   
                    if(window.navigator.language !== 'ko') {

                        const message = $('.popupContent > p').text();
                        const language = window.navigator.language;                    
                        
                        console.log(message);
                        console.log(language);                    

                        const data = {
                            'message': message,
                            'language': language
                        }

                        $.ajax({
                            type: 'post',
                            url: '${pageContext.request.contextPath}/translate',
                            data: JSON.stringify(data),
                            contentType: 'application/json; charset=utf-8',
                            success: function (response) {                        	
                                console.log(response.message.result.translatedText);
                                $('.popupContent > p').text(response.message.result.translatedText);
                            }
                        });
                    }
                    
                    $('#mainPopup').css('display', 'block');
                }

        	}

            // 팝업창 체크박스 클릭시 쿠키 생성 및 팝업창 숨겨주기
            $('#noShow').change(function () {
                if($('#noShow').is(':checked')) {
                    Cookies.set('noPopup', 'true', { expires: 1 });
                    $('#mainPopup').css('display', 'none');
                }
            });

            const today = new Date();
            let month = today.getMonth() + 1;
            let day = today.getDate();
            let year = today.getFullYear();


            // 처음 daterange를 readonly로
            if ('${reservation.category}' === '') {
                $('input[name="daterange"]').attr('readonly', 'true');
                $('#time').addClass('visually-hidden');
            } else if ('${param.category}' === 'hotels') {
                $('input[name="daterange"]').daterangepicker({
                    opens: 'left',
                    minDate: today,
                    maxDate: new Date(Math.floor(today.getTime()/(1000*60*60*24) + 30) * (1000*60*60*24))
                });
                $('#time').addClass('visually-hidden');
            } else if ('${param.category}' === 'dinings') {
            	$('input[name="daterange"]').daterangepicker({
                    singleDatePicker: true,
                    showDropdowns: true,
                    minDate: new Date(Math.floor(today.getTime()/(1000*60*60*24) + 1) * (1000*60*60*24)),
                    maxDate: new Date(Math.floor(today.getTime()/(1000*60*60*24) + 30) * (1000*60*60*24))
                });
                $('#time').removeClass('visually-hidden');
            }

            // hotel/dining select event begin
            $('select[name="category"]').change(function(){


                let endDay;
                let endMoth;
                let endYear;
                let isLeapYear = false;

                // 윤년 판별
                if ((year%4 === 0 && year%100 !== 0) || year%400 === 0)
                    isLeapYear = true;

                switch (month + 1) {
                    case 2 :
                        endDay = (day + 1 > (isLeapYear ? 29 : 28) ? 1 : day + 1);
                        if (endDay > day){
                            endMonth = month;
                            endYear = year;
                        } else {
                            endMonth = (month + 1 > 12 ? 1 : month + 1);
                            if (endMonth < month) endYear = year + 1;
                            else endYear = year;
                        }
                        break;
                    case 4, 6, 9, 11 :
                        endDay = (day + 1 > 30 ? 1 : day + 1);
                        if (endDay > day){
                            endMonth = month;
                            endYear = year;
                        } else {
                            endMonth = (month + 1 > 12 ? 1 : month + 1);
                            if (endMonth < month) endYear = year + 1;
                            else endYear = year;
                        }
                        break;
                    default :
                        endDay = (day + 1 > 31 ? 1 : day + 1);
                        if (endDay > day){
                            endMonth = month;
                            endYear = year;
                        } else {
                            endMonth = (month + 1 > 12 ? 1 : month + 1);
                            if (endMonth < month) endYear = year + 1;
                            else endYear = year;
                        }
                        break;
                }
                


                // 선언한 변수로 데이터레인지피커 밸류 수정
                if ($(this).val() === 'dinings') {
                    $('input[name="daterange"]').attr('readonly', false);
                    $('input[name="daterange"]').val(endMonth.toString() + '/' + endDay.toString() + '/' + endYear.toString());
                    $('input[name="daterange"]').daterangepicker({
                        singleDatePicker: true,
                        showDropdowns: true,
                        minDate: new Date(Math.floor(today.getTime()/(1000*60*60*24) + 1) * (1000*60*60*24)),
                        maxDate: new Date(Math.floor(today.getTime()/(1000*60*60*24) + 30) * (1000*60*60*24))
                    });
                    $('#time').removeClass('visually-hidden');
                } else if($(this).val() === 'hotels') {
                    $('input[name="daterange"]').attr('readonly', false);
                    $('input[name="daterange"]').val(month.toString() + '/' + day.toString() + '/' + year.toString() + ' - ' + endMonth.toString() + '/' + endDay.toString() + '/' + endYear.toString());
                    $('input[name="daterange"]').daterangepicker({
                        opens: 'left',
                        minDate: today,
                        maxDate: new Date(Math.floor(today.getTime()/(1000*60*60*24) + 30) * (1000*60*60*24))
                    });
                    $('#time').addClass('visually-hidden');
                } else {
                    $('input[name="daterange"]').attr('readonly', true);
                    $('input[name="daterange"]').val('카테고리를 먼저 선택하세요');
                    $('#time').addClass('visually-hidden');
                }
            }); // hotel/dining select event end


            // reservBtn 클릭 이벤트
            $('#reservBtn').click(function(e){
                // 입력값 검증
                if (document.reservForm.category.value === '호텔 / 다이닝 선택') {
                    alert('호텔 또는 다이닝을 선택해주세요');
                    document.reservForm.category.focus();
                } else if (document.reservForm.hotelCode.value === '지점선택') {
                    alert('지점을 선택해주세요');
                    document.reservForm.hotelCode.focus();
                } else if (document.reservForm.capacity.value === '인원수') {
                    alert('인원수를 선택해주세요');
                    document.reservForm.capacity.focus();
                } else if (document.reservForm.category.value === 'dinings' && document.reservForm.reservationTime.value === '시간선택') {
                    alert('다이닝 예약시간을 선택해주세요');
                    document.reservForm.reservationTime.focus();
                } else {
                    document.reservForm.submit();
                }

            });



            // 객실 상세보기 버튼 클릭 모달 열기 이벤트
            $('#resultTable').on('click', 'a', function(e){
                e.preventDefault();
                console.log('버튼 클릭됨');
                const roomCode = $(this).data('room-code');

                $.getJSON(
                    '${pageContext.request.contextPath}/reservation/roomDetail?roomCode=' + roomCode,
                    function(roomDetail){
                        $('#modalRoomGrade').text(roomDetail.roomGrade);
                        $('#modalRoomInfo').text(roomDetail.roomInfo);
                        $('#modalRoomPrice').text(roomDetail.roomPrice + ' KRW / night');
                        $('#roomDetailModal').modal('show');
                    }
                );
            }); // 모달 열기 종료


            // 예약 페이지 이동
            $('#resultTable').on('click', 'button', function(){

                if (document.reservForm.category.value === 'hotels')
                    $('#code').val($(this).data('room-code'));
                else if(document.reservForm.category.value === 'dinings')
                    $('#code').val($(this).data('res-code'));
                console.log($('#code').val());
                console.log(document.reservForm.category.value);

                // 입력값 검증
                if (document.reservForm.category.value === '호텔 / 다이닝 선택') {
                    alert('호텔 또는 다이닝을 선택해주세요');
                    document.reservForm.category.focus();
                } else if (document.reservForm.hotelCode.value === '지점선택') {
                    alert('지점을 선택해주세요');
                    document.reservForm.hotelCode.focus();
                } else if (document.reservForm.capacity.value === '인원수') {
                    alert('인원수를 선택해주세요');
                    document.reservForm.capacity.focus();
                } else if (document.reservForm.category.value === 'dinings' && document.reservForm.reservationTime.value === '시간선택') {
                    alert('다이닝 예약시간을 선택해주세요');
                    document.reservForm.reservationTime.focus();
                } else {
                    document.reservForm.setAttribute('action', '${pageContext.request.contextPath}/reservation/payment');
                    document.reservForm.submit();
                }

            });

            // dateRange 직접 수정 막는 로직
            $('#daterange').keydown(function(e){
                e.preventDefault();
                alert('달력을 통해 날짜를 선택 해주세요');
            });
			
            // 프로모션 리스트 클릭시 이벤트 발생 (페이지)
            $('.swiper-wrapper').on('click', '.swiper-slide .card', function(e) {
            	const promotionCode = $(this).data('promotionCode');
                location.href = '${pageContext.request.contextPath}/promotion/list?promotionCode=' + promotionCode;
            });

        }); // jQuery 종료
        
    </script>

	<%@ include file="./include/footwo.jsp" %> 
