package com.ictproject.wyhotel.review.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.command.ReviewVO;
import com.ictproject.wyhotel.review.mapper.IReviewMapper;

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
	public List<ReviewVO> getList(){
		return mapper.getList();
	}
	
	// 리뷰 삭제
	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}
    
	//리뷰 유저 체크 
	@Override
	public List<ReviewVO> regMemberChk(ReviewVO vo) {
		return mapper.regMemberChk(vo);
	}
	
	//리뷰 업데이트
	@Override
	public void reviewUpdate(Map<String, Object> prams) {
		mapper.update(prams);
	}
	
	//리뷰 업데이트 권한 체크
	@Override
	public String getUpdateAuthMember(String bno) {
		return mapper.getUpdateAuthMember(bno);
	}
	
	@Override
	public boolean check(String reservationCode) {
		return (mapper.check(reservationCode) == 0 ? true : false);
	}

	
	
}
