package com.ictproject.wyhotel.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
//	@Autowired
//	private IMemberService mService;
	
//	@Autowired
//	private IReservationService rService;
	
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
		System.out.println("list 값 :"+ list);
	}
	
	@ResponseBody
	@PostMapping("/reviewRegist")
 	public String reviewRegist(@RequestBody ReviewVO vo, HttpSession session){
		
		System.out.println("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆vo : " + vo + "☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆" );
		
		List<ReviewVO> list = null;
		list = service.regMemberChk(vo);
		
		if(list.isEmpty()) {
			System.out.println("실패");
			return "regFail";
		}else {
			System.out.println("성공");
			System.out.println("★★★★★★★★★★★★★★★★★★★★★★★list" + list.get(0).toString()+"★★★★★★★★★★★★★★★★★★★★★★");
			vo.setReservationCode(list.get(0).getReservationCode());
			service.reviewRegist(vo);
			return "regSuccess";
		}
		
		
	}
	
	
	@PostMapping("/reviewUpdate")
 	public String reviewUpdate(@RequestParam Map<String, Object> prams , 
 			                   RedirectAttributes ra ,
 			                   HttpSession session){
		
		String bno = (String) prams.get("bno"); // 수정할 게시글 번호 받아옴
		String membercode = (String)session.getAttribute("member");  //세션의 멤버코드
		String memberAuth = service.getUpdateAuthMember(bno); //수정할 게시글의 최초작상자의 멤버코드 가져오기 
		
		
		System.out.println("잘왔냐고요" + memberAuth);
		
		//로그인이 안됐을시
		if(membercode == null) { 
			
			ra.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/review/review";
		
		//세션의 멤버코드와 수정할게시글의 멤버코드가 일치하지 않을때
		}else if(!membercode.equals(memberAuth)) { 
			
			ra.addFlashAttribute("msg", "수정 권한이 없습니다.");
			return "redirect:/review/review";
			
		//세션과 게시글 글쓴이가 일치할때	
		}else {
			
			service.reviewUpdate(prams);
			ra.addFlashAttribute("msg", "정상적으로 수정되었습니다.");
			return "redirect:/review/review";
			
		}
		
	}
	


}
