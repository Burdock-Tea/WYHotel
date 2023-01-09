package com.ictproject.wyhotel.reservation.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ictproject.wyhotel.command.DiningReservationVO;
import com.ictproject.wyhotel.command.DiningVO;
import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.command.NotMemberVO;
import com.ictproject.wyhotel.command.ReservationVO;
import com.ictproject.wyhotel.command.RoomReservationVO;
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
	
	// 방 상세정보 가져오기
	RoomVO getRoomDetail(String roomCode);

	// 예약 데이터 정제
	ReservationVO cleansingData(ReservationVO reservation);

	// 비회원 코드 생성 및 리턴
	String createNmemCode(NotMemberVO nmember);

	// 다이닝 예약
	void reservDining(DiningReservationVO diningReserv, String strDate);

	// 비회원 로그인(예약조회)
	boolean nMemLogin(String reservationCode, String email);

	// 호텔 예약내역 리스트
	List<RoomReservationVO> getReservRoomList(HttpSession session);
	
	// 다이닝 예약내역 리스트
	List<DiningReservationVO> getReservDiningList(HttpSession session);

	// 다이닝 예약 상세내역 가져오기
	DiningReservationVO getReservDetailDining(String resvNum, HttpSession session);

	// 호텔 예약
	void reservRoom(RoomReservationVO roomReserv);

	// 비회원 회원정보
	MemberVO getInfo(String memberCode);

	// 객실 예약 상세내역 가져오기
	RoomReservationVO getReservDetailRoom(String resvNum, HttpSession session);

	// 다이닝 예약 취소
	void cancelDiningReservation(String resvNum, HttpSession session);

}
