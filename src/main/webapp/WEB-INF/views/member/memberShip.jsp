<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <spring:eval expression="@tossProperties['toss.key']" var="key" />
    <script src="https://js.tosspayments.com/v1/payment"></script>  
	
	<%@ include file="../include/header.jsp"%>
	
    <style>

        #membershipModalGrade > .detail-main-img {
            padding-left: 0px;
            margin: 0 auto;
            text-align: center;
        }
        
    </style>
    
	<!-- 메인영역 각자 할꺼 여기서 부터 적으세용 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="member-ship clearfix">
                    <div class="memShip-information float-start">
                        <span>멤버쉽</span>
                        <p class="memShip-p">회원님이 보유한 멤버쉽 해택 정보 를 확인할 수 있습니다</p>
                        <div class="memShip-use" >
                            <p>회원 포인트 <a href="#" class="float-end" style="text-decoration: none; color: black;">${info.point}점</a></p> 
                        </div>
                    </div>
                    <div class="memShip-member float-end">
                        <p><strong>${info.name}님 환영합니다.</strong></p>
                        <div class="memShip-grade">
                            <p id="grade" class="brown"></p>
                            <img src="${pageContext.request.contextPath}/img/rank_${info.grade}.svg" alt="#">
                        </div>
                    </div>
                </div>
                <div class="point">
                    <div class="point-content">
                        <span>POINT &nbsp; ACCUMULATE</span>
                        <p>최종 결제 금액 기준 기본 객실 3%, 다이닝 1% 적립이 되며, 회원 등급에 따라 포인트가 차등 적립 됩니다</p>
                    </div>
                    <div class="point-introduce">
                        <div class="clearfix point-block">
                            <div class="float-star point-block-1">
                                <i class="xi-crown"></i>
                                <p>라운드 시설 이용</p>
                            </div>
                            <div class="float-start point-block-2">
                                <i class="xi-coupon"></i>
                                <p>쿠폰혜택</p>
                            </div>
                            <div class="float-start point-block-2">
                                <i class="xi-trophy"></i>
                                <p>등급별 포인트</p>
                            </div>
                            <div class="float-start point-block-2">
                                <i class="xi-gift-o"></i>
                                <p>생일 쿠폰</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="memberShip-grades">
                    <div class="memberShip-member">
                        <span>POINT &nbsp; ACCUMULATE</span>
                        <p>멤버십 회원 등급에 따라 포인트가 차등 적립됩니다</p>
                    </div>
                    <div class="memberShip-introduce">
                        <div class="clearfix memberShip-block">
                            <div class="float-start memberShip-block-1 pt-5" data-grade="rank_diamond">
                                <p class="diamond">DIAMOND</p>
                                <img src="${pageContext.request.contextPath}/img/rank_diamond.svg" alt="#">
                                <div class="memberShip-content">
                                    <p>객실 할인 <b>35%</b></p>
                                    <hr class="w-75 mx-auto">
                                    <p><b>포인트 적립</b></p>
                                    <p>객실 <b>10%</b></p>
                                    <p>다이닝 <b>10%</b></p>
                                    <hr class="w-75 mx-auto">
                                    <p><i>4,500,000</i> <small>KRW</small></p>
                                </div>
                            </div>
                            <div class="float-start memberShip-block-2 pt-5" data-grade="rank_gold">
                                <p class="gold">GOLD</p>
                                <img src="${pageContext.request.contextPath}/img/rank_gold.svg" alt="#">
                                <div class="memberShip-content">
                                    <p>객실 할인 <b>25%</b></p>
                                    <hr class="w-75 mx-auto">
                                    <p><b>포인트 적립</b></p>
                                    <p>객실 <b>8%</b></p>
                                    <p>다이닝 <b>10%</b></p>
                                    <hr class="w-75 mx-auto">
                                    <p><i>3,500,000</i> <small>KRW</small></p>
                                </div>
                            </div>
                            <div class="float-start memberShip-block-2 pt-5" data-grade="rank_silver">
                                <p class="silver">SILVER</p>
                                <img src="${pageContext.request.contextPath}/img/rank_silver.svg" alt="#">
                                <div class="memberShip-content">
                                    <p>객실 할인 <b>15%</b></p>
                                    <hr class="w-75 mx-auto">
                                    <p><b>포인트 적립</b></p>
                                    <p>객실 <b>5%</b></p>
                                    <p>다이닝 <b>5%</b></p>
                                    <hr class="w-75 mx-auto">
                                    <p><i>2,500,000</i> <small>KRW</small></p>
                                </div>
                            </div>
                            <div class="float-start memberShip-block-2 pt-5" id="bronzeGrade" data-grade="rank_bronze">
                                <p class="brown">BRONZE</p>
                                <img src="${pageContext.request.contextPath}/img/rank_bronze.svg" alt="#">
                                <div class="memberShip-content">
                                    <p>객실 할인 <b>-</b></p>
                                    <hr class="w-75 mx-auto">
                                    <p><b>포인트 적립</b></p>
                                    <p>객실 <b></b></p>
                                    <p>다이닝 <b>-</b></p>
                                    <hr class="w-75 mx-auto">
                                    <p><i>일반 회원입니다</i> <small></small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="./membershipDetailModal.jsp" %>
    
    <script>

        // jQuery 시작
        $(document).ready(function(){
            $('#grade').text('${info.grade}'.toUpperCase());

            let grade = '';

            // 모달 열기 이벤트
            $('.memberShip-block').on('click', 'div[data-grade*=rank]', function() {
                grade = $(this).data('grade').substring($(this).data('grade').indexOf('_') + 1);
                $('.detail-main-img > img').attr('src', '${pageContext.request.contextPath}/resources/img/rank_' + grade + '.svg');
                
                $.ajax({
                    type: 'POST',
                    url : '${pageContext.request.contextPath}/member/getMembershipInfo',
                    contentType: 'application/JSON',
                    data: grade,
                    success: function(detail){
                        $('#modalGrade').text(detail.grade.toUpperCase());
                        $('#dc').text(detail.dcPercent * 100 + '%');
                        $('#acRoom').text(detail.pointAccumulate * 100 + '%');
                        $('#acDining').text(detail.pointDining*100 + '%');
                        $('#membershipPrice').text(detail.price);
                        if (grade === 'bronze') {
                            $('#purchaseBtn').attr('disabled', true);
                            $('#purchaseBtn').addClass('visually-hidden');
                        } else {
                            $('#purchaseBtn').attr('disabled', false);
                            $('#purchaseBtn').removeClass('visually-hidden');
                        }
                        $('#membershipDetailModal').modal('show');
                    },
                    error: function(){
                        alert('통신 실패');
                    }
                });
            }); // 모달 열기 종료



            // 구매버튼 클릭 이벤트
            $('#purchaseBtn').click(function(){
                const membership = ['bronze', 'silver', 'gold', 'diamond'];
                if (grade === '') {
                    alert('멤버십을 먼저 선택하세요');
                    return;
                } else if (confirm(grade.toUpperCase() + ' 멤버십을 구매하시겠습니까?')){
                    if (membership.indexOf('${info.grade}') > membership.indexOf(grade)) {
                        alert('회원님의 현재 멤버십보다 낮은 등급의 멤버십입니다.');
                        return;
                    } else if (membership.indexOf('${info.grade}') === membership.indexOf(grade)) {
                        alert('회원님께 현재 적용중인 멤버십입니다.');
                        return;
                    } else {
                        const clientKey = '${key}';
                        const tossPayments = TossPayments(clientKey)
                        tossPayments.requestPayment('CARD', {
                            amount : $('#membershipPrice').text(),
                            orderId: '${info.memberCode}' + new Date().getTime(),
                            orderName: grade.toUpperCase(),
                            customerName: '${info.name}',
                            customerEmail: '${info.email}',
                            successUrl: 'http://localhost/${pageContext.request.contextPath}/member/membershipPurchase?memberCode=' + '${info.memberCode}' + '&grade=' + grade,
                            failUrl: 'http://localhost/${pageContext.request.contextPath}/member/memberShip'
                        });
                    }
                }
                
            }); // 구매버튼 클릭 이벤트 종료
            
            
        }); // end jQuery
        
    </script>

    <%@ include file="../include/footer.jsp"%>
    