<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--modal-->
    <div id="roomDetailModal" class="modal fade">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header position-relative">
                    <h2 class="room-detail-modal-title">객실 상세정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                
                    <div class="room-reserv-modal-wrapper">

                        <div class="row">

                            <!-- 이미지 영역 -->
                            <div class="col-md-5">

                                <div class="row detail-imgs">

                                    <div class="col-md-12 detail-main-img">
                                        <img src="${pageContext.request.contextPath}/resources/img/hotel-room-gb5a07122f_1920.jpg" alt="">
                                    </div>
                                    <div class="col-md-3">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/hotel-room-gb5a07122f_1920.jpg" alt=""></a>
                                    </div>
                                    <div class="col-md-3">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/bedroom-g34b59e527_1920.jpg" alt=""></a>
                                    </div>
                                    <div class="col-md-3">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/bedroom-g8b239c219_1920.jpg" alt=""></a>
                                    </div>
                                    <div class="col-md-3">
                                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/bathroom-g00e6db399_1920.jpg" alt=""></a>
                                    </div>
                                    
                                </div>
                                
                            </div>

                            <!-- 설명 영역 -->
                            <div class="col-md-7 room-discription position-relative">

                                <div class="row">

                                    <h3 id="modalRoomGrade" class="col-md-12"></h3>

                                    <div class="col-md-12">&ensp;</div>
                                    <div class="col-md-12">
                                        <p id="modalRoomInfo">

                                        </p>
                                    </div>

                                    <div id="modalRoomPrice" class="col-md-6"></div>
                                    <div id="modalReservation" class="col-md-6">
                                        <button class="btn btn-dark">예약하기</button>
                                    </div>
                                    
                                </div>
                                
                            </div>
                            
                        </div>
                        
                    </div>

                </div>
              
            </div>
        </div>
    </div>


    <script>

        // begin jQueyry
        $(document).ready(function(){
            // 모달 메인 이미지 변경 이벤트
            $('.detail-imgs').on('click', 'a', function(e){
                e.preventDefault();

                const $mainImg = $('.detail-main-img')[0].children[0];
                $mainImg.src = $(this).children(':first').attr('src');
            }); // 모달 메인이미지 변경 이벤트 종료

            

        }); // end jQuery


    </script>