package com.ictproject.wyhotel.member.service;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.ictproject.wyhotel.command.MemberVO;

public interface IMemberService {
	
	//로그인
	MemberVO login(@Param("email") String email, @Param("password") String password);
	
	//정보 가져오기
	MemberVO getInfo(String memberCode);
	
	//정보수정
	void modify(MemberVO vo);
	
	//비밀번호 변경
	void pwModify(MemberVO vo);
	
	//삭제
	void delete(String memberCode);
	
	//비밀번호 확인
	int pwChk(String email);
	
	//이메일 가져오기
	String getEmail(String memberCode);
	
	//아이디 찾기
	String searchId(@Param("name") String name, @Param("tel") String tel);
	
	//비밀번호 수정(비로그인)
	void newPw(@Param("email") String email, @Param("password") String password);
	
	//자동 로그인 쿠키값 DB 저장 처리
	void keepLogin(String session, Date limitTime, String account);
	
}
