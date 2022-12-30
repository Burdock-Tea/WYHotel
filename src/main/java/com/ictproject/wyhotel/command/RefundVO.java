package com.ictproject.wyhotel.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RefundVO {
	
	private String refundCode;
	private String reservationCode;
	private String refundMethod;
	private Timestamp refundDate;

}
