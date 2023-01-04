package com.ictproject.wyhotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ictproject.wyhotel.admin.service.IAdminService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Autowired
	private IAdminService service;
	
	@GetMapping("/member")
	public void memberPage(Model model, String category, String search) {
		
		log.info("String category : " + category);
		log.info("String search : " + search);
		
		model.addAttribute("list", service.getMemberList(category, search));
	}
	
	@PostMapping("/memberDelete")
	public String deleteMember(String memberCode) {
		
		log.info("memberCode is " + memberCode);
		
		// 삭제 처리 할 것! service.deleteMember!
		
		return "redirect:/admin/member";
	}

}
