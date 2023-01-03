<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WYHotel</title>
    <style>
        /* font setting */
        *{ font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none;}
        a{ text-decoration: none; color: silver;}

        /* 공통 */
        .posi{padding: 80px 0;}
        .btn { border-radius: 0;}

        /* introduce_hotel */
        .hMenu { list-style: none;}

        /* info */
        .info {text-align: justify;}
    </style>
    
    
</head>
<body>
	<%@ include file="../include/header.jsp" %>
		<div class="container posi">
       
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
    
        <div class="row">
            <div class="col-12">
                <!-- 여기는 지도 api가 들어가는 장소입니다 -->
                <h3>Location</h3>
                <br>
                <div id="map" class="mapSize text-bg-danger" style="width: 1200px; height: 500px; background: silver;"></div>
                
            </div>
        </div>
            
        <div class="row pt-5">
            <div class="col-5">
                <h4 class="mb-2 fs-2">WY HOTEL</h4>
                <h4>BUSAN</h4>
                <p class="mt-5 fs-5 info">
                    부산역에서 차로 약 15분 거리에 위치하여 뛰어난 접근성을 자랑하는 WY  HOTEL 부산은 여행의 목적에 따라 자유롭게 선택할 수 있는 600 여개의 객실을 갖추고 있습니다. 감각적인 라이프 스타일과 모던하고 세련된 스타일로 리노베이션 된 객실과 다양한 레스토랑 그리고 외국인 전용 카지노는 특별한 즐거움이 될 것입니다. 탁 트인 바다와 항구의 낭만이 있는 도시, 부산에서 성공적인 비즈니스와 여행을 즐기십시오.
                </p>
            </div>
            <!-- 공간부분 -->
            <div class="col-2"></div>
            <div class="col-4 fs-5">
                <hr>
                <!-- 양끝정렬 맞추기 -->
                    <p>
                        <b> 주소 </b>
                        <span class="ms-5">부산광역시 해운대구 해운대해변로 264 </span>
                    </p>
                    <p>
                        <b> 대표전화 </b>
                        <span class="ms-4"> 051-749-7601 </span>
                    </p>
                <hr>
        	</div> <!-- row end-->
       	</div> 
        
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- kakao map api-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=41aca7ece0113193e81e572a79563765"></script>

    <script>
        

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 마커가 표시될 위치입니다 
        var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

    </script>
	
	<%@ include file="../include/footer.jsp" %>	
</body>
</html>