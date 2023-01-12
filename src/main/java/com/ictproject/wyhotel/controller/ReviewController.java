package com.ictproject.wyhotel.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.command.ReviewVO;
import com.ictproject.wyhotel.member.service.IMemberService;
import com.ictproject.wyhotel.reservation.service.IReservationService;
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
	
	@Autowired
	private IMemberService mService;
	
	@Autowired
	private IReservationService rService;
	
	@GetMapping("/review")
	public void reviewPage(Model model) {
//		String memberCode = (String)session.getAttribute("member");
//		String isMem = memberCode.substring(0, 1);
//		
//		MemberVO member = new MemberVO();
//		if (isMem.equals("1") || isMem.equals("2")) {
//			member = rService.getInfo(memberCode); // 예약한 비회원 정보 조회
//		} else {
//			member = mService.getInfo(memberCode); // 회원정보 조회
//		}
//		
//		model.addAttribute("info", member);
		List<ReviewVO> list = service.getList();
		model.addAttribute("list", list);
	}
	
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
		
		vo.setMemberCode("session");
		System.out.println(vo.toString());
		
		return "regSuccess";
	}

}
