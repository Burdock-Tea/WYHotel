package com.ictproject.wyhotel.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DiningReservationVO {
	
	private String reservationCode;
	private String memberCode;
	private String reservationTime;
	private int reservationAmount;
	private String reservationRequest;
	
}
