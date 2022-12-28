<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>WYHotel</title>
    
        <!--BOOTSTRAP CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">   <!-- google font CDN -->
        <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <!-- jquery and daterangepicker -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    
        <!-- swiper -->
        <!-- Link Swiper's CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
    </head>
    <body>    
        <header> <!-- start header -->
            <div class="header-wrapper">
                <div class="contatiner" style="text-align: center;">
                    <div class="img-wrapper">
                        <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/img/em_logo.svg" width="150"></a>
                    </div>
                </div>
            </div>        
        </header> <!-- end header -->
        <nav class="navbar navbar-expand-lg bg-light sticky-top"> <!-- start navbar -->         
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"><span class="bi bi-menu-button-wide"></span></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                호텔소개
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/introduce_hotels.html">개요</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/introduce_hotels.html">WY호텔 서울</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/introduce_hotels.html">WY호텔 부산</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/introduce_hotels.html">WY호텔 제주</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">프로모션</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                고객관리
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">QNA</a></li>
                                <li><a class="dropdown-item" href="./reservations.html">문의하기</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                예약관리
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">예약하기</a></li>
                                <li><a class="dropdown-item" href="./reservations.html">내 예약</a></li>
                            </ul>
                        </li>
                        <!-- 비로그인시 띄워줄 드롭다운 메뉴 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                계정관리
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/login">로그인</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/join">회원가입</a></li>                                
                            </ul>
                        </li>
                        <!-- 로그인시 띄워줄 드롭다운 메뉴 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                마이페이지
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/login">맴버쉽</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/modify">회원정보수정</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/delete">회원탈퇴</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav> <!-- end navbar-->