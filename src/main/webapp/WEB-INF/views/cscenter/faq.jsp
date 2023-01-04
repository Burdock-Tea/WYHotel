<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        /* font setting */
        *{ font-family: 'Noto Sans KR', sans-serif; font-weight: 300;}
        .nav-link{ font-weight: 400;} /* font 활성화시 폰트 두께*/
        a{ text-decoration: none; color: silver;}

        /* acod */
        .posi{padding: 80px 0;}
        .row > div:nth-child(1) {padding-left: 50px;}
        .row > div:nth-child(1) > ul li {list-style: none; }
        .list-group-item { border: 0; }
        .text-secondary { text-decoration: none;}
        .text-secondary:hover { font-weight: 400;}
    </style>

</head>

<%@ include file="../include/header.jsp" %>
<body>
<!-- nav-->

    <!-- 메인영역 각자 할꺼 여기서 부터 적으세용 -->
    
    <div class="container posi">
        <!-- Content here -->
        <div class="row">
            <!-- 목록 -->
            <div class="col-3">
                <ul class="list-group">
                    <li class="list-group"><h4>고객센터</h4></li>
                    <hr>
                    <li class="list-group-item"> <a href="${pageContext.request.contextPath}/cscenter/customer" class="text-secondary">문의 하기</a></li>
                    <li class="list-group-item"> <a href="${pageContext.request.contextPath}/cscenter/faq" class="text-secondary">FAQ</a></li>
                </ul>
            </div>

            <div class="col-6">
                <!-- 키워드 부분 -->
                <section class="keyword">
                    <div class="pb-3 text-white">
                        <a class="badge bg-dark p-2" href="#aco1">프로모션</a>                
                        <a class="badge bg-dark p-2" href="#aco2">카드</a>                
                        <a class="badge bg-dark p-2" href="#aco3">맴버쉽 계정</a>                
                    </div>
                </section>

                <!-- 1 ) 호텔 예약 아코디언 -->
                <div class="accordion" id="aco1">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            1 ) 맴버쉽에 가입하면 추가할인이 있나요?
                        </button>
                      </h2>
                      <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#aco1">
                        <div class="accordion-body">
                            맴버쉽에 가입하시면 포인트 적립 혜택이 있으며, VIP(유료멤버십) 객실과 레스토랑 상시 할인 혜택이 제공됩니다.
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            2 ) 기타 맴버쉽 관련 문의는 어떻게 해야 하나요?
                        </button>
                      </h2>
                      <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#aco1">
                        <div class="accordion-body">
                            관련 문의는 홈페이지 '고객 문의'에 문의주시기 바랍니다.
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            3 ) 회원 대상 프로모션 상품 및 특가를 안내 받고 싶습니다
                        </button>
                      </h2>
                      <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#aco1">
                        <div class="accordion-body">
                            멤버십을 위한 특가 상품이나 할인 혜택, 이벤트 등은 마케팅 수신동의 해주신 회원에 한하여 문자나 이메일로 발송됩니다. (각각 수신동의 필요)
                            혹시 수신 동의가 안되어 있다면 '홈페이지 > 마이페이지 > 회원정보수정 > 정보수신동의'에 체크해주시면 다양한 혜택을 받아보실 수 있습니다. 
                        </div> 
                      </div>
                    </div>
                  </div>

                <!-- 2 ) 카드 아코디언 -->
                <div class="accordion visually-hidden" id="aco2">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            1 ) 리워드 회원도 실물 카드가 배송되나요?
                        </button>
                      </h2>
                      <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#aco2">
                        <div class="accordion-body">
                            리워드(REWARDS) 실물카드는 발급되지 않습니다. 웹사이트/ APP 로그인을 통한 모바일 회원카드를 이용해주시기 바랍니다.
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            2 ) 카드를 분실했는데 재발급 가능한가요?
                        </button>
                      </h2>
                      <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#aco2">
                        <div class="accordion-body">
                            카드분실 시 회원관리과로 문의주시면 재발급 가능하며,  2만원의 재발급 비용이 발생합니다.
                        </div>
                      </div>
                    </div>
                    
                  </div>

                <!-- 3 ) 맴버쉽 계정 아코디언 -->
                <div class="accordion visually-hidden" id="aco3">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            1 ) 맴버쉽 번호 확인은 어떻게 하나요?
                        </button>
                      </h2>
                      <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#aco3">
                        <div class="accordion-body">
                            회원 정보 수정은 '홈페이지 > 마이페이지'에서 가능합니다.
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            2 ) 맴버쉽 멤버십 번호 확인은 어떻게 하나요?
                        </button>
                      </h2>
                      <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#aco3">
                        <div class="accordion-body">
                            홈페이지 회원가입을 통하여 리워드(무료 멤버십) 가입이 가능하며, VIP(유료 멤버십)는 멤버십 페이지에서 구매하실 수 있습니다.
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            3 ) 로그인이 안돼요.
                        </button>
                      </h2>
                      <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#aco3">
                        <div class="accordion-body">
                            오프라인에서 회원 가입한 고객님은 온라인 이용 시 최초 1회에 한하여 온라인 회원 가입을 하셔야 계정 연동이 가능합니다. 온라인 본인인증 및 회원 가입 후 로그인 부탁 드리겠습니다.
                        </div> 
                      </div>
                    </div>
                  </div>
            </div>

        </div> <!-- aco row end-->

        
    </div>
     <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

	<script>
    // 키워드 hidden 이벤트 
    $(".keyword").on('click', 'a', function(){
        const accList = [...document.getElementsByClassName('accordion')];
        
        const id = $(this).attr('href').replace('#', '');
        console.log(id);

        accList.forEach(acc => {
            if (acc.getAttribute('id') !== id) {
                acc.classList.add('visually-hidden');
            } else {
                acc.classList.remove('visually-hidden');
            }
        });

    });
	</script>

    <%@ include file="../include/footer.jsp" %>

