<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ include file="../include/header.jsp"%>
	
	<!-- 메인영역 각자 할꺼 여기서 부터 적으세용 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="member-ship clearfix">
                    <div class="memShip-information float-start">
                        <span>멤버쉽</span>
                        <p class="memShip-p">회원님이 보유한 멤버쉽 해택 정보 를 확인할 수 있습니다</p>
                        <div class="memShip-use" >
                            <p>회원 포인트 <a href="#" class="float-end" style="text-decoration: none; color: black;">0점</a></p> 
                        </div>
                    </div>
                    <div class="memShip-member float-end">
                        <p><strong>회원번호</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 659SDFF54</p>
                        <div class="memShip-grade">
                            <p class="brown">BROWN</p>
                            <img src="${pageContext.request.contextPath}/img/rank_brown.svg" alt="#">
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
                        <p>최종 결제 금액 기준 기본 객실 3%, 다이닝 1% 적립이 되며, 회원 등급에 따라 포인트가 차등 적립 됩니다</p>
                    </div>
                    <div class="memberShip-introduce">
                        <div class="clearfix memberShip-block">
                            <div class="float-start memberShip-block-1 pt-5">
                                <p class="brown">BROWN</p>
                                <img src="${pageContext.request.contextPath}/img/rank_brown.svg" alt="#">
                                <div class="memberShip-content">
                                    <p>객실0.3%</p>
                                    <span>다이닝 0.1%</span>
                                </div>
                            </div>
                            <div class="float-start memberShip-block-2 pt-5">
                                <p class="silver">SILVER</p>
                                <img src="${pageContext.request.contextPath}/img/rank_s.svg" alt="#">
                                <div class="memberShip-content">
                                    <p>객실0.3%</p>
                                    <span>다이닝 0.1%</span>
                                </div>
                            </div>
                            <div class="float-start memberShip-block-2 pt-5">
                                <p class="gold">GOLD</p>
                                <img src="${pageContext.request.contextPath}/img/rank_g.svg" alt="#">
                                <div class="memberShip-content">
                                    <p>객실0.3%</p>
                                    <span>다이닝 0.1%</span>
                                </div>
                            </div>
                            <div class="float-start memberShip-block-2 pt-5">
                                <p class="diamond">DIAMOND</p>
                                <img src="${pageContext.request.contextPath}/img/rank_d.svg" alt="#">
                                <div class="memberShip-content">
                                    <p>객실0.3%</p>
                                    <span>다이닝 0.1%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="../include/footer.jsp"%>
    