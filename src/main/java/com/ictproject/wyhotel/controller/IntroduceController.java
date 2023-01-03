package com.ictproject.wyhotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * @author : 박민희
 * 작성일 : 22/12/29
 * version : 1.0
 * */

@Controller
@RequestMapping("/introduce")
public class IntroduceController {

	@GetMapping("/hotels")
	public void hotels() {};
	
	@GetMapping("/hotelsSinfo")
	public void hSinfo() {};
	
	@GetMapping("/hotelsBinfo")
	public void hBinfo() {};
	
	@GetMapping("/hotelsJinfo")
	public void hJinfo() {};
	
}
