package com.ictproject.wyhotel.admin.service;

import java.util.List;

import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.util.paging.PageCreator;
import com.ictproject.wyhotel.util.paging.PageVO;

public interface IAdminService {
	
	// 회원 목록 조회
	public List<MemberVO> getMemberList(PageVO paging);
	
	// Page 값 받아오기
	public PageCreator getPageCreator(PageVO paging);

	// 회원 하나의 정보를 불러오기 (비동기 통신)
	public MemberVO getMemberInfo(String memberCode);

	// 회원 정보 수정 처리
	public void updateMember(MemberVO member);

	// 회원 삭제 처리
	public void deleteMember(String memberCode);

	// 회원에게 임시비밀번호 발급
	public void updateTempPassword(MemberVO member);

}
