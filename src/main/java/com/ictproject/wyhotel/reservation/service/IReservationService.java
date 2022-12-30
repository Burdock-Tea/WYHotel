package com.ictproject.wyhotel.reservation.service;

import java.util.List;

import com.ictproject.wyhotel.command.DiningVO;
import com.ictproject.wyhotel.command.ReservationVO;
import com.ictproject.wyhotel.command.RoomVO;

public interface IReservationService {
	
	/**
	 * 작 성 일 : 2022/12/29
	 * 작 성 자 : 백 건 욱
	 * */
	// 방 목록 뿌려주기
	List<RoomVO> getRoomList(ReservationVO reservation);
	
	// 다이닝 리스트 뿌려주기
	List<DiningVO> getDiningList(ReservationVO reservation);

}
