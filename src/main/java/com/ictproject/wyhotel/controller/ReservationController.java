package com.ictproject.wyhotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ictproject.wyhotel.command.ReservationVO;
import com.ictproject.wyhotel.command.RoomVO;
import com.ictproject.wyhotel.reservation.service.IReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private IReservationService service;
	
	/**
	 * 작 성 일 : 2022/12/29
	 * 작 성 자 : 백 건 욱
	 * */
	// 내 예약 확인페이지 이동
	@GetMapping("/myReservations")
	public void myReservation() {}
	
	// 예약하기 페이지 이동
	@GetMapping("/reservationPage")
	public void reservationPage() {}
	
	// 예약 검색기록 띄우기
	@PostMapping("/reservationPage")
	public void roomResult(@ModelAttribute("reservation") ReservationVO reservation,
							Model model) {
		
		if (reservation.getCategory().equals("hotels")) {
			model.addAttribute("resultList", service.getRoomList(reservation));
		} else {			
			model.addAttribute("resultList", service.getDiningList(reservation));
		}
		
		System.out.println(model.getAttribute("resultList"));
		
	}
	
	// 방 상세정보
	@ResponseBody
	@GetMapping("/roomDetail")
	public RoomVO getRoomDetail(String roomCode) {
		
		return service.getRoomDetail(roomCode);
	}
	
	// 결제페이지 이동
	@PostMapping("/payment")
	public void movePaymentPage(@ModelAttribute("reservation") ReservationVO reservation,
								Model model) {
		
		String category = reservation.getCategory();
		
		if (category.equals("dinings")) {
			model.addAttribute("list", service.getDiningList(reservation));
			reservation = service.cleansingData(reservation);
		} else {
			model.addAttribute("list", service.getRoomList(reservation));
			reservation = service.cleansingData(reservation);
			System.out.println("daterange after cleansing: " + reservation.getDaterange());
		}
	}

}
