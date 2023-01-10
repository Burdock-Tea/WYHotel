<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--modal-->
    <div id="membershipDetailModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header position-relative">
                    <h2 class="room-detail-modal-title">멤버십 상세정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                
                    <div class="room-reserv-modal-wrapper">

                        <div class="row">

                            <!-- 이미지 영역 -->
                            <div class="col-md-5" >

                                <div class="row detail-imgs" id="membershipModalGrade">

                                    <div class="col-md-12 detail-main-img">
                                        <img src="" alt="">
                                    </div>
                                    
                                </div>
                                
                            </div>

                            <!-- 설명 영역 -->
                            <div class="col-md-7 room-discription position-relative">

                                <div class="row">

                                    <h3 id="modalGrade" class="col-md-12"></h3>

                                    <p class="col-md-12 mt-2">Discount for Members</p>
                                    <p class="col-md-6">객실 할인률</p>
                                    <p class="col-md-6" id="dc"></p>
                                    <hr>
                                    <p class="col-md-12 mt-2">Point Accumulations</p>
                                    <p class="col-md-6">객실 예약시</p>
                                    <p class="col-md-6" id="acRoom"></p>
                                    <p class="col-md-6">다이닝 예약시</p>
                                    <p class="col-md-6" id="acDining"></p>
                                    <hr>
                                    <p class="col-md-12 mt-2">Membership Price</p>
                                    <p class="col-md-6">krw</p>
                                    <p class="col-md-6" id="membershipPrice"></p>



                                    <div id="modalRoomPrice" class="col-md-6 mt-2"></div>
                                    <div id="modalReservation" class="col-md-6 mt-2">
                                        <button class="btn btn-dark" id="purchaseBtn">멤버십 구매</button>
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