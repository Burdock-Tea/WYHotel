package com.ictproject.wyhotel.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationVO {
	
	private String category;
	private String hotelCode;
	private int capacity;
	// 연령대 삭제 22/12/30
	// 시간대 추가
	private String reservationTime;
	private String daterange;
	
	// 예약을 위한 code 변수 추가(res or room)
	private String code;

}
