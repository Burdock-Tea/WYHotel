package com.ictproject.wyhotel.cs.mapper;

import com.ictproject.wyhotel.command.QuestionVO;

public interface ICsMapper {

	// 문의내역 DB에 저장
	public void insert(QuestionVO vo);
	
}
