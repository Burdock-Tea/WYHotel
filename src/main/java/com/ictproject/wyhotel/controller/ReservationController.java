package com.ictproject.wyhotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	// 내 예약 페이지로 이동
	@GetMapping("/myReservations")
	public void myReservation(){}
	
	// 예약하기 페이지로 이동
	@GetMapping("/reservationPage")
	public void reservationPage(){}
	
}
