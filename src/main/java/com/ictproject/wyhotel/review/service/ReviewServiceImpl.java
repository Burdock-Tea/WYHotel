package com.ictproject.wyhotel.review.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ictproject.wyhotel.command.PromotionReservationVO;
import com.ictproject.wyhotel.command.PromotionUploadVO;
import com.ictproject.wyhotel.command.PromotionVO;
import com.ictproject.wyhotel.command.ReservationVO;
import com.ictproject.wyhotel.command.ReviewVO;
import com.ictproject.wyhotel.promotion.mapper.IPromotionMapper;
import com.ictproject.wyhotel.review.mapper.IReviewMapper;
import lombok.extern.log4j.Log4j;
import oracle.sql.DATE;

@Service
public class ReviewServiceImpl implements IReviewService {

	@Autowired
	private IReviewMapper mapper;
	
	// 리뷰등록
	@Override
	public void reviewRegist(ReviewVO vo){
		mapper.replyRegist(vo);
	}

	// 리뷰 목록 요청
	@Override
	public List<ReviewVO> getList(int bno, int pageNum){
		return null;
	}
	
	// 리뷰 갯수
	@Override
	public int getTotal(int bno){
		return 0;
	}
	
	// 리뷰수정
	@Override
	public void update(ReviewVO vo) {
		
	}
	
	// 리뷰 삭제
	@Override
	public void delete(int rno) {
		
	}

	
	
}
