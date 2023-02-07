package com.ictproject.wyhotel.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.admin.mapper.IAdminMapper;
import com.ictproject.wyhotel.command.DiningReservationVO;
import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.command.QuestionVO;
import com.ictproject.wyhotel.command.RoomReservationVO;
import com.ictproject.wyhotel.util.MailSendService;
import com.ictproject.wyhotel.util.paging.PageCreator;
import com.ictproject.wyhotel.util.paging.PageVO;

@Service
public class AdminServiceImpl implements IAdminService {

	@Autowired
	private IAdminMapper mapper;
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private PageCreator pc;
	
	@Override
	public List<MemberVO> getMemberList(PageVO paging) {		
		return mapper.getMemberList(paging);
	}
	
	@Override
	public PageCreator getPageCreator(PageVO paging) {
		pc.setPaging(paging);
		pc.setArticleTotalCount(mapper.getMemberCount(paging));
		return pc;
	}
	
	@Override
	public MemberVO getMemberInfo(String memberCode) {	
		return mapper.getMemberInfo(memberCode);
	}
	
	@Override
	public void updateMember(MemberVO member) {
		mapper.updateMember(member);		
	}
	
	@Override
	public void deleteMember(String memberCode) {
		mapper.deleteMember(memberCode);		
	}
	
	@Override
	public void updateTempPassword(MemberVO member) {
		// 메일도 보내고, 리턴값으로 변경되는 임시 비밀번호 받아옴
		String tempPassword = mailService.sendPasswordEmail(member.getEmail());
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();	
		
		member.setPassword(encoder.encode(tempPassword));
		
		mapper.updateTempPassword(member);
	}
	
	// 문의내역 관련 서비스
	// 문의내역 리스트 가져오기
	@Override
	public List<QuestionVO> getQuestionList() {	
		
		return mapper.getQuestionList();
		
	}
	
	// 문의내역 하나 가져오기
	@Override
	public QuestionVO getQuestion(String questionCode) {
		return mapper.getQuestion(questionCode);
	}
	
	// 메일도 보내고, DB에 값 수정 진행해야함!
	@Override
	public boolean replyQuestion(QuestionVO question) {
		// 완전체 VO 세팅 (메일에 필요한 내용이니까 왠만해서는 다 가져가자)
		QuestionVO vo = mapper.getQuestion(question.getQuestionCode());
		vo.setQuestionAnswer(question.getQuestionAnswer());
		
		// 메일이 정상적으로 보내졌으면 true 리턴
		if(mailService.sendQuestionReply(vo)) {
			mapper.updateQuestion(vo);
			return true;
		} else {
			return false;
		}		
		
	}	
	
	
	// 예약내역 중 호텔 예약 리스트 불러오는 서비스
	@Override
	public List<RoomReservationVO> getRoomReservList(Map<String, String> data) {
		/*
			data.get("category");
			data.get("isMem");
			data.get("keyword");
		*/
		
		List<RoomReservationVO> list = mapper.getRoomReservList(data);
		List<String> roomList = mapper.getRooms(); 
		
		list.forEach(roomReserv -> {
			String hotelCode = roomReserv.getHotelCode();
			int idx = 5 - Integer.parseInt(roomReserv.getRoomCode().substring(1));
			roomReserv.setRoomCode(roomList.get(idx));
			
			if (hotelCode.equals("10")) {
				roomReserv.setHotelCode("WY 호텔 서울");
			} else if (hotelCode.equals("20")) {
				roomReserv.setHotelCode("WY 호텔 부산");
			} else {
				roomReserv.setHotelCode("WY 호텔 제주");
			}
		});
		
		
		return list;
	}

	@Override
	public List<DiningReservationVO> getDiningReservList(Map<String, String> data) {
		/*
			data.get("category");
			data.get("isMem");
			data.get("keyword");
		*/
		
		List<DiningReservationVO> list = mapper.getDiningReservList(data);
		
		list.forEach(dineReserv -> {
			String hotelCode = dineReserv.getHotelCode();
			int idx = Integer.parseInt(dineReserv.getResCode()) - 1;
			if (hotelCode.equals("10")) {
				List<String> resList = mapper.getDinings(hotelCode);
				dineReserv.setResCode(resList.get(idx));
				dineReserv.setHotelCode("WY 호텔 서울");
			} else if (hotelCode.equals("20")) {
				List<String> resList = mapper.getDinings(hotelCode);
				dineReserv.setResCode(resList.get(idx));
				dineReserv.setHotelCode("WY 호텔 부산");
			} else {
				List<String> resList = mapper.getDinings(hotelCode);
				dineReserv.setResCode(resList.get(idx));
				dineReserv.setHotelCode("WY 호텔 제주");
			}
		});
		
		return list;
	}
	
	@Override
	public int cancelRoomReservation(String reservationCode) {
		
		return mapper.cancelRoomReservation(reservationCode);		
	}
	
	@Override
	public int cancelDiningReservation(String reservationCode) {
		
		return mapper.cancelDiningReservation(reservationCode);
	}
}
