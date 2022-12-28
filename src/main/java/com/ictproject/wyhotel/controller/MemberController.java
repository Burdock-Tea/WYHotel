package com.ictproject.wyhotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	/**
	 * 작성일 : 22/12/28
	 * 작성자 : 백건욱
	 * */
	
	// 로그인 페이지 이동
	@GetMapping("/login")
	public void loginPage(){}
	
	// 회원가입 페이지 이동
	@GetMapping("/join")
	public void joinPage(){}
	
	// 회원정보 수정 페이지 이동
	@GetMapping("/modify")
	public void modifyPage(){}
	
	// 비밀번호 수정 페이지 이동
	@GetMapping("/pwModify")
	public void pwModifyPage(){}
	
	// 회원탈퇴 페이지
	@GetMapping("/delete")
	public void deletePage(){}

}
