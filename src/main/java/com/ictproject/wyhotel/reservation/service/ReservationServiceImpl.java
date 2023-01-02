package com.ictproject.wyhotel.reservation.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.command.DiningReservationVO;
import com.ictproject.wyhotel.command.DiningVO;
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

}
