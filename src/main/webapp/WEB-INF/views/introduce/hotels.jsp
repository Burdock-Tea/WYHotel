<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
       /* font setting */
       *{ font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none;}
       a{ text-decoration: none; color: silver;}

       /* 공통 */
       .posi{padding: 80px 0;}
       .btn { border-radius: 0;}

       /* introduce_hotel */
       .hMenu { list-style: none;}
       .introImg1 {width: 550px;}
       .imgFull { width: 100%; background-size: cover; }
       .intrFont {text-align: justify; line-height: 1.8rem;}

    </style>

</head>
<body>

	<%@ include file="../include/header.jsp" %>
	

    <!-- 오프 캔버스 메뉴 -->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title mt-3 ms-2" id="offcanvasExampleLabel">호텔 소개</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div>
                <ul class="hMenu">
                    <li class="pb-3 fs-5"><a href="#">개요</a></li> 
                    <li class="pb-3 fs-5"><a href="${pageContext.request.contextPath}/introduce/hotels">객실소개</a></li>
                    <li class="pb-3 fs-5"><a href="${pageContext.request.contextPath}/introduce/hotelsSinfo">WY 서울 호텔</a></li>
                    <li class="pb-3 fs-5"><a href="${pageContext.request.contextPath}/introduce/hotelsBinfo">WY 부산 호텔</a></li>
                    <li class="pb-3 fs-5"><a href="${pageContext.request.contextPath}/introduce/hotelsJinfo">WY 제주 호텔</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- 오프캔버스 버튼 -->
    <a class="btn btn btn-dark mb-3" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
        <i class="xi-hamburger-out"></i>
    </a>
    <h2 class=""> 객실 소개</h2>
    
    <!-- 메인 풀 이미지 -->
    <div class="">
        <img class="imgFull" src="${pageContext.request.contextPath}/img/ship-gc57a68d8a_1920.jpg" alt="메인 이미지">
    </div>

    <!-- 컨테이너 메인 -->
    <div class="container">
        <div class="row">
            <!-- 1번 이미지 -->
            <h5 class="mt-5 mb-4">SIGNATURE EXPERIENCE</h5>
            <p class="mb-4">
                WY 호텔은 이국적인 분위기와 전 세대가 즐길 수 있는 다양한 엔터테인먼트로 호텔 공간이 하나의 즐거운 여정이 되는 호텔 입니다.
                복잡한 일상에서 벗어나 자연 그대로의 생명력과 완벽한 쉼을 마주할 수 있으며 특히,
                50개의 스위트 객실로 이루어진 힐 스위트는 평온한 분위기와 프라이빗한 서비스로 가장 이상적인 휴식을 선사합니다.
            </p>

            <div class="col-12 pb-5">
                <img class="introImg1 mt-5 mb-2" src="${pageContext.request.contextPath}/img/hotel-g89d6d2350_1920.jpg" alt="img1">
                <div class="col-12 justify-content-end">
                    <img class="introImg1 rounded float-end" src="${pageContext.request.contextPath}/img/hotel-g778b6dc8d_1920.jpg" alt="img2">
                    <div class="col-5 mt-5 ">
                        <h3 class="mb-4">HOTEL STORY</h3>
                        <p class="intrFont">
                            한 분 한 분을 존중하는 선별된 세심함. 라이프스타일에 영감을 주는 공감각적 경험. 깊은 탐구를 바탕으로 전하는 도전과 변화.
                            한 세기 이상 이어온 환대 미학을 바탕으로, 기대를 넘어선 서비스와 오감을 자극하는 다층적인 아름다움을 전합니다.
                            영원한 기억을 위하여 단호한 원칙을 지켜온 조선 팰리스, 바로 이 곳에 당신이 가장 빛나는 시간이 있습니다.
                        </p>
                    </div>
                </div>
            </div>

           

        </div>
    </div> 	
	
	<%@ include file="../include/footer.jsp" %>

</body>
</html>