<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../include/header.jsp" %>
    <style>

        /* reservation page css */
        .reservation-title {
            text-align: center;
            margin: 0 auto;
            padding: 40px 0 30px;
            border-bottom: 1px solid #c8c8c8;
        }

        .reservation-table tr td {
            padding:  20px 0;
        }

        input[name="daterange"] {
            text-align: center;
        }

        .form-control[name="reservationDate"] {text-align: center;}

        #resultRow {
            width: 80%;
            height: 200px;
            margin: 20px auto;
            border-bottom: 1px solid black;
        }

        #resultRow td {
            padding-right: 0;
        }

        #resultDetail .btn {
            display: block;
            width: 20%;
            height: 60px;

            position: absolute;
            bottom: 10px;
            right: 10px;
        }

        .img-container {
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 80%;
            margin: 0 auto;
        }

        #room {
            font-size: 2rem;
            font-weight: 500;
            margin-bottom: 40px;
        }

        #showDetails {
            position: absolute;
            bottom: 0;
            left: 10px;
        }

        #showDetails a {
            text-decoration: none;
            color: inherit;
            font-size: 1.2rem;
            line-height: 2em;
        }

        #price {
            position: absolute;
            bottom: 40%;
            right: 10px;

            font-size: 1.5rem;
            font-weight: 400;
            font-style: italic;
        }



    </style>

    <!-- 예약페이지 시작 -->
    <section class="main"> <!-- start main -->
        <div class="container wrapper"> <!-- start fastreservations -->
            <h3 class="reservation-title">호텔 / 다이닝 예약</h3>
            <form>
                <table class="reservation-table table">
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
                                <input type="text" name="daterange" value="카테고리를 먼저 선택하세요" class="form-control" />
                            </td>
                            <td>
                                <button type="button" class="btn btn-dark">검색</button>
                            </td>
                        </tr>
                    </thead>
                </table>
            </form> <!-- end form tag-->
        </div><!-- end fastreservations -->
        <div class="result-wrapper">
            <table id="resultTable" class="container">
                <tbody>
                    <tr class="row" id="resultRow">
                        <td class="col-sm-12 col-md-4"><div class="img-container"><img src="${pageContext.request.contextPath}/img/bedroom-g34b59e527_1920.jpg" alt=""></div></td>
                        <td class="col-sm-12 col-md-8 position-relative" id="resultDetail">
                            <p id="room">
                                Suite
                            </p>
                            <p id="showDetails">
                                bed: Double(king) only <br>
                                <a href="#">객실 상세정보&ensp;&ensp;<span class="badge bg-dark">+</span></a>
                            </p>
                            <p id="price">
                                670,000 won
                            </p>
                            <button type="button" class="btn btn-dark">예약하기</button>
                        </td>
                    </tr>
                    <tr class="row" id="resultRow">
                        <td class="col-sm-12 col-md-4"><div class="img-container"><img src="${pageContext.request.contextPath}/img/bedroom-g34b59e527_1920.jpg" alt=""></div></td>
                        <td class="col-sm-12 col-md-8 position-relative" id="resultDetail">
                            <p id="room">
                                Business Delux
                            </p>
                            <p id="showDetails">
                                bed: Double(king) only <br>
                                <a href="#">객실 상세정보&ensp;&ensp;<span class="badge bg-dark">+</span></a>
                            </p>
                            <p id="price">
                                570,000 won
                            </p>
                            <button type="button" class="btn btn-dark">예약하기</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        
    </section> <!-- end main -->

    
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script>
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
            
            // 처음 daterange를 readonly로
            $('input[name="daterange"]').attr('readonly', 'true');

            // hotel/dining select event begin
            $('select[name="category"]').change(function(){
                const today = new Date();
                let month = today.getMonth() + 1;
                let day = today.getDate();
                let year = today.getFullYear();

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
                if ($(this).val() === 'dining') {
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
                } else if($(this).val() === 'hotel') {
                    $('input[name="daterange"]').attr('readonly', false);
                    $('input[name="daterange"]').val(month.toString() + '/' + day.toString() + '/' + year.toString() + ' - ' + endMonth.toString() + '/' + endDay.toString() + '/' + endYear.toString());
                    $('input[name="daterange"]').daterangepicker({
                        opens: 'left'
                    }, function(start, end, label) {
                        console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                    });
                } else {
                    $('input[name="daterange"]').attr('readonly', true);
                    $('input[name="daterange"]').val('카테고리를 먼저 선택하세요');
                }
            }); // hotel/dining select event end


        }); // jQuery 종료


        </script>
    
    <%@ include file="../include/footer.jsp" %>
    