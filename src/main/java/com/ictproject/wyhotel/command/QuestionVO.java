package com.ictproject.wyhotel.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class QuestionVO {
	
	private String questionCode;
	private String hotelCode;
	private String questionCategory;
	private String customerEmail;
	private String customerTel;
	private String questionTitle;
	private String questionContent;
	private String questionAnswer;
	private Timestamp questionDate;
	private Timestamp answerDate;

}
