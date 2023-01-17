package com.ictproject.wyhotel.cs.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.command.QuestionVO;
import com.ictproject.wyhotel.cs.mapper.ICsMapper;

@Service
public class CsServiceImp implements ICsService {
	
	@Autowired
	private ICsMapper mapper;

	@Override
	public void insert(Map<String, String> data) {
		
		QuestionVO vo = new QuestionVO();
		
		// 정제작업 시작
		// 호텔코드 정제
		if(data.get("branch").equals("WY 서울지점")) {
			vo.setHotelCode("10");
		} else if(data.get("branch").equals("WY 부산지점")) {
			vo.setHotelCode("20");
		} else if(data.get("branch").equals("WY 제주지점")) {
			vo.setHotelCode("30");
		}
		
		// 질문유형 정제
		if(data.get("qnaType").equals("예약변경")) {
			vo.setQuestionCategory("1");
		} else if(data.get("qnaType").equals("결제문의")) {
			vo.setQuestionCategory("2");
		} else if(data.get("qnaType").equals("패키지문의")) {
			vo.setQuestionCategory("3");
		}
		
		// 이메일 정제
		vo.setCustomerEmail(data.get("email"));
		
		// 전화번호 정제
		vo.setCustomerTel(data.get("phone1") + "-" + data.get("phone2") + "-" + data.get("phone3"));
		
		// 문의내역 제목 정제
		vo.setQuestionTitle(data.get("title"));
		
		// 문의내역 내용 정제
		vo.setQuestionContent(data.get("content"));
		
		mapper.insert(vo);
		
	}

}
