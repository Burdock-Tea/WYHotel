package com.ictproject.wyhotel.promotion.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ictproject.wyhotel.command.PromotionVO;

public interface IPromotionMapper {
	
	// 프로모션 등록
	public void insert(PromotionVO vo);

	// 프로모션 리스트 불러오기
	public List<PromotionVO> getList(@Param("hotelCode") String hotelCode, @Param("startDate") String startDate, @Param("endDate") String endDate);

	// 프로모션 상세보기
	public PromotionVO getPromotion(String promotionCode);
	
	// 프로모션 업데이트
	public void update(Map<String, Object> data);

	// 프로모션 삭제
	public void delete(String promotionCode);


}
