package com.ictproject.wyhotel.command;

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

}
