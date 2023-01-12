package com.ictproject.wyhotel.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	
	private int bno;  
	private String memberCode; 
	private String content;   
	private Timestamp regDate;  
	private Timestamp modifyDate; 
	private int grade; 
}
