<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%@ include file="./include/headtwo.jsp" %>

<style>
	input[name="daterange"] {
            text-align: center;
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
                        <a href="#">Show More</a>
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
                        <a href="#">Show More</a>
                    </div>
                </div>
                <div class="dining-1">
                    <img src="${pageContext.request.contextPath}/img/hotel-g080e39db0_1920.jpg" alt="#">
                </div>
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
                    <div class="swiper-slide">
                        <div class="card" style="width: 22rem;">
                            <img src="${pageContext.request.contextPath}/img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card" style="width: 22rem;">
                            <img src="${pageContext.request.contextPath}/img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card" style="width: 22rem;">
                            <img src="${pageContext.request.contextPath}/img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card" style="width: 22rem;">
                            <img src="${pageContext.request.contextPath}/img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card" style="width: 22rem;">
                            <img src="${pageContext.request.contextPath}/img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card" style="width: 22rem;">
                            <img src="${pageContext.request.contextPath}/img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card" style="width: 22rem;">
                            <img src="${pageContext.request.contextPath}/img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card" style="width: 22rem;">
                            <img src="${pageContext.request.contextPath}/img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="card" style="width: 22rem;">
                            <img src="${pageContext.request.contextPath}/img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">Card title</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>            
            </div>            
        </div> <!-- end promotion -->
    </section> <!-- end main -->


<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script>
    
    	const msg = '${msg}';
    	if(msg === 'logout') {
    		alert('로그아웃 성공');
    	}
    
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 3,
            spaceBetween: 30,
            slidesPerGroup: '${promotionList.size()}'/3,
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

     	// jQuery 시작
        $(function() {

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
                    opens: 'left'
                }, function(start, end, label) {
                    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                });
                $('#time').addClass('visually-hidden');
            } else if ('${param.category}' === 'dinings') {
            	$('input[name="daterange"]').daterangepicker({
                    singleDatePicker: true,
                    showDropdowns: true,
                    minYear: today.getFullYear(),
                    maxYear: today.getFullYear() + 1
                }, function(start, end, label) {
                    console.log("Picked date is " + start.format('YYYY-MM-DD'));
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
                        minYear: today.getFullYear(),
                        maxYear: today.getFullYear() + 1
                    }, function(start, end, label) {
                        console.log("Picked date is " + start.format('YYYY-MM-DD'));
                    });
                    $('#time').removeClass('visually-hidden');
                } else if($(this).val() === 'hotels') {
                    $('input[name="daterange"]').attr('readonly', false);
                    $('input[name="daterange"]').val(month.toString() + '/' + day.toString() + '/' + year.toString() + ' - ' + endMonth.toString() + '/' + endDay.toString() + '/' + endYear.toString());
                    $('input[name="daterange"]').daterangepicker({
                        opens: 'left'
                    }, function(start, end, label) {
                        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                    });
                    $('#time').addClass('visually-hidden');
                } else {
                    $('input[name="daterange"]').attr('readonly', true);
                    $('input[name="daterange"]').val('카테고리를 먼저 선택하세요');
                    $('#time').addClass('visually-hidden');
                }
            }); // hotel/dining select event end


            // reservBtn 클릭 이벤트
            $('#reservBtn').click(function(){
                $('#reservForm').submit();
            });


        }); // jQuery 종료


    </script>

	<%@ include file="./include/footwo.jsp" %> 
