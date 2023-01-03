package com.ictproject.wyhotel.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	
	private String memberCode;
	private String email;
	private String password;
	private String name;
	private String tel;
	private String zipCode;
	private String addrBasic;
	private String addrDetail;
	private String grade;
	private int point;
	private boolean admin;
	
	private String sessionId;
	private Timestamp limitDate;
	
	//자동 로그인 체크 여부
	private boolean autoLogin;

}
