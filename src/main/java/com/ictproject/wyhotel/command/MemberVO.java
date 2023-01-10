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
	/**
	 * 작 성 자 : 백 건 욱
	 * 수 정 일 : 2023-01-09
	 * 내     용 : 컬럼 추가로 인한 필드값 추가
	 * */
	private Timestamp membershipPurchaseDate;
	private String membershipPaymentKey;
	// 백건욱 수정내용 종료
	
	private int point;
	private boolean admin;
	
	private String sessionId;
	private Timestamp limitDate;
	
	//자동 로그인 체크 여부
	private boolean autoLogin;
	
}
