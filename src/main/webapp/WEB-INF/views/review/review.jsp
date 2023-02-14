<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<%@ include file="../include/header.jsp" %>
<style>
    #myform fieldset {
        display: inline-block;
        /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        border: 0;
        /* 필드셋 테두리 제거 */
    }

    #myform input[type=radio] {
        display: none;
        /* 라디오박스 감춤 */
    }

    #myform label {
        font-size: 1.3em;
        /* 이모지 크기 */
        color: transparent;
        /* 기존 이모지 컬러 제거 */
        text-shadow: 0 0 0 #f0f0f0;
        /* 새 이모지 색상 부여 */
    }

    #myform label:hover,
    #myform label:hover~label {
        text-shadow: 0 0 0 #FFD56F;
        /* 마우스 호버 */
    }

    #myform fieldset {
        display: inline-block;
        /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        direction: rtl;
        /* 이모지 순서 반전 */
        border: 0;
        /* 필드셋 테두리 제거 */
    }

    #myform input[type=radio]:checked~label {
        text-shadow: 0 0 0 #FFD56F;
        /* 마우스 클릭 체크 */
    }

    /* reviwe */
    .reviwe{ width: 90%;}
</style>

<div class="container">

    <!-- 댓글 영역 -->
    <section class="container">
    <c:if test="${room != null}">
        <div class="row mt-3 border rounded-3">
            <form name="myform" id="myform" method="post" action="">
                <!-- 호텔 후기 부분 -->
                <h4 class="mt-3">호텔 후기를 입력해주세요</h4>
                
                <select id="r_hotel" class="form-control" name="hotel" hidden="true">
                    <option value="10" ${room.hotelCode=='WY 호텔 서울' ? 'selected' :''}> 호텔 : 서울</option>
                    <option value="20" ${room.hotelCode=='WY 호텔 부산' ? 'selected' :''}>호텔 : 부산</option>
                    <option value="30" ${room.hotelCode=='WY 호텔 제주' ? 'selected' :''}>호텔 : 제주</option>
                </select>
                <select id="r_room" class="form-control" name="room" hidden="true">
                    <option value="55" ${room.roomCode=='Suite' ? 'selected' :''}>Suite</option>
                    <option value="44" ${room.roomCode=='Business Deluxe' ? 'selected' :''}>Business Deluxe</option>
                    <option value="33" ${room.roomCode=='Business' ? 'selected' :''}>Business</option>
                    <option value="22" ${room.roomCode=='Standard Deluxe' ? 'selected' :''}>Standard Deluxe</option>
                    <option value="11" ${room.roomCode=='Standard' ? 'selected' :''}>Standard</option>
                </select>

                <div class="mb-3">
                    <strong>별점</strong>
                    <fieldset>
                        <span class="ms-2" id="ratingText"></span>
                        <input type="radio" class ="rate" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                        <input type="radio" class ="rate" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                        <input type="radio" class ="rate" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                        <input type="radio" class ="rate" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                        <input type="radio" class ="rate" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                    </fieldset>
                </div>
                <input type="hidden" id="reservationCode" name="reservationCode" value="${room.reservationCode}">

            <div class="w-100">
                <input id="content" type="text" class="reviwe border rounded p-1" placeholder="여기는 댓글 다는 영역">

                <button type="button" class="btn btn-dark mb-2 ms-2" id="replyRegist">답변달기</button>
                <!--<label class="input-file-button" for="input-file"><i class="xi-camera"></i></label>  
                <input type="file" id="input-file" style="display: none;" /> -->
            </div>
            </form>

        </div>
    </c:if>
	</section>

    <section class="container" id="repliesContainer">
        <c:forEach var="article" items="${list}">

            <!-- 고객 댓글 영역 -->
            <div class="row border rounded-3 mt-4">

                <div class="col-3 pt-4">
                    <p>
                    	<strong>${article.name}</strong>님
                    </p> 
                    <!-- 시스템 데이터 넣는곳 수정 됬을 경우에 (수정됨)후 날짜 넣어줌 -->
                   	<p>
                   		<c:if test="${article.modifyDate == null}">
                   			<fmt:formatDate value="${article.regDate}" pattern="yyyy년 MM월 dd일" />
                   		</c:if>
                   		<c:if test="${article.modifyDate != null}">
                   			<fmt:formatDate value="${article.modifyDate}" pattern="yyyy년 MM월 dd일" />(수정됨)
                   		</c:if>
                   	</p>
                    <p><strong> 별점 : </strong>${article.grade == 5 ? '⭐⭐⭐⭐⭐' :  article.grade == 4 ? '⭐⭐⭐⭐' : article.grade == 3 ? '⭐⭐⭐' : article.grade == 2 ? '⭐⭐' : '⭐'}</p>

                    <h5>지점 : ${article.hotelCode}</h5>
                    <h5>객실 : ${article.roomCode}</h5>
                    
                </div>

                    <!-- 이미지 
                    <a href="" data-bs-toggle="img-modal" data-bs-target="#imgModal"> 
                    <img id="getImg" src="${pageContext.request.contextPath}/resources/img/bedroom-g34b59e527_1920.jpg" alt="테스트 이미지" style="width: 200px; padding-bottom: 20px;"></a>
                    -->

                <div class="col-7 pt-4">
                    <p>${article.content}</p>
                </div> 
                
                <!-- 고객 수정 삭제 버튼 부분 -->
                <div class="col-2 pt-4" id="customerEdit">
                    <c:if test="${article.memberCode eq member}">
                        <!-- 수정 버튼 -->
                        <a href="${article.bno}" data-content="${article.content}"
                            class="badge rounded-pill bg-dark" data-bs-toggle="modifiy-modal"
                            data-bs-target="#modifyModal" data-title="수정" data-footer="수정하시겠습니까?"> 수정 </a>
                        <!-- 삭제 버튼 -->
                        <a href="${article.bno}" class="badge rounded-pill bg-dark" data-bs-toggle="del-modal"
                            data-bs-target="#delModal" data-title="삭제" data-footer="삭제하시겠습니까?"> 삭제 </a>
                    </c:if>
                </div>

            </div>

        </c:forEach>

    </section>

</div>

</div>
</div>

<!-- 수정 모달 -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modifyModaltitle">후기 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form name="frmReply">
                <div class="modal-body">
                    <input type="text" name="content" id="content" value="">
                    <input type="hidden" name="bno" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" onclick="reviewUpdate()" class="btn btn-primary">수정하기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 삭제 모달 -->
<div class="modal fade" id="delModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">후기 삭제</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                삭제 하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" id="delete" onclick="reviewDelete()" class="btn btn-primary">삭제 하기</button>
            </div>
        </div>
    </div>
</div>

<script>
    // 메세지
    const msg = '${msg}';
    if (msg === '') {} else {
        alert(msg);
    }

    // 점수 띄우는 함수
    $('#myform').on('click', '.rate', function (e) {
        let $rating = $(this).val();
        console.log($rating);
        document.getElementById('ratingText').innerHTML = $rating + "점";
    });

    let deleteBno = '';
    // 번호 초기화값
    $(document).ready(function () {
        $('#repliesContainer').on('click', 'a[data-bs-toggle$="-modal"]', function () {
            event.preventDefault();
            const bno = $(this).attr('href');
            const target = $(this).data('bs-target');
            console.log($(target));

            $(target).modal('show');
            // alert('게시판번호' + bno + '타겟' + target );

            document.frmReply.bno.value = bno; // bno 번호 가져오는 부분
            document.frmReply.content.value = $(this).data('content');
            deleteBno = bno;

        });
    });

    $(function () {

        let member = '${member}';

        //댓글쓰기 버튼클릭 로직 #replyRegist
        $('#replyRegist').click(function () {

            let grade = $('input:radio[name=rating]:checked').val(); // 선택된 radio의 value 가져오기
            let content = $('#content').val();
            let hotel = $('#r_hotel').val();
            let room = $('#r_room').val();
            let reservationCode = $('#reservationCode').val();

            if (member == '' || member == null || member == undefined) {
                alert('로그인을 해주세요.');
                return;
            }

            if (grade === undefined) // 선택을 하지 않았을 경우
            {
                alert('별점 매겨주세요 :)');
                return;
            } else if (content === '') {
                alert('댓글내용을 적어주세요');
                return;
            } else {
                // alert(grade + '점을 주었습니다.');
                // alert('댓글내용 : ' + content);
            }

            $.ajax({
                type: 'post',
                url: '<c:url value="/review/reviewRegist" />',
                data: JSON.stringify({
                    "grade": grade,
                    "content": content,
                    "hotelCode": hotel,
                    "roomCode": room,
                    "memberCode": member,
                    "reservationCode": reservationCode
                }),

                dataType: 'text',
                contentType: 'application/json',

                success: function (data) {
                    if (data === 'regSuccess') {
                        alert('정상적으로 리뷰가 등록되었습니다.');
                        location.href='${pageContext.request.contextPath}/review/review';
                    } else if (data === 'regFail') {
                        alert('해당 호텔/룸 이용했던 고객만 리뷰등록 가능합니다.');
                    } else {
                        alert('이미 리뷰를 작성했습니다.')
                    }

                },
                error: function () {
                    alert('리뷰등록중 에러가 발생했습니다. 관리자에게 문의하세요!');
                }

            }); //ajax end

        }); //#replyRegist end
    }); //제이쿼리 끝 

    // 리뷰 수정 
    function reviewUpdate() {
        $('form[name=frmReply]').attr('action', '${pageContext.request.contextPath}/review/reviewUpdate');
        $('form[name=frmReply]').attr('method', 'post');
        // $('form[name=frmReply]').append("<input type='hidden' value=" + reviewUpdatebno + " name='bno' readonly>");

        $('form[name=frmReply]').submit();
    };

    // 리뷰 삭제
    function reviewDelete() {
        $('form[name=frmReply]').attr('action', '${pageContext.request.contextPath}/review/reviewDelete');
        $('form[name=frmReply]').attr('method', 'post');
        //$('form[name=frmReply]').append("<input type='hidden' value=" + reviewUpdatebno + " name='bno' readonly>");

        $('form[name=frmReply]').submit();

    }
</script>
<%@ include file="../include/footer.jsp" %>