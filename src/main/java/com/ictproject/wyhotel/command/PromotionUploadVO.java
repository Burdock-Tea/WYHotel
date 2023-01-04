package com.ictproject.wyhotel.command;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PromotionUploadVO {
	
	/**
	 * 작 성 일 : 2022/12/30
	 * 작 성 자 : 권 우 영
	 * */
	
	private String promotionCode;
	private String hotelCode;
	private String roomCode;
	private String promotionName;
	private String startDate; // 추후 TimeStamp 변경 필요
	private String endDate; // 추후 TimeStamp 변경 필요
	private int promotionPrice;
	private String promotionContent;	
	private MultipartFile file; // 추후 경로 작업 필요
	
}
