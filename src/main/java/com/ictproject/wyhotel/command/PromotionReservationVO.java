package com.ictproject.wyhotel.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PromotionReservationVO {
	
	/**
	 * 작 성 일 : 2023/01/06
	 * 작 성 자 : 권 우 영
	 * */

	private int capacity;
	private String daterange;
	private String promotionCodeData;
	
}
