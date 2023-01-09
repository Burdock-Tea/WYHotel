package com.ictproject.wyhotel.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ictproject.wyhotel.command.MemberVO;

public interface IAdminMapper {
	
	// 회원 목록 조회
	public List<MemberVO> getMemberList(@Param("category") String category, @Param("search") String search);

	// 회원 하나의 정보를 불러오기 (비동기 통신)
	public MemberVO getMemberInfo(String memberCode);

	// 회원 정보 수정 처리
	public void updateMember(MemberVO member);

	// 회원 삭제 처리
	public void deleteMember(@Param("memberCode") String memberCode);

	// 회원에게 임시비밀번호 변경
	public void updateTempPassword(MemberVO member);

}
