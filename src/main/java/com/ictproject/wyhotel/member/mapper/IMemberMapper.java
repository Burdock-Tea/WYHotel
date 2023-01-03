package com.ictproject.wyhotel.member.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ictproject.wyhotel.command.MemberVO;

public interface IMemberMapper {
	
	/*
	 * 작업일 2022.12.29 임영준
	 */
	
	//아이디 중복 확인
	int idcheck(String email);
	
	// 회원가입
	void join(MemberVO vo);
	
	/*
	 * 작업일 2022.12.29 이준희
	 */
	
	//로그인
	MemberVO login(String email);
	
	//정보 가져오기
	MemberVO getInfo(String memberCode);
	
	//정보수정
	void modify(MemberVO vo);
	
	//비밀번호 변경
	void pwModify(MemberVO vo);
	
	//삭제
	void delete(String memberCode);
	
	//비밀번호 확인
	String pwChk(String email);
	
	//이메일 가져오기
	String getEmail(String memberCode);
	
	//아이디 찾기
	String searchId(@Param("name") String name, @Param("tel") String tel);
	
	//비밀번호 수정(비로그인)
	void newPw(@Param("email") String email, @Param("password") String password);
	
	//자동 로그인 쿠키값 DB 저장 처리
	void keepLogin(Map<String, Object> data);
	
	//세션 id로 정보 조회 후 계속 로그인 중인 것처럼 세션 데이터를 만들어 주자
	MemberVO getMemberWithSessionId(String sessionId);
	
}
















