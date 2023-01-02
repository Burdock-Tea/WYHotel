package com.ictproject.wyhotel.promotion.mapper;

import java.util.List;

import com.ictproject.wyhotel.command.PromotionVO;

public interface IPromotionMapper {
	
	public void insert(PromotionVO vo);

	public List<PromotionVO> getList();

	public PromotionVO getPromotion(String promotionCode);

}
