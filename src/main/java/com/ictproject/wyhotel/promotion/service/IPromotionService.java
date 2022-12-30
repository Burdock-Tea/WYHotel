package com.ictproject.wyhotel.promotion.service;

import java.util.List;

import com.ictproject.wyhotel.command.PromotionUploadVO;
import com.ictproject.wyhotel.command.PromotionVO;

public interface IPromotionService {
	
	// 프로모션 등록
	public void insert(PromotionUploadVO upload);

	// 프로모션 목록 불러오기
	public List<PromotionVO> getList();

}
