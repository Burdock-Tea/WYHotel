<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WYgram</title>

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

    <link href="${pageContext.request.contextPath}/css/instagram.css" rel="stylesheet" />

</head>
<body>
    <header>
      <div class="left_box">
        <div class="camera_box">
          <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/img/logo.svg" alt="호텔로고" width="80"></a>
        </div>
        <div class="line">|</div>
        <div class="logo_box">
          <a href="${pageContext.request.contextPath}/instagram/instagram"><img class="logo" src="${pageContext.request.contextPath}/img/wy_gram.svg" alt="인스타 로고" width="80" /></a>
        </div>
      </div>
    </header>

    <div class="container">
        <div class="row  float-start clearfix">
            <div class="mt-5"></div>
            <div class="mt-3"></div>
            <div class="col-12 mt-5">
                <ul class="list-group col-12">
                <c:if test="${member == null}">
                    <li class="list-group">
                        <h5>로그인이 필요한 서비스 입니다.</h5>
                        <button id="loginBtn">로그인페이지</button>
                    </li>
                 </c:if>
                 <c:if test="${member != null}">
	                 <li class="list-group">
	                       <h5>${mem.name}님 환영합니다!</h5>
                     </li>
                    <hr>
                    <c:if test="${admin == true}">
                    	<li class="list-group-item" style="border: none;"><a href="#" class="text-secondary" id="write" style="text-decoration: none;">게시글 등록</a></li>
                    	<li class="list-group-item" style="border: none;"><a href="${pageContext.request.contextPath}/member/pwChk" class="text-secondary" style="text-decoration: none;">내 정보</a></li>
                    	<li class="list-group-item" style="border: none;"><a href="${pageContext.request.contextPath}/" class="text-secondary" style="text-decoration: none;">호텔 사이트</a></li>
                    </c:if>
                    <c:if test="${admin == false}">
                    	<li class="list-group-item" style="border: none;"><a href="${pageContext.request.contextPath}/member/pwChk" class="text-secondary" style="text-decoration: none;">내 정보</a></li>
                    	<li class="list-group-item" style="border: none;"><a href="${pageContext.request.contextPath}/" class="text-secondary" style="text-decoration: none;">호텔 사이트</a></li>
                    </c:if>
                 </c:if>
                </ul>
            </div>
        </div>
    </div>
    <!--body-->
    <div class="none"></div>
    <div class="main_body">
      <article>
        <div class="empty_box"></div>
        <div class="feed" id="contentDiv">
            <%-- <div class="feed_id">
              <div class="id_round">
                <div class="id_box">
                  <div class="id_box_img">
                    <img class="id_img" src="${pageContext.request.contextPath}/img/logo.svg" alt="내 프로필" width="80">
                  </div>
                  <div class="id_container">
                    <div class="id_name">관리자 id</div>
                    <div class="comments2">1일 전</div>
                  </div>
                </div>
              </div>
              <div class="dropdown" style="padding-left: 500px; margin-top: 10px;">
              <c:if test="${admin == true }">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="background: none; color: black; border: none;">
                 	   관리
                </button>
               </c:if>
                <ul class="dropdown-menu">
                  <li><button class="dropdown-item" type="button">수정</button></li>
                  <li><button class="dropdown-item" type="button">삭제</button></li>
                </ul>
              </div>
            </div>
            <div class="feed_picture">
              <img src="${pageContext.request.contextPath}/img/hotel-g0087e5c7d_1920.jpg" alt="피드 사진">
            </div>
            <!--feedbottom-->
            <div class="feed_bottom">
              <div class="emoticon_box">
                <div class="emoticon_box2">
                  <div class="heart_box">      
                    <a href="#"><img class="heart" src="${pageContext.request.contextPath}/img/heart.png" alt="하트"></a>         
                  </div>
                </div>
                <span class="feed_like">...명이 좋아합니다.</span>
              </div>
            </div>
            <!--/feedbottom-->
            <div class="feed_article">
              <div class="feed_article_box">
                <div class="comments_container">
                  <div class="comments">id : 내용</div>
                  <div class="comments1"><a href="#">...더 보기</a></div>
                </div>
                <div class="comments1_box">
                  <div class="comments">id, 첫번째 댓글</div>
                  <div class="comments">id, 두번째 댓글</div>
                  <div class="comments">id, 세번째 댓글</div>
                  <div class="comments1"><a href="#">...더 보기</a></div>
                </div>
                <div class="new_comments">
                </div>
              </div>
            </div>
            <div class="inputContainer">
              <div class="type_comment">
                <input class="inputBox" type="text" placeholder="댓글 달기...">
              </div>
              <span>
                <button class="buttonBox" type="button">게시</button>
              </span>
            </div> --%>
           
          </div>
          
      </article>

      <div class="modal fade" id="writeModal" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">게시글 등록</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="writeForm">
                <div class="modal-body">
                    <div class="fileDiv mb-3">
                        <img id="fileImg" src="${pageContext.request.contextPath}/img/logo.svg" style="width: 380px; height: 380px;">
                    </div>
                    <table class="table">
                        <tbody class="t-control">
                            <tr>
                                <td class="t-title">email</td>
                                <td><input class="form-control input-sm" value="${mem.email }" readonly name="writer"></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="reply-content">
                        <textarea class="form-control" rows="3" name="content"
                            id="content" placeholder="하고싶은 말을 적어주세요." style="resize: none;"></textarea>
                        <div class="reply-group">
                            <div class="filebox pull-left float-start mt-3">
                                <input type="file" name="file" id="file">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="writeOk">등록</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
                </div>
            </form>
          </div>
        </div>
      </div>
      
      <div class="modal fade" id="modifyModal" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">게시글 수정</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
                <div class="modal-body">
                    <div class="fileDiv mb-3">
                        <img id="modifyImg" src="${pageContext.request.contextPath}/img/logo.svg">
                    </div>
                    <table class="table">
                        <tbody class="t-control">
                            <tr>
                                <td class="t-title">email</td>
                                <td><input class="form-control input-sm" value="${mem.email }" readonly name="email"></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="reply-content">
                        <textarea class="form-control" rows="3" name="content"
                            id="modifyContent" placeholder="하고싶은 말을 적어주세요." style="resize: none;"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" id="modifyOk">수정</button>
	                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
                </div>
          </div>
        </div>
      </div>
      
      <div class="modal fade" id="replyModal" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">댓글 수정</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
                <div class="">
                     <textarea id="modReply" class="form-control" rows="3" name="replyContent" style="resize: none;" placeholder="하고싶은 말을 적어주세요."></textarea>
                </div>
                <div class="relpy-footer">
	                <button type="button" class="btn btn-secondary" id="replyMod">수정</button>
	                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
                </div>
          </div>
        </div>
      </div>
      
    </div>
</body>
</html>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    

    <!-- footer.jsp 파일 끝 -->    
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <script>
	
    //jQuery 시작
    $(document).ready(function() { 
    	
    	//리스트 작업
		let str = '';
    	let strs = '';
		let page = 1;
		let isFinish = false;
    	
    	getList();
    	setTimeout(() => getReplyList(0, 0), 200);
    	
    	$('#loginBtn').click(function() {
			location.href="${pageContext.request.contextPath}/member/login";
		});
    	
        $('#write').click(function() {
            $('#writeModal').modal('show');
        });
		
        //게시글 등록
        //등록하기 버튼 클릭 이벤트
		$('#writeOk').click(function() {
			regist();
		});
        
		//등록을 담당하는 함수
		function regist() {
			
			//세션에서 현재 로그인 중인 사용자 정보(아이디)를 얻어오자.
			const memEmail = '${mem.email}';
			console.log(memEmail);
			//자바스크립트의 파일 확장자 체크 검색.
			let file = $('#file').val();

			//.을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경.
			file = file.slice(file.indexOf('.') + 1).toLowerCase();
			
			if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp' && file !== 'svg' && file !== 'gif') {
				alert('이미지 파일(jpg, png, jpeg, bmp, svg, gif)만 등록이 가능합니다.');
				$('#file').val('');
				return;
			} else if(memEmail === '') { 
				alert('로그인이 필요한 서비스 입니다.');
				return;
			}

			const formData = new FormData();
			const data = $('#file'); //이미지 첨부 input
			
			console.log('폼 데이터: ' + formData);
			console.log('data: ' + data);

			//FormData 객체에 사용자가 업로드한 파일의 정보가 들어있는 객체를 전달.
			formData.append('file', data[0].files[0]);
			//content(글 내용)값도 얻어와서 폼 데이터에 추가.
			const content = $('#content').val();
			formData.append('content', content);
			
			//비동기 방식으로 파일 업로드 및 게시글 등록을 진행.
			$.ajax({
				url: '<c:url value="/instagram/insert" />',
				type: 'post',
				data: formData, //폼 데이터 객체를 넘깁니다.
				contentType: false, //ajax 방식에서 파일을 넘길때는 반드시 false로 처리 -> "multipart/form-data"로 선언됨.
				processData: false,
				success: function(result, textstatus, resp) {
					alert('등록 성공!');
					$('#file').val(''); //파일 선택지 비우기
					$('#content').val(''); //글 영역 비우기
					$(".fileDiv").css("display", "none"); //미리보기 감추기
					$('#writeModal').modal('hide');//모달창 숨기기
					getList(1, true);
				},
				error: function(request, status, error) {
					alert('업로드에 실패했습니다. 관리자에게 문의 해 주세요.');
				}
			}); //end ajax
			
		}; //end regist()
		
		
		
		
		//게시글 list 뽑기
        function getList(pageNum, reset) {
			
			$.getJSON(
				'<c:url value="/instagram/getList?pageNum=' + page + '" />',
				function(list) {
					if(list.length === 0) isFinish = true;
					for(let i=0; i<list.length; i++) {
						str +=
							`<div class="feed_id">
					              <div class="id_round">
					                <div class="id_box">
					                  <div class="id_box_img">
					                    <img class="id_img" src="${pageContext.request.contextPath}/img/logo.svg" alt="내 프로필" width="80">
					                  </div>
					                  <div class="id_container">
					                    <div class="id_name"> ` + list[i].email + `</div>
					                    <div class="comments2">` + timeStamp(list[i].regDate) + `</div>
					                    
					                  </div>
					                </div>
					              </div>
					              <div class="dropdown" style="padding-left: 500px; margin-top: 10px;">
					              <c:if test="${admin == true }">
					                <button class="btn btn-secondary dropdown-toggle" id="management" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="background: none; color: black; border: none;">
					                 	   관리
					                </button>
					               </c:if>
					                <ul class="dropdown-menu">
					                  <li><button class="dropdown-item" type="button" id="instaModify" data-bno="` + list[i].bno + `">수정</button></li>
					                  <li><button class="dropdown-item" type="button" id="instaDelete" data-bno="` + list[i].bno + `">삭제</button></li>
					                </ul>
					              </div>
					            </div>
					            <div class="feed_picture">
					              <img src="${pageContext.request.contextPath}/instagram/display?fileLoca=` + list[i].fileLoca + `&fileName=` + list[i].fileName + `" alt="피드 사진">
					            </div>
					            <!--feedbottom-->
					            
					            <!--/feedbottom-->
					            <div class="feed_article">
					              <div class="feed_article_box">
					                <div class="comments_container">
					                  <div class="comments">` + list[i].email + `&nbsp;&nbsp;` + list[i].content + ` </div>
					                  <div class="feed_like float-end" data-show="true">댓글 ` + '${total}' + `개 더보기</div>
					                </div>
					                <div class="comments1_box" id="replys">
					                	 
						            </div>
						            
					                <div class="new_comments">
					                </div>
					              </div>
					            </div>
					            <c:if test="${member != null}">
						            <div class="inputContainer">
						              <div class="type_comment">
						                <input class="inputBox" id="reply" name="replyContent" type="text" placeholder="댓글 달기...">
						              </div>
						              <span>
						                <button class="buttonBox" id="replyRegist" type="button" data-bno="` + list[i].bno + `">게시</button>
						              </span>
						            </div>
					            </c:if>
					            <button class="buttonBox" id="replyRegist" type="button" data-bno="` + list[i].bno + `" style="display:none;">게시</button>
						            `;
					}
					
					if (reset === true) {
						$('#contentDiv').html('');
					}
					$('#contentDiv').append(str);
					$('#moreReplys').html('');
					$('#replys').hide();
					str = '';
					
				}
				
			);//end getJSON
		}
		
        //게시글 상세보기
        $('#contentDiv').on('click', '#instaModify', function(e) {
        	e.preventDefault();
        	//글 번호 얻어오기
        	const bno = $(this).data('bno');
     		
        	$.getJSON(
        		'<c:url value="/instagram/getDetail/" />' + bno, 
        		function(data) {
        			console.log(data);
					const src = '${pageContext.request.contextPath}/instagram/display?fileLoca=' + data.fileLoca + '&fileName=' + data.fileName;
					//이미지 경로 처리
					$('#modifyImg').attr('src', src);
					//내용 처리
					$('#modifyContent').html(data.content);
					//모달창 열기
					$('#modifyModal').modal('show');
					//사진 크기 지정
					$('#modifyImg').css('width', '380px');
					$('#modifyImg').css('height', '380px');
				}
        	); //end getJSON
        	
		}); //상세보기 끝
		
	    //게시글 삭제
	    $('#contentDiv').on('click', '#instaDelete', function(e) {
			e.preventDefault();
			//글번호
			// const bno = $(this).data('bno');
			const data = {
				'bno' : $(this).data('bno')
			}
			$.ajax({
				type: 'post',
				url: '<c:url value="/instagram/delete" />',
				data: JSON.stringify(data),
				contentType: 'application/json',
				success: function(result) {
					if(confirm('삭제 하시겠습니까?')) {
						if(result === 'fail') {
							alert('삭제 실패 관리자한테 문의');
						} else {
							alert('게시물이 정상적으로 삭제 되었습니다.');
							getList(1, true);
						}
					} else {
						return;
					}
				},
				error: function() {
					alert('삭제 실패');
				}
			});//end ajax
			
		}); //end delete click event
		
		//게시글 수정
		$('#modifyOk').click(function(e) {
			//내가 적은 content값
			const con = $('#modifyContent').val();
			const bno = $('#instaModify').data('bno');
			
			const data = {
				'bno' : bno,
				'content' : con
			}
			$.ajax({
				type: 'post',
				url: '<c:url value="/instagram/modify" />',
				data: JSON.stringify(data),
				contentType: 'application/json',
				success: function(result) {
					if(result === 'success') {
						alert('수정 성공');
						$('#modifyModal').modal('hide');
						getList(1, true);
					} else {
						alert('수정 실패 관리자에게 문의해 주세요.');
					}
				},
				error: function() {
					alert('수정 실패');
				} 
			});//end ajax
			
			
		});
    	
      	//무한 스크롤 함수
    	$(window).scroll(function() {
    		if(!isFinish) {
    			if(Math.round($(window).scrollTop()) === $(document).height() - $(window).height()) {
    				page++;
    				getList();
    			}
    		}
    	});
        
      	///////////////////////////댓글///////////////////////////////////
      	//댓글 등록 이벤트 끝
      	$('#contentDiv').on('click', '#replyRegist', function(e) {
      		e.preventDefault();
      		//글번호
      		const bno = $(this).data('bno');
      		//댓글 내용
      		const replyContent = $(this)[0].parentNode.parentNode.firstElementChild.firstElementChild.value;
      		//작성자
      		const replyWriter = '${mem.name}';
      		//이메일
      		const replyEmail = '${mem.email}'; 
      		
      		if(replyContent === '') {
      			alert('댓글을 입력해 주세요.');
      			return;
      		}
      		
      		$.ajax({
      			type: 'post',
      			url: '<c:url value="/reply/replyRegist" />',
      			data: JSON.stringify({
      				"bno": bno,
      				"replyContent": replyContent,
      				"replyWriter": replyWriter,
      				"replyEmail": replyEmail
      			}),
      			dataType: 'text',
      			contentType: 'application/json',
      			success: function(result) {
					$('#reply').val('');
					getReplyList(1, true);
					strs = '';
					
				},
				error: function() {
					alert('등록 실패 관리자 문의');
				}
      			
      		});//end ajax
      		
		}); //댓글 등록 이벤트 끝
		
		let rno = 0;
		let email = '';
		
		//댓글 목록 이벤트
      	function getReplyList(pageNum, reset) {
			
			//게시글 번호
			const bnos = $('#replyRegist').data('bno');
			
			$.getJSON(
				'<c:url value="/reply/replyList/" />' + bnos + "/" + page,
				function(data) {
					//총 댓글 수
					let total = data.total;
					
					//rno = data.rno;
					
					//댓글  리스트
					let replyList = data.list;
					
					//페이지 번호 * 이번 요청으로 받은 댓글 수보다 전체 댓글 개수가 작으면 더보기 버튼은 없어도 된다.
					if(total <= page * 3) {
						$('#moreReplys').css('display', 'none');
					} else {
						$('#moreReplys').css('display', 'block');
					}
					
					//응답 데이터의 길이가 0과 같거나 더 작으면 함수를 종료하자
					if(replyList.length <= 0) return;//끝
					
					for(let i=0; i<replyList.length; i++) {
						strs += `
						
						<div class="comments re"style="text-align: left; margin-top:10px;">` + replyList[i].replyWriter + `<a href="#" class="modifyReply" data-rno="` + replyList[i].rno + `" data-email="` + replyList[i].replyEmail +  `" style="margin-left: 460px;"><i class="bi bi-brush" id="modImo" style="color:black;"></i></a><a href="#" class="deleteReply" data-rno="` + replyList[i].rno + `" data-email="` + replyList[i].replyEmail +  `" style="margin-left: 10px;"><i class="bi bi-x-circle" id="delImo" style="color:black;"></i></a><br> ` + replyList[i].replyContent + ` </div>
						
						`;
						
					} // end for
					
					if (reset === true) {
						$('#replys').html('');
					}
					
					$('#replys').append(strs);
					strs = '';
					
				}// end function
				
			) // end getJSON
			
		};//리스트 요청 끝
      	
        //댓글 전체내용 띄우기(모두보기 버튼 눌렀을때 사용)
		/*
		$('#contentDiv').on('click', '#moreReplys', function() {
			getReplyList(++page, false);
		});
		*/
		
		//댓글 보여주기
		$('#contentDiv').on('click', '.feed_like', function(e) {
			/* console.log($(this).data('show')); */
			if($(this).data('show') === 'true') {
				$('#replys').show();
				$(this).data('show', 'false');
				$(this).html('▲ 댓글 접기');
			/* 	console.log($('#replys')); */
			} else {
				$('#replys').hide();
				$(this).data('show', 'true');
				$(this).html('댓글 ${total}개 더보기');
			}
			
			
		});
		
		//수정이모티콘 클릭
		$('#contentDiv').on('click', '.modifyReply', function(e) {
			e.preventDefault();
			rno = e.currentTarget.dataset.rno; //댓글 번호
			email = e.currentTarget.dataset.email; //작성자 이메일
			console.log(e.currentTarget.dataset.rno);
			console.log(email);
			if(email !== '${mem.email}' || '${mem == null}') {
				alert('수정 권한이 없습니다.');
				return;
			} else {
				$('#replyModal').modal('show');
			}
		});
		
		//모달창 수정버튼 클릭
		$('.relpy-footer').on('click', '#replyMod', function(e) {
			//console.log(rno); 댓글 번호
			
			const replyContent = $('#modReply').val(); //댓글 수정 내용
			const replyEmail = '${mem.email}'; //내가 접속한 이메일
			
			if(replyContent === '') {
				alert('수정할 댓글을 작성해 주세요.');
				return;
			}
			
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/reply/update" />',
				contentType: 'application/json',
				data: JSON.stringify({
					'replyContent': replyContent,
					'rno': rno,
					'replyEmail': replyEmail
				}),
				success: function(result) {
					if(result === 'success') {
						alert('수정성공');
						getReplyList(1, true);
						$('#replyModal').modal('hide');
					} else {
						alert('수정 실패');
					}
				},
				error: function() {
					alert('관리자 문의');
				}
				
			}); //end ajax
			
		}); // 수정이벤트 끝
		
		//댓글 삭제 이모티콘 클릭
		$('#contentDiv').on('click', '.deleteReply', function(e) {
			e.preventDefault();
			const rnos = e.currentTarget.dataset.rno; //댓글 번호
			const emails = '${mem.email}'; //내가 접속한 이메일
			console.log(rnos);
			console.log(emails);
			
			if(confirm('정말 삭제하시겠습니까?')) {
				
				$.ajax({
					type: 'post',
					url: '<c:url value="/reply/delete" />',
					contentType: 'application/json',
					data: JSON.stringify({
						'rno': rnos,
						'replyEmail': emails
					}),
					success: function(result) {
						if(result === 'success') {
							alert('삭제 성공');
							getReplyList(1, true);
						} else {
							alert('삭제 권한이 없습니다.');
						}
					},
					eroor: function() {
						alert('삭제 실패. 관리자에게 문의해 주세요.')
					}
				}); //end ajax
				
			} else {
				return;
			}
			
		});
		
		
    });//jQuery끝    
    
    
 	 //자바 스크립트 파일 미리보기 기능
	function readURL(input) {
    	if (input.files && input.files[0]) {
    		
        	var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
        	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
        	reader.readAsDataURL(input.files[0]); 
        	//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
            $(".fileDiv").css("display", "block");
        	
        	reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
            	$('#fileImg').attr("src", event.target.result);
            	$('#modifyImg').attr("src", event.target.result); 
        	}
    	}
    }
	$("#file").change(function() {
        readURL(this); //this는 #file자신 태그를 의미
    });
	$('#file2').change(function() {
		readURL(this);
	});

	//날짜 처리 함수
	function timeStamp(millis) {
		const date = new Date(); //현재 날짜
		//현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간 차
		const gap = date.getTime() - millis;
		
		let time; //리턴할 시간
		if(gap < 60 * 60 * 24 * 1000) { //1일 미만일 경우
			if(gap < 60 * 60 * 1000) { //1시간 미만일 경우
				time = '방금 전';
			} else {
				time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
			}
		} else { //1일 이상인 경우
			const regDate = new Date(millis);
			const year = regDate.getFullYear(); //년
			const month = regDate.getMonth() + 1; //월
			const day = regDate.getDate(); //일
			
			time = year + '년' + month + '월' + day + '일';
		}
		
		return time;
	}
	
	
</script>





















