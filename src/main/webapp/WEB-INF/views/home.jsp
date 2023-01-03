<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%@ include file="./include/header.jsp" %>


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
		<form>
			<table class="table">
				<thead>
					<tr>
						<td>
							<select class="form-select" aria-label="Default select example" name="category">
								<option>호텔 / 다이닝 선택</option>
								<option value="hotel">호텔</option>
								<option value="dining">다이닝</option>
							</select>
						</td>
						<td>
							<select class="form-select" aria-label="Default select example" name="hotel">
								<option>지점선택</option>
								<option value="seoul">서울WY호텔</option>
								<option value="busan">부산WY호텔</option>
								<option value="jeju">제주WY호텔</option>
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
						<td>
							<select class="form-select" aria-label="Default select example" name="age">
								<option>연령대</option>
								<option value="adult">성인</option>
								<option value="notadult">미성년</option>
							</select>
						</td>
						<td>
							<input type="text" name="daterange" value="01/01/2018 - 01/15/2018" />
						</td>
						<td>
							<button type="button" class="btn btn-dark">검색</button>
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

        $(function() {
            $('input[name="daterange"]').daterangepicker({
                opens: 'left'
            }, function(start, end, label) {
                console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
            });
        });
    </script>

	<%@ include file="./include/footwo.jsp" %>
