package com.ictproject.wyhotel.review.service;

import java.util.List;

import com.ictproject.wyhotel.command.ReviewVO;

public interface IReviewService {
	
	/**
	 * 리뷰등록
	 */
	void reviewRegist(ReviewVO vo);
	
	/**
	 * 리뷰 목록 요청
	 */
	List<ReviewVO> getList(int bno, int pageNum);
	
	/**
	 * 리뷰 갯수(페이징용)
	 */
	int getTotal(int bno);
	
	/**
	 * 리뷰 수정
	 */
	void update(ReviewVO vo);
	
	/**
	 * 리뷰 삭제 
	 */
	void delete (int rno);
	
	
}
