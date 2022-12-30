package com.ictproject.wyhotel.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
	다이닝 테이블 vo 하나로 몰았습니다.
*/
@Getter
@Setter
@ToString
public class DiningVO {

	private String resCode;
	private String resName;
	private int resTables;
	private String resInfo;
	// 남은 테이블 수 
	private int remainTables;
}
