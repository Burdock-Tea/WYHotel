<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/header.jsp" %>

    <style>
       
       /* font setting */
       *{ font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none;}
       .box-shodow{ box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);}
       a{ text-decoration: none; color: silver;}

       /* 공통 */
       .posi{padding: 80px 0;}
       .btn { border-radius: 0;}

       /* introduce_hotel */
       .hMenu { list-style: none;}

    </style>

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
                <h4>JEJU</h4>
                <p class="mt-5 fs-5 info">
                    에메랄드 빛 바다와 천혜의 경관을 그대로 마주하고 있는 WY  HOTEL 제주는 제주 대표 관광지가 모여있는 중문관광단지에 위치하여 풍부한 주변 볼거리를 제공합니다. 제주의 바다를 닮은 넓고 고요한 객실은 일상을 벗어난 편안한 여유의 시간을 즐기기에 최적의 공간입니다. 특히,  WY  HOTEL 힐 스위트는 완벽한 공간 분리를 통해 오직 서로에게만 집중하고 싶은 허니무너들에게 가장 달콤하고 프라이빗한 시간을 선사합니다. 미식의 즐거움을 책임지는 6개의 레스토랑 & 바 그리고 사계절 온수풀, 피트니스, 스파, 키즈클럽까지 다양한 서비스와 컨텐츠를 통해 즐거움으로 가득찬 여정을 선사합니다.
                </p>
            </div>
            <!-- 공간부분 -->
            <div class="col-2"></div>
            <div class="col-4 fs-5">
                <hr>
                <!-- 양끝정렬 맞추기 -->
                    <p>
                        <b> 주소 </b>
                        <span class="ms-5">제주특별자치도 제주시 1100로</span>
                    </p>
                    <p>
                        <b> 대표전화 </b>
                        <span class="ms-4"> 064-713-9950 </span>
                    </p>
                <hr>
        </div> <!-- row end-->
    </div> 
        
    </div>

    

    <!-- kakao map api-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${ kakaoKey }"></script>

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
