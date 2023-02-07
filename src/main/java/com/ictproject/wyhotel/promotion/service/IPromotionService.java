package com.ictproject.wyhotel.promotion.service;

import java.util.List;

import com.ictproject.wyhotel.command.PromotionReservationVO;
import com.ictproject.wyhotel.command.PromotionUploadVO;
import com.ictproject.wyhotel.command.PromotionVO;
import com.ictproject.wyhotel.command.ReservationVO;

public interface IPromotionService {
	
	// 프로모션 등록
	public void insert(PromotionUploadVO upload);

	// 프로모션 목록 불러오기
	public List<PromotionVO> getList(String hotelCode, String startDate, String endDate);

	// 프로모션 상세보기
	public PromotionVO getPromotion(String promotionCode);
	
	// 프로모션 수정
	public void update(PromotionUploadVO upload, String imageUpdate);

	// 프로모션 삭제
	public void delete(String promotionCode);

	// 프로모션 예약페이지로 이동하기 위한 데이터 정제
	public ReservationVO convertReservationData(PromotionReservationVO data);
}
