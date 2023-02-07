<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/header.jsp"%>

<style>

/* font setting */
* {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	text-decoration: none;
}

.box-shodow {
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}

a {
	text-decoration: none;
	color: silver;
}

/* 공통 */
.posi {
	padding: 80px 0;
}

.btn {
	border-radius: 0;
}

/* introduce_hotel */
.hMenu {
	list-style: none;
}
</style>

<div class="container posi">

	
	<div class="row">
		<div class="col-12">
			<!-- 여기는 지도 api가 들어가는 장소입니다 -->
			<h3>Location</h3>
			<br>
			<div class="mb-3">
				<button type="button" id="cafeBtn" class="btn btn-outline-danger">카페</button>
				<button type="button" id="tourBtn" class="btn btn-outline-success">라운지</button>
			</div>
			
			<div id="map" class="mapSize text-bg-danger"
				style="width: 1200px; height: 500px; background: silver;"></div>
		</div>
	</div>

	<div class="row pt-5">
		<div class="col-5">
			<h4 class="mb-2 fs-2">WY HOTEL</h4>
			<h4>JEJU</h4>
			<p class="mt-5 fs-5 info">에메랄드 빛 바다와 천혜의 경관을 그대로 마주하고 있는 WY HOTEL
				제주는 제주 대표 관광지가 모여있는 중문관광단지에 위치하여 풍부한 주변 볼거리를 제공합니다. 제주의 바다를 닮은 넓고
				고요한 객실은 일상을 벗어난 편안한 여유의 시간을 즐기기에 최적의 공간입니다. 특히, WY HOTEL 힐 스위트는 완벽한
				공간 분리를 통해 오직 서로에게만 집중하고 싶은 허니무너들에게 가장 달콤하고 프라이빗한 시간을 선사합니다. 미식의 즐거움을
				책임지는 6개의 레스토랑 & 바 그리고 사계절 온수풀, 피트니스, 스파, 키즈클럽까지 다양한 서비스와 컨텐츠를 통해
				즐거움으로 가득찬 여정을 선사합니다.</p>
		</div>
		<!-- 공간부분 -->
		<div class="col-1"></div>
		<div class="col-5 fs-5">
			<hr>
			<!-- 양끝정렬 맞추기 -->
			<p>
				<b> 주소 </b> <span class="ms-5">제주특별자치도 제주시 1100로</span>
			</p>
			<p>
				<b> 대표전화 </b> <span class="ms-4"> 064-713-9950 </span>
			</p>
			<hr>
		</div>
		<!-- row end-->
	</div>

</div>



<!-- kakao map api-->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${ kakaoKey }"></script>
<script src="${pageContext.request.contextPath}/json/jejuCafe.json" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/json/jeju.json" type="text/javascript"></script>

<script>
    	
    var jCafeData = JSON.parse(JSON.stringify(jejuCafe));
    var jejuData = JSON.parse(JSON.stringify(jeju));
   
        var mapContainer = document.getElementById('map'),  
        mapOption = { 
            center: new kakao.maps.LatLng(33.509440, 126.550283),
            level: 4 
        };
        
        var imageSrc = '${pageContext.request.contextPath}/img/hotell.png',     
        imageSize = new kakao.maps.Size(32, 35), 
        imageOption = {offset: new kakao.maps.Point(27, 69)}; 
          
   	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
       		markerPosition = new kakao.maps.LatLng(33.509440, 126.550283);

        var map = new kakao.maps.Map(mapContainer, mapOption); 
        var markerPosition  = new kakao.maps.LatLng(33.509440, 126.550283); 
        var marker = new kakao.maps.Marker({
        	 position: markerPosition,
        	 image: markerImage
		});
        marker.setMap(map);
        
        
        
		let i = 0;
		let t = 0;
		var closeWindow = [];
		var markers = [];
		
        $('#cafeBtn').click(function() {
        	closeInfoWindow();
        	hideMarkers();
			var showMaker = setInterval(() => {
			var positions = [ {
				content : jCafeData[i].content,
				latlng : new kakao.maps.LatLng(jCafeData[i].latlngX, jCafeData[i].latlngY)
			}
			];
			console.log("=====" , positions)
		for(let j = 0 ; j < positions.length ; j++) {
			var marker = new kakao.maps.Marker({
				map : map, 
				position : positions[j].latlng,
				clickable: true
			});
		}
			iwRemoveable = true;
				
			var infowindow = new kakao.maps.InfoWindow({
		        content: jCafeData[i].content,
		        removable : iwRemoveable
		    });
			closeWindow.push(infowindow);
			
			
			kakao.maps.event.addListener(marker, 'click', function() {
			      infowindow.open(map, marker);  
			});
			i++;
			if(i === jCafeData.length) {
				clearInterval(showMaker);
				i=0;
			}
				 marker.setMap(map);
				 markers.push(marker);
		}, 100);
			
		}); // end cafefunction
        
       	function setMarkers(map) {
      	    for (var r = 0; r < markers.length; r++) {
      	        markers[r].setMap(map);
      	    }            
      	}	 

      	
		$('#tourBtn').click(function() {
        	closeInfoWindow();
			hideMarkers();
			var showMake = setInterval(() => {
			var jejuPoint = [{
				content : jejuData[t].content,
				latlng : new kakao.maps.LatLng(jejuData[t].latlngX, jejuData[t].latlngY)
			}];
			
		for(let j=0; j < jejuPoint.length; j++) {
			
			var marker = new kakao.maps.Marker({
				map : map, 
				position : jejuPoint[j].latlng,
				clickable: true
			});
		}
			iwRemoveable = true;
			
			var infowindow = new kakao.maps.InfoWindow({
		        content: jejuData[t].content,
		        removable : iwRemoveable
		    });
			closeWindow.push(infowindow);
			
			
			kakao.maps.event.addListener(marker, 'click', function() {
			      infowindow.open(map, marker);  
			});
			
			t++;
			if(t === jejuData.length) {
				clearInterval(showMake);
				t=0;
			}
			 marker.setMap(map);
			 markers.push(marker);
		}, 100);
		}); // end tourfunction
			
		function setMarkers(map) {
      	    for (var y = 0; y < markers.length; y++) {
      	        markers[y].setMap(map);
      	    }            
      	}	
					 
        
        function hideMarkers() {
        	 setMarkers(null);  
        }
        
        function closeInfoWindow() {
            for(var idx=0; idx < closeWindow.length; idx++){
            	closeWindow[idx].close();
            }
        }

 </script>
<%@ include file="../include/footer.jsp"%>
