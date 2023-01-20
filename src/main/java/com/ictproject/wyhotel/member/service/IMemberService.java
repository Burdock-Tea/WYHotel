package com.ictproject.wyhotel.member.service;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.command.MembershipVO;

public interface IMemberService {
	
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
	void keepLogin(String session, Date limitTime, String email);
	
	//전화번호 중복 체크
	int telChk(String tel);
	
	/**
	 *	작 성 자 : 백 건 욱
	 *	작 성 일 : 2023-01-09
	 *	내     용 : 멤버십 관련 메소드 추가
	 * */

	// 멤버십 상세정보
	MembershipVO getMembershipInfo(String grade);

	// 멤버십 구매 처리
	void updateMembership(MemberVO member, String paymentKey);

	// 포인트 적립
	void accumulatePoint(String memberCode, String pointAccumulate);

	// 관리자여부 조회
	boolean isAdmin(String memberCode);
	
}
