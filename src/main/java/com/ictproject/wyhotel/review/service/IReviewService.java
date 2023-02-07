package com.ictproject.wyhotel.review.service;

import java.util.List;
import java.util.Map;

import com.ictproject.wyhotel.command.ReviewVO;

public interface IReviewService {
	
	/** 리뷰등록*/
	void reviewRegist(ReviewVO vo);
	
	/**리뷰 목록 요청*/
	List<ReviewVO> getList();
	
	/**리뷰 삭제*/
	void delete (int bno);
	
	/**리뷰 유저 체크*/
	List<ReviewVO> regMemberChk(ReviewVO vo);
	
	/**리뷰 업데이트*/
	void reviewUpdate(Map<String, Object> prams);
	
	/**리뷰 업데이트 권한 체크 */
	String getUpdateAuthMember(String bno);

	/**예약번호 리뷰가 있니?*/
	boolean check(String reservationCode);
	
}
