package com.ictproject.wyhotel.review.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ictproject.wyhotel.command.ReviewVO;

public interface IReviewMapper {
	
	// 댓글 등록
	void replyRegist(ReviewVO vo);
	
	// 댓글 목록 요청
	List<ReviewVO> getList();
	
	// 댓글 갯수(페이징)
	int getTotal(int bno);
	
	// 댓글 수정 처리
	void update(ReviewVO vo);
	
	// 댓글 삭제
	void delete(int rno);
	
	// 리뷰 유저 체크
	List<ReviewVO> regMemberChk(ReviewVO vo);
	
	//업데이트
	void update(Map<String, Object> prams);
	
	//리뷰 업데이트 권한 체크
	String getUpdateAuthMember(String bno);
	
	
}
