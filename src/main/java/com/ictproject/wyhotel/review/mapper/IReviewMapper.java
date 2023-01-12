package com.ictproject.wyhotel.review.mapper;

import java.util.List;

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
	
	
}
