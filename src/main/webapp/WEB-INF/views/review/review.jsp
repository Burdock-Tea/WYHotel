<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<%@ include file="../include/header.jsp" %>
   	<style>
        #myform fieldset{
            display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
            border: 0; /* 필드셋 테두리 제거 */
        }
        #myform input[type=radio]{
            display: none; /* 라디오박스 감춤 */
        }
        #myform label{
            font-size: 1.3em; /* 이모지 크기 */
            color: transparent; /* 기존 이모지 컬러 제거 */
            text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
        }
        
        #myform label:hover,
        #myform label:hover ~ label{
            text-shadow: 0 0 0 #FFD56F; /* 마우스 호버 */
        }
        
        #myform fieldset{
            display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
            direction: rtl; /* 이모지 순서 반전 */
            border: 0; /* 필드셋 테두리 제거 */
        }

        #myform input[type=radio]:checked ~ label {
            text-shadow: 0 0 0 #FFD56F; /* 마우스 클릭 체크 */
        }

        /* 사진 파일 업로드 버튼 */
        .xi-camera { font-size: 2rem; cursor: pointer; line-height: 100%; border: 1px solid #000;}

        /* reviwe */
        .reviwe { width: 70%;}
        </style>

    <div class="container">
        
        <!-- 댓글 영역 -->
        <div class="mt-3 border">
            <input id="content" type="text" class="reviwe" placeholder="여기는 댓글 다는 영역"> 
            
            <button class="btn btn-dark" id="replyRegist">답변달기</button>
            
            <label class="input-file-button" for="input-file"><i class="xi-camera"></i></label>
            <input type="file" id="input-file" style="display: none;"/>
        </div>
        
        <section class="container" id="repliesContainer">
        <!-- 고객 댓글 영역 -->
        <div class="row border">

            <div class="col-3 mt-5">
                <h5>00고객님</h5>
            </div>

            <div class="col-9">

                <div class="mb-3 mt-3">
                    <form name="myform" id="myform" method="post" action="">
                        <fieldset>
                            <span class="ms-2" id="ratingText"></span>
                            <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                            <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                            <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                            <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                            <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                        </fieldset>
                    </form>
                </div>
                
                <div class="row mt-3">
                    <!-- 이미지 -->
                    <a href="" data-bs-toggle="img-modal" data-bs-target="#imgModal"> 
                    <img id="getImg" src="${pageContext.request.contextPath}/resources/img/bedroom-g34b59e527_1920.jpg" alt="테스트 이미지" style="width: 200px; padding-bottom: 20px;"></a>

                    <!-- 이미지 모달 -->
                    <div class="modal fade" id="imgModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="modifyModaltitle">이미지 타이틀</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <!-- 이미지 부분 -->
                            <div class="modal-body">
                              <img src="#" id="getImg" alt="클릭된 이미지 가져옴">
                            </div>
                          </div>
                        </div>
                    </div>   
                </div>

                <div class="">
                    <p>여기는 댓글 영역입니다</p>
                </div>

                <div class="row">
                    <div class="col-9">
                        <!-- 시스템 데이터 넣는곳 수정 됬을 경우에 (수정됨)후 날짜 넣어줌 -->
                        <span id = "date"> </span>
                        
                    </div>

                    <!-- 고객 수정 삭제 버튼 부분 -->
                    <div class="col-3" id="customerEdit">
                        <!-- 수정 버튼 -->
                        <a href="#" class="badge rounded-pill bg-dark" data-bs-toggle="modifiy-modal" data-bs-target="#modifyModal" data-title="수정" data-footer="수정하시겠습니까?"> 수정 </a>

                        <!-- 수정 모달 -->
                        <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="modifyModaltitle">후기 수정</h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <div class="modal-body">
                                  수정하시겠습니까? 여기는 수정 내용이 들어갑니다
                                </div>

                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                  <button id="replyUpdate" type="button" class="btn btn-primary">수정하기</button>
                                </div>
                              </div>
                            </div>
                        </div>    

                        <!-- 삭제 버튼 -->
                        <a href="#" class="badge rounded-pill bg-dark" data-bs-toggle="del-modal" data-bs-target="#delModal" data-title="삭제" data-footer="삭제하시겠습니까?"> 삭제 </a>

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
                                <button type="button" class="btn btn-primary">삭제 하기</button>
                                </div>
                            </div>
                            </div>
                        </div>

                    </div>
                </div>
                
                <div class="container">
                    <div class="row pt-3">
                        <div class="bg-light p-4 mb-4">
                            <img src="/img/adminIcon.svg" class="me-4" alt="">
                            <span class="col-4">관리자 글쓰는영역</span>
                        </div>
                        
                    </div>
                </div>

            </div>


            </section>

            </div>   

        </div>
    </div>

    <script>

        // 날짜 데이터
        let date =  new Date();
        document.getElementById("date").innerHTML = date;

        // 점수 띄우는 함수
        $('#myform').on('click', 'input', function(e){
            let $rating = $(this).val();
            console.log($rating);
            
            document.getElementById('ratingText').innerHTML = $rating + "점";
        });

        $(document).ready(function(){
	        $('#repliesContainer').on('click', 'a[data-bs-toggle$="-modal"]', function(){
	            event.preventDefault();
	            const bno = $(this).attr('href');
	            const target = $(this).data('bs-target');
	            console.log($(target));
	            $(target).modal('show');
	    	});
    	});
        
        // begin jQuery
        
            // modal
            

            var page = 1; //페이지 번호
            var strAdd = ''; //화면에 그려넣을 태그를 문자열의 형태로 추가할 변수
          	
            //댓글쓰기 버튼클릭 로직 #replyRegist
            $('#replyRegist').click(function() {
          	
       	   	  var grade  = $('input:radio[name=rating]:checked').val(); // 선택된 radio의 value 가져오기
       	   	  var content = $('#content').val();
       	   	  
       	   	  if(grade === undefined) // 선택을 하지 않았을 경우
       	   	  {
       	   		  alert('별점 매겨주세요 :)');
       	     	  return;
       	   	  } else if(content === ''){
       	   		  alert('댓글내용을 적어주세요');		
       	   		  return;
       	   	  } else {
       	   	      alert(grade + '점을 주었습니다.');
       	   	      alert('댓글내용 : '+ content);
       	   	  }
       	   	  
       	   	  $.ajax({
       	   		  type: 'post',
       	   		  url : '<c:url value="/review/reviewRegist" />',
       	   		  data : JSON.stringify({
       	   			  "grade" : grade,
       	   			  "content" : content
       	   		  }),
                  
       	   		  dataType: 'text',
       	   		  contentType: 'application/json',
                  
       	   		  success: function(data) {
       	   			  alert('리뷰등록성공!!!');
                      
       	   			  //getList(1, true);
       	   			  
       	   		  },
       	   		  
       	   		  error: function() {
       	              alert('리뷰등록에 실패했습니다. 관리자에게 문의하세요!');
       	              //getList(1, true);
       	          }
       	   		  
       	   	  });//ajax end
       	   	  
            });//#replyRegist end

    </script>
