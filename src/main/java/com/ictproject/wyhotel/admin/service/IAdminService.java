package com.ictproject.wyhotel.admin.service;

import java.util.List;

import com.ictproject.wyhotel.command.MemberVO;

public interface IAdminService {
	
	// 회원 목록 조회
	public List<MemberVO> getMemberList(String category, String search);

	// 회원 하나의 정보를 불러오기 (비동기 통신)
	public MemberVO getMemberInfo(String memberCode);

	// 회원 정보 수정 처리
	public void updateMember(MemberVO member);

	// 회원 삭제 처리
	public void deleteMember(String memberCode);

}
