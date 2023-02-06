package com.ictproject.wyhotel.command;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 	CREATE TABLE instagram (
    bno NUMBER(10, 0) PRIMARY KEY,  --글 번호
    email VARCHAR2(50) NOT NULL, -- 작성자
    upload_path VARCHAR2(100) NOT NULL, -- 파일 업로드한 폴더 경로
    file_loca VARCHAR2(100) NOT NULL, -- 파일 지정된 경로
    file_name VARCHAR2(50) NOT NULL, -- 파일 랜덤 이름
    file_real_name VARCHAR2(50) NOT NULL, -- 파일 원본 이름
    content VARCHAR2(2000), -- 글 내용
    reg_date DATE DEFAULT sysdate -- 글 작성 시간
	);
 */

@Setter
@Getter
@ToString
public class InstagramVO {
	
	private int bno; //글 번호
	private String email; //글 작성자
	private String uploadPath; //파일 업로드한 폴더 경로
	private String fileLoca; //파일 지정된 경로
	private String fileName; //파일 랜덤 이름
	private String fileRealName; //파일 원본 이름
	private String content; //글 내용
	private Timestamp regDate; //글 작성 시간
	
	private List<ReplyVO> replyList; //댓글 리스트
	
}



















