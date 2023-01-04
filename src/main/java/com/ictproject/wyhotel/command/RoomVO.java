package com.ictproject.wyhotel.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RoomVO {
	
	private String roomCode;
	private String roomGrade;
	private String roomPrice;
	private String roomInfo;
	
	// 방 갯수 조회용
	private int roomCount;
	
	// 잔여객실 조회용
	private int remainRoomCnt;

}
