<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%@ include file="./include/header.jsp" %>

<style>
	input[name="daterange"] {
            text-align: center;
    }
</style>

<section class="main"> <!-- start main -->
	<div class="wrapper"> <!-- start video -->
		<section class="hero">
			<div class="heading">
				<p>
					늘 말로만 얘기하는 부산 풀코스를 WY호텔에서!!
				</p>
			</div>
			<video src="img/main.mp4" autoplay muted loop poster="img/hotel-g080e39db0_1920.jpg"></video>
		</section>
	</div> <!-- end video -->

	<div class="container wrapper"> <!-- start fastreservations -->
		<h3>빠른예약</h3>
		<form action="${pageContext.request.contextPath}/reservation/reservationPage" method="post" id="reservForm">
			<table class="table">
				<thead>
					<tr>
						<td>
							<select class="form-select" aria-label="Default select example" name="category">
								<option>호텔 / 다이닝 선택</option>
								<option value="hotels">호텔</option>
								<option value="dinings">다이닝</option>
							</select>
						</td>
						<td>
							<select class="form-select" aria-label="Default select example" name="hotelCode">
								<option>지점선택</option>
								<option value="10">서울WY호텔</option>
								<option value="20">부산WY호텔</option>
								<option value="30">제주WY호텔</option>
							</select>
						</td>
						<td>
							<select class="form-select" aria-label="Default select example" name="capacity">
								<option>인원수</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</td>
						<!-- 연령대 삭제, 다이닝 예약 선택시 시간대로 변경  22/12/30 -->
                        <td class="" id="time">
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
                        </td>
						<td>
							<input type="text" name="daterange" value="카테고리를 먼저 선택하세요" class="form-control"/>
						</td>
						<td>
							<button type="button" class="btn btn-dark" id="reservBtn">검색</button>
						</td>
					</tr>
				</thead>
			</table>
		</form> <!-- end form tag-->
	</div><!-- end fastreservations -->

	<div class="container wrapper"><!-- start promotion -->
		<h3>프로모션</h3>
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="card" style="width: 22rem;">
						<img src="./img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
						<div class="card-body">
						  <h5 class="card-title">Card title</h5>
						  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  <a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card" style="width: 22rem;">
						<img src="./img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
						<div class="card-body">
						  <h5 class="card-title">Card title</h5>
						  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  <a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card" style="width: 22rem;">
						<img src="./img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
						<div class="card-body">
						  <h5 class="card-title">Card title</h5>
						  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  <a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card" style="width: 22rem;">
						<img src="./img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
						<div class="card-body">
						  <h5 class="card-title">Card title</h5>
						  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  <a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card" style="width: 22rem;">
						<img src="./img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
						<div class="card-body">
						  <h5 class="card-title">Card title</h5>
						  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  <a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card" style="width: 22rem;">
						<img src="./img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
						<div class="card-body">
						  <h5 class="card-title">Card title</h5>
						  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  <a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card" style="width: 22rem;">
						<img src="./img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
						<div class="card-body">
						  <h5 class="card-title">Card title</h5>
						  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  <a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card" style="width: 22rem;">
						<img src="./img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
						<div class="card-body">
						  <h5 class="card-title">Card title</h5>
						  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  <a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="card" style="width: 22rem;">
						<img src="./img/apartment-g219363a2e_1920.jpg" class="card-img-top" alt="...">
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
