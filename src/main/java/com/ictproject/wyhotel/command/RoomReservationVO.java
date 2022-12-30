package com.ictproject.wyhotel.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RoomReservationVO {
	
	private String reservationCode;
	private String hotelCode;
	private String roomCode;
	private String memberCode;
	private int capacity;
	private Timestamp checkInDate;
	private Timestamp checkOutDate;
	private boolean isDining;
	private Timestamp chargedDate;

}
