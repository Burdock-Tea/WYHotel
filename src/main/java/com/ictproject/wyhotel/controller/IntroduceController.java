package com.ictproject.wyhotel.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@Value("${kakao.key}")
	private String kakaoKey;
		
	@GetMapping("/hotels")
	public void hotels(Model model) {
		
	};
	
	@GetMapping("/hotelsSinfo")
	public void hSinfo(Model model) {
		model.addAttribute("kakaoKey", kakaoKey);
	};
	
	@GetMapping("/hotelsBinfo")
	public void hBinfo(Model model) {
		model.addAttribute("kakaoKey", kakaoKey);
	};
	
	@GetMapping("/hotelsJinfo")
	public void hJinfo(Model model) {
		model.addAttribute("kakaoKey", kakaoKey);
	};
	
	
}
