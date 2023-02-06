package com.ictproject.wyhotel.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 	CREATE TABLE instagramlike (
    bno NUMBER(10, 0) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    lno NUMBER PRIMARY KEY
);
 */

@Getter
@Setter
@ToString
public class InstagramLikeVO {
	
	private int bno; //글 번호
	private String email; //회원 이메일
	private int lno; //좋아요 수
	
}
