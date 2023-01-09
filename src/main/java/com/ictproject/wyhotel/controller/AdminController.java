package com.ictproject.wyhotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ictproject.wyhotel.admin.service.IAdminService;
import com.ictproject.wyhotel.command.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Autowired
	private IAdminService service;
	
	// 관리자 회원관리 페이지 이동
	@GetMapping("/member")
	public void memberPage(Model model, String category, String search) {
		
		log.info("String category : " + category);
		log.info("String search : " + search);
		
		model.addAttribute("list", service.getMemberList(category, search));
	}
	
	// 관리자가 수정 버튼을 누를때 비동기 방식으로 회원의 정보를 불러옴
	@PostMapping("/getMemberInfo")
	@ResponseBody
	public MemberVO getMemberInfo(@RequestBody String memberCode) {		
		log.info("getMemberInfo / memberCode : " + memberCode);
		return service.getMemberInfo(memberCode);
	}
	
	// 회원 정보 수정 처리
	@PostMapping("/update")
	public String updateMember(MemberVO member) {
		
		log.info("update / member : " + member);
		
		service.updateMember(member);
		
		return "redirect:/admin/member";
	}
	
	// 회원 삭제 처리
	@PostMapping("/memberDelete")
	public String deleteMember(String memberCode) {
		
		log.info("memberCode is " + memberCode);
		
		service.deleteMember(memberCode);
		
		return "redirect:/admin/member";
	}
	
	/*
	 * 작성일 : 23/01/09
	 * 작성자 : 권우영
	 * 
	 * 해당 회원에게 임시비밀번호 발급 
	 */
	
	// 회원에게 임시비밀번호 발급
	@PostMapping("/updateTempPassword")
	public String updateTempPassword(MemberVO member) {
		
		log.info("updateTempPassword // member is : " + member);
					
		service.updateTempPassword(member);
		
		return "redirect:/admin/member";
	}

}
