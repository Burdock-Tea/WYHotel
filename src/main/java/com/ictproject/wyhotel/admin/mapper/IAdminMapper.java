package com.ictproject.wyhotel.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ictproject.wyhotel.command.DiningReservationVO;
import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.command.QuestionVO;
import com.ictproject.wyhotel.command.RoomReservationVO;
import com.ictproject.wyhotel.util.paging.PageVO;

public interface IAdminMapper {
	
	// 회원 목록 조회
	public List<MemberVO> getMemberList(PageVO paging);
	
	// 총 회원 갯수 가지고옵시다
	public int getMemberCount(PageVO paging);

	// 회원 하나의 정보를 불러오기 (비동기 통신)
	public MemberVO getMemberInfo(String memberCode);

	// 회원 정보 수정 처리
	public void updateMember(MemberVO member);

	// 회원 삭제 처리
	public void deleteMember(@Param("memberCode") String memberCode);

	// 회원에게 임시비밀번호 변경
	public void updateTempPassword(MemberVO member);

	// 문의내역 리스트 가지고오기
	public List<QuestionVO> getQuestionList();

	// 문의내역 하나 가지고오기
	public QuestionVO getQuestion(@Param("questionCode") String questionCode);

	// 문의내역 답변 이후 DB에 업데이트 처리
	public void updateQuestion(QuestionVO vo);

	// 관리자 예약내역 리스트 출력 (객실) 
	public List<RoomReservationVO> getRoomReservList(Map<String, String> data);

	// 관리자 예약내역 리스트 출력 (다이닝)	
	public List<DiningReservationVO> getDiningReservList(Map<String, String> data);
	
	// 객실 정보 불러오기
	public List<String> getRooms();
	
	// 호텔별 다이닝 이름 리스트
	public List<String> getDinings(@Param("hotelCode") String hotelCode);

	// 객실 예약 취소
	public int cancelRoomReservation(@Param("reservationCode") String reservationCode);

	// 다이닝 예약 취소
	public int cancelDiningReservation(@Param("reservationCode") String reservationCode);

}
