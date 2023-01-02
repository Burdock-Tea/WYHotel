package com.ictproject.wyhotel.reservation.mapper;

import java.util.List;

import com.ictproject.wyhotel.command.DiningReservationVO;
import com.ictproject.wyhotel.command.DiningVO;
import com.ictproject.wyhotel.command.RoomReservationVO;
import com.ictproject.wyhotel.command.RoomVO;

public interface IReservationMapper {
	
	/**
	 * 작 성 일 : 2022/12/29
	 * 작 성 자 : 백 건 욱
	 * */
	// 방 목록 뿌려주기
	List<RoomVO> getRoomList(RoomReservationVO roomReserv);
	
	// 다이닝 목록 뿌려주기
	List<DiningVO> getDiningList(DiningReservationVO diningReserv);
	
	// 방 상세정보 가져오기
	RoomVO getRoomDetail(String roomCode);
	
}
