package com.ictproject.wyhotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ictproject.wyhotel.member.service.IMemberService;

@Controller
@RequestMapping("/chat")
public class WebSocketController {
	
	@Autowired
	private IMemberService service;
	
	@GetMapping("/userchat")
	public String index(HttpSession session , Model model) {
			
		
		  String member =(String) session.getAttribute("member");
		  
		  model.addAttribute("id" , service.getEmail(member));
		 
		
		
		return "chat/userchat";
	}
	
	@GetMapping("/adminchat")
	public String admin(HttpSession session , Model model) {
		
		
		  String member = (String)session.getAttribute("member");
		  model.addAttribute("id" , service.getEmail(member)); 
		 
		
		return "chat/adminchat";
	}
}
