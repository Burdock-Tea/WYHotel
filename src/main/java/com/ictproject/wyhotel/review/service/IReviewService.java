package com.ictproject.wyhotel.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ictproject.wyhotel.command.ReviewVO;

public interface IReviewService {
	
	/** 리뷰등록*/
	void reviewRegist(ReviewVO vo);
	
	/**리뷰 목록 요청*/
	List<ReviewVO> getList();
	
	/**리뷰 갯수(페이징용)*/
	int getTotal(int bno);
	
	/**리뷰 수정*/
//	void update(ReviewVO vo);
	
	/**리뷰 삭제*/
	void delete (int rno);
	
	/**리뷰 유저 체크*/
	List<ReviewVO> regMemberChk(ReviewVO vo);
	
	/**리뷰 업데이트*/
	void reviewUpdate(Map<String, Object> prams);
	
	/**리뷰 업데이트 권한 체크 */
	String getUpdateAuthMember(String bno);
	
}
