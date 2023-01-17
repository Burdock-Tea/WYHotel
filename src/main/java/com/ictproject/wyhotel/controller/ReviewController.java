package com.ictproject.wyhotel.controller;


import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ictproject.wyhotel.command.ReviewVO;
import com.ictproject.wyhotel.review.service.IReviewService;


/**
 * 작 성 일 : 2022/01/11
 * 작 성 자 : 박민희
 * */

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private IReviewService service;
	
	@GetMapping("/review")
	public void reviewPage() {}
	
	@ResponseBody
	@PostMapping("/reviewRegist")
 	public String reviewRegist(@RequestBody ReviewVO vo, HttpSession session){
		
		String memberCode = (String) session.getAttribute("member");
		vo.setMemberCode(memberCode);
		
		service.reviewRegist(vo);
		
		return "regSuccess";
	}
	
	@PostMapping("/reviewList")
	public String reviewList(@RequestBody ReviewVO vo) {
		
//		vo.setMemberCode("session");
		System.out.println(vo.toString());
		
		return "regSuccess";
	}

}
