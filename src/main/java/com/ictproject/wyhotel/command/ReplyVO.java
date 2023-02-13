package com.ictproject.wyhotel.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 	CREATE TABLE instagram_reply (
    rno NUMBER(10, 0) PRIMARY KEY, -- 댓글 번호
    bno NUMBER(10, 0) NOT NULL, --글 번호
    reply_email VARCHAR2(50) NOT NULL, -- 댓글 작성자
    reply_content VARCHAR2(1000) NOT NULL, -- 댓글 내용
    reply_date DATE DEFAULT sysdate, -- 댓글 작성 시간
    update_date DATE DEFAULT NULL,
    reply_writer VARCHAR2(50) NOT NULL
);
 */

@Setter
@Getter
@ToString
public class ReplyVO {
	
	private int rno; //댓글 번호
	private int bno; //글 번호
	
	private String replyEmail; //댓글 작성자(이메일)
	private String replyContent; //댓글 내용
	//private String replyDate; //댓글 단 시점 시간
	//private String updateDate; //댓글 수정 시간
	private String replyWriter; //댓글 작성자(이름)
	
}












