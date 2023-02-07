<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    
    <!-- 로티파이 CDN -->
    <script src="${pageContext.request.contextPath}/js/lottie-player.js"></script>

    <style>
        .error-wrap{text-align: center; color: #555; margin: 100px 0;}
        .error-p{font-size: 15px;}
    </style>
    <title>WYHotel</title>

</head>
<body>

    <div class="error-wrap">

        <h5 class="fw-bolder">원하시는 페이지를 찾을 수 없습니다</h5>
        <p class="pt-3 error-p">
            죄송합니다. 페이지를 찾을 수 없습니다. <br>
            존재하지 않는 주소를 입력하셨거나, <br>
            요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다. <br>
        </p>
        
        <button type="button" class="btn btn-outline-dark btn-round" onclick="location.href='${pageContext.request.contextPath}/'">메인으로 돌아가기</button>
        <lottie-player src="${ pageContext.request.contextPath }/json/errorPage.json" background="transparent"  speed="0.8"  style="width: 600px; height: 600px; margin: 0 auto; " loop autoplay></lottie-player>

    </div>
</body>
</html>