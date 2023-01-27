<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Web Socket Example</title>
<style>
/*
	#textMessage{
        width: 300px;
        height: 40px;
        position: absolute;
		top: 510px;
		left: 3px;      
	}
	
	#sendButton{
        width: 95px;
        height: 45px;
        background-color: white;
        border : 1px solid black;
        position: absolute;
		top: 510px;
		left: 315px;
	}
	
	#messageTextArea{
		background-color:#acc2d2;
        
		width : 400px;
		height : 500px;
		resize : none;
		position:absolute;
		left: 3px;
		top: 2px;	
	} */
</style>
</head>
<body>
  <!-- 유저가 접속할 때마다 이 템플릿으로 채팅창을 생성한다. -->
  <div class="template" style="display:none">
    <form>
      <!-- 메시지 텍스트 박스 -->
      <input type="text" id="textMessage" class="message" onkeydown="if(event.keyCode === 13) return false;">
      <!-- 전송 버튼 -->
      <input value="Send" id="sendButton" type="button" class="sendBtn">
    </form>
    <br />
    <!-- 서버와 메시지를 주고 받는 콘솔 텍스트 영역 -->
    <textarea  id="messageTextArea" rows="10" cols="50" class="console" disabled="disabled"></textarea>
  </div>
  
  
  <!-- 소스를 간단하게 하기 위하 Jquery를 사용했습니다. -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script type="text/javascript">
    // 서버의 admin의 서블릿으로 웹 소켓을 한다.
    var webSocket = new WebSocket("ws://localhost/wyhotel/adminc");
    // 운영자에서의 open, close, error는 의미가 없어서 형태만 선언
    webSocket.onopen = function(message) { };
    webSocket.onclose = function(message) { };
    webSocket.onerror = function(message) { };
    // 서버로 부터 메시지가 오면
    webSocket.onmessage = function(message) {
      // 메시지의 구조는 JSON 형태로 만들었다.
      let node = JSON.parse(message.data);
      // 메시지의 status는 유저의 접속 형태이다.
      // visit은 유저가 접속했을 때 알리는 메시지다.
      if(node.status === "visit") {
        // 위 템플릿 div를 취득한다.
        let form = $(".template").html();
        // div를 감싸고 속성 data-key에 unique키를 넣는다.
        form = $("<div class='float-left'></div>").attr("data-key",node.key).append(form); 
        // body에 추가한다.
        $("body").append(form);
      // message는 유저가 메시지를 보낼 때 알려주는 메시지이다.
      } else if(node.status === "message") {
        // key로 해당 div영역을 찾는다.
        let $div = $("[data-key='"+node.key+"']");
        // console영역을 찾는다.
        let log = $div.find(".console").val();
        // 아래에 메시지를 추가한다.
        if('${id}' !== ''){
        $div.find(".console").val(log + '${id}' +" => " +node.message + "\n");
        }else{
        	$div.find(".console").val(log + "(user) => " +node.message + "\n");
        }    
      // bye는 유저가 접속을 끊었을 때 알려주는 메시지이다.
      } else if(node.status === "bye") {
        // 해당 키로 div를 찾아서 dom을 제거한다.
        $("[data-key='"+node.key+"']").remove();
      }
    };
    // 전송 버튼을 클릭하면 발생하는 이벤트
    $(document).on("click", ".sendBtn", function(){
      // div 태그를 찾는다.
      let $div = $(this).closest(".float-left");
      // 메시지 텍스트 박스를 찾아서 값을 취득한다.
      let message = $div.find(".message").val();
      // 유저 key를 취득한다.
      let key = $div.data("key");
      // console영역을 찾는다.
      let log = $div.find(".console").val();
      // 아래에 메시지를 추가한다.
      $div.find(".console").val(log + "(관리자) => " + message + "\n");
      // 텍스트 박스의 값을 초기화 한다.
      $div.find(".message").val("");
      // 웹소켓으로 메시지를 보낸다.
      webSocket.send(key+"#####"+message);
    });
    // 텍스트 박스에서 엔터키를 누르면
    $(document).on("keydown", ".message", function(){
      // keyCode 13은 엔터이다.
      if(event.keyCode === 13) {
        // 버튼을 클릭하는 트리거를 발생한다.
        $(this).closest(".float-left").find(".sendBtn").trigger("click");
        // form에 의해 자동 submit을 막는다.
        return false;
      } 
      return true;
    });
  </script>
</body>
</html>