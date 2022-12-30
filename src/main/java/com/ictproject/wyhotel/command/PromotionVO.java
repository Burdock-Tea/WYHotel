package com.ictproject.wyhotel.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PromotionVO {
	
	/**
	 * 작 성 일 : 2022/12/30
	 * 작 성 자 : 권 우 영
	 * */
	
	private String promotionCode;
	private String hotelCode;
	private String roomCode;
	private String promotionName;
	private Timestamp startDate;
	private Timestamp endDate;
	private int promotionPrice;
	private String promotionContent;
	private String uploadPath;
	private String fileLocation;
	private String fileName;
	private String fileRealName;

}