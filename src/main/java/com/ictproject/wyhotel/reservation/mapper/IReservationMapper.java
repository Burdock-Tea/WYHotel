package com.ictproject.wyhotel.reservation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ictproject.wyhotel.command.DiningReservationVO;
import com.ictproject.wyhotel.command.DiningVO;
import com.ictproject.wyhotel.command.NotMemberVO;
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

	// 비회원 코드 생성
	void createNmemCode(NotMemberVO nmember);
	
	// 비회원 코드 조회
	String selectNmemCode(NotMemberVO nmember);

	// 다이닝 예약
	void reservDining(DiningReservationVO diningReserv);

	// 비회원 로그인
	int nMemLogin(@Param("reservationCode") String reservationCode, @Param("email") String email);
	
	// 호텔 예약내역 리스트
	List<RoomReservationVO> getReservRoomList(@Param("memberCode") String memberCode, @Param("isMem") String isMem);
	
	// 다이닝 예약내역 리스트
	List<DiningReservationVO> getReservDiningList(@Param("memberCode") String memberCode, @Param("isMem") String isMem);

	// 호텔별 다이닝 이름 리스트
	List<String> getDinings(@Param("hotelCode") String hotelCode);

	// 객실 이름 리스트
	List<String> getRooms();

	// 객실 예약
	void reservRoom(RoomReservationVO roomReserv);
	
}
