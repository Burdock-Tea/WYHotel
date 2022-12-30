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
	private String age;
	private String daterange;

}
