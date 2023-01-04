package com.ictproject.wyhotel.reservation.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.command.DiningReservationVO;
import com.ictproject.wyhotel.command.DiningVO;
import com.ictproject.wyhotel.command.NotMemberVO;
import com.ictproject.wyhotel.command.ReservationVO;
import com.ictproject.wyhotel.command.RoomReservationVO;
import com.ictproject.wyhotel.command.RoomVO;
import com.ictproject.wyhotel.reservation.mapper.IReservationMapper;

@Service
public class ReservationServiceImpl implements IReservationService {

	@Autowired
	private IReservationMapper mapper;
	
	@Override
	public List<RoomVO> getRoomList(ReservationVO reservation) {
		
		String daterange = reservation.getDaterange();
		// daterange 정제
		String cInDate = daterange.substring(0, daterange.indexOf("-") - 1);
		String cOutDate = daterange.substring(daterange.indexOf("-") + 2);
		
		cInDate = cInDate.substring(cInDate.lastIndexOf("/") + 1) + "-"
				+ cInDate.substring(0, cInDate.indexOf("/")) + "-"
				+ cInDate.substring(cInDate.indexOf("/") + 1, cInDate.lastIndexOf("/"))
				+ " 00:00:00.0";
		
		cOutDate = cOutDate.substring(cOutDate.lastIndexOf("/") + 1) + "-"
				+ cOutDate.substring(0, cOutDate.indexOf("/")) + "-"
				+ cOutDate.substring(cOutDate.indexOf("/") + 1, cOutDate.lastIndexOf("/"))
				+ " 00:00:00.0";
		
		System.out.println(cInDate);
		System.out.println(cOutDate);
		
		Timestamp checkIn = Timestamp.valueOf(cInDate);
		Timestamp checkOut = Timestamp.valueOf(cOutDate);
		
		RoomReservationVO roomReserv = new RoomReservationVO();
		roomReserv.setCheckInDate(checkIn);
		roomReserv.setCheckOutDate(checkOut);
		roomReserv.setCapacity(reservation.getCapacity());
		roomReserv.setHotelCode(reservation.getHotelCode());
		
		return mapper.getRoomList(roomReserv);
	}
	
	@Override
	public List<DiningVO> getDiningList(ReservationVO reservation) {
		
		String daterange = reservation.getDaterange();
		
		daterange = daterange.substring(daterange.lastIndexOf("/") + 1) + "-"
				+ daterange.substring(0, daterange.indexOf("/")) + "-"
				+ daterange.substring(daterange.indexOf("/") + 1, daterange.lastIndexOf("/"))
				+ " 00:00:00.0";
		
		System.out.println("daterange: " + daterange);
		
		Timestamp reservationDate = Timestamp.valueOf(daterange);
		
		DiningReservationVO diningReserv = new DiningReservationVO();
		diningReserv.setReservationDate(reservationDate);
		diningReserv.setReservationTime(reservation.getReservationTime());
		diningReserv.setReservationAmount(reservation.getCapacity());
		diningReserv.setHotelCode(reservation.getHotelCode());
		
		return mapper.getDiningList(diningReserv);
	}
	
	@Override
	public RoomVO getRoomDetail(String roomCode) {
		
		return mapper.getRoomDetail(roomCode);
	}
	
	@Override
	public ReservationVO cleansingData(ReservationVO reservation) {
		
		String daterange = reservation.getDaterange();
		String category = reservation.getCategory();
		System.out.println(daterange);
		if (category.equals("dinings")) {
			daterange = daterange.substring(daterange.lastIndexOf("/") + 1) + "-"
					+ daterange.substring(0, daterange.indexOf("/")) + "-"
					+ daterange.substring(daterange.indexOf("/") + 1,daterange.lastIndexOf("/"));
			
			reservation.setDaterange(daterange);
		} else {
			String cInDate = daterange.substring(0, daterange.indexOf("-") - 1);
			String cOutDate = daterange.substring(daterange.indexOf("-") + 2);
			
			cInDate = cInDate.substring(cInDate.lastIndexOf("/") + 1) + "-"
					+ cInDate.substring(0, cInDate.indexOf("/")) + "-"
					+ cInDate.substring(cInDate.indexOf("/") + 1,cInDate.lastIndexOf("/"));
			
			cOutDate = cOutDate.substring(cOutDate.lastIndexOf("/") + 1) + "-"
					+ cOutDate.substring(0, cOutDate.indexOf("/")) + "-"
					+ cOutDate.substring(cOutDate.indexOf("/") + 1,cOutDate.lastIndexOf("/"));
			
			reservation.setDaterange(cInDate + " / " + cOutDate);
		}

		
		return reservation;
	}
	
	@Override
	public String createNmemCode(NotMemberVO nmember) {
		
		mapper.createNmemCode(nmember);
		
		System.out.println("비회원 회원코드: " + mapper.selectNmemCode(nmember));
		return mapper.selectNmemCode(nmember);
	}
	
	@Override
	public void reservDining(DiningReservationVO diningReserv, String strDate) {

		// reservationDate 추가
		diningReserv.setReservationDate(Timestamp.valueOf(strDate + " 00:00:00.0"));
		System.out.println("resrvDate: " + diningReserv.getReservationDate());
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		String reservCode = sdf.format(today);
		System.out.println("예약코드: " + reservCode);
		reservCode = reservCode
					+ diningReserv.getHotelCode()
					+ diningReserv.getResCode()
					+ diningReserv.getMemberCode();
		System.out.println("예약코드: " + reservCode);
		diningReserv.setReservationCode(reservCode);
		System.out.println("diningReserv: " + diningReserv);
		
		mapper.reservDining(diningReserv);
	}
	
	@Override
	public boolean nMemLogin(String reservationCode, String email) {
		
		boolean bFlag = false;
		int cnt = mapper.nMemLogin(reservationCode, email);
		
		if (cnt > 0) bFlag = true;
		
		return bFlag;
	}
	
	@Override
	public List<RoomReservationVO> getReservRoomList(HttpSession session) {
		
		String memberCode = (String)session.getAttribute("member");
		String isMem = memberCode.substring(0, 1);
		
		System.out.println("isMem: " + isMem);
		
		
		
		List<RoomReservationVO> list = mapper.getReservRoomList(memberCode, isMem);
		List<String> roomList = mapper.getRooms(); 
		
		list.forEach(roomReserv -> {
			String hotelCode = roomReserv.getHotelCode();
			int idx = Integer.parseInt(roomReserv.getRoomCode().substring(1)) - 1;
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
	public List<DiningReservationVO> getReservDiningList(HttpSession session) {
		
		String memberCode = (String)session.getAttribute("member");
		String isMem = memberCode.substring(0, 1);
		
		System.out.println("isMem: " + isMem);
		
		List<DiningReservationVO> list = mapper.getReservDiningList(memberCode, isMem);
		
		
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
	public DiningReservationVO getReservDetailDining(String resvNum, HttpSession session) {
		
		List<DiningReservationVO> list = getReservDiningList(session);
		
		DiningReservationVO vo = null;
		
		for (DiningReservationVO detail : list) {
			if (detail.getReservationCode().equals(resvNum)) {
				vo = detail;
				break;
			}
		}
		
		return vo;
	}

}
