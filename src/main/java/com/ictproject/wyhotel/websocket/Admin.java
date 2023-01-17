package com.ictproject.wyhotel.websocket;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/adminc")
public class Admin {
  // 운영자 유저는 하나라고 가정하고 만약 둘 이상의 세션에서 접속을 하면 마지막 세션만 작동한다.
  private static Session admin = null;
  // 운영자 유저가 접속을 하면 발생하는 이벤트 함수
  @OnOpen
  public void handleOpen(Session userSession) {
    // 기존에 운영자 유저의 소켓이 접속중이라면
    if (admin != null) {
      try {
        // 접속을 끊는다.
        admin.close();
      } catch (IOException e) {
 
      }
    }
    // 운영자 유저의 세션을 바꾼다.
    admin = userSession;
    // 기존에 접속해 있는 유저의 정보를 운영자 client로 보낸다.
    for(String key : BoardSocket.getUserKeys()) {
      // 전송.. 전송
      visit(key);
    }
  }
  // 운영자 유저가 메시지를 보내면 발생하는 이벤트
  @OnMessage
  public void handleMessage(String message, Session userSession) throws IOException {
    // key와 메시지 구분키를 #####를 넣었다. (json으로 해도 되는데 Gson 연결까지 하면 귀찮아져서...)
    String[] split = message.split("#####", 2);
    // 앞은 key 데이터
    String key = split[0];
    // 뒤 정보는 메시지
    String msg = split[1];
    // 일반 유저의 key로 탐색후 메시지 전송
    BoardSocket.sendMessage(key, msg);
  }
  // 접속이 끊기면 위 운영자 세션을 null 처리한다.
  @OnClose
  public void handleClose(Session userSession) {
	  admin = null;
  }
  // 운영자 유저로 메시지를 보내는 함수
  private static void send(String message) {
    if (admin != null) {
      try {
        admin.getBasicRemote().sendText(message);
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
  // 일반 유저가 접속했을 때, 운영자 유저에게 알리는 함수
  public static void visit(String key) {
    // json 구조로 status는 visit이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜)
    send("{\"status\":\"visit\", \"key\":\"" + key + "\"}");
  }
  // 일반 유저가 메시지를 보낼 때, 운영자 유저에게 알리는 함수
  public static void sendMessage(String key, String message) {
    // json 구조로 status는 message이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜) message는 보내는 메시지이다.
    send("{\"status\":\"message\", \"key\":\"" + key + "\", \"message\":\"" + message + "\"}");
  }
  // 일반 유저가 접속을 끊을 때, 운영자 유저에게 알리는 함수
  public static void bye(String key) {
    // json 구조로 status는 bye이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜)
    send("{\"status\":\"bye\", \"key\":\"" + key + "\"}");
  }
}
