package com.ictproject.wyhotel.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.member.service.IMemberService;
import com.ictproject.wyhotel.utill.MailSendService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	@Autowired
	private IMemberService service;
	
	@Autowired
	private MailSendService mailService;
	
	// 로그인 페이지 이동
	@GetMapping("/login")
	public void loginPage(){
		
	}
	
	// 로그인 처리
	@PostMapping("/login")
	public void userLogin(String email, String password, Model model, MemberVO vo, 
						HttpSession session, HttpServletResponse response, boolean autoLogin) {
		model.addAttribute("user", service.login(email, password));
		
		/*
		MemberVO dbData = service.login(email, password);
		if(autoLogin == true) {
			
			if(dbData != null) {
				if(vo.getPassword().equals(dbData.getPassword())) {
					//로그인 성공 회원을 대상으로 세션 정보를 생성
					session.setAttribute("login", dbData);
					
					long limitTime = 60 * 60 * 24 * 90;
					
					//자동 로그인 체크 시 처리해야할 내용
					if(vo.isAutoLogin()) {
						//쿠키를 이용하여 자동 로그인 정보를 저장
						System.out.println("자동로그인 쿠키 생성중");
						//세션 아이디를 가지고 와서 쿠키에 저장(고유한 값)
						Cookie loginCookie = new Cookie("loginCookie", session.getId());
						//쿠키수명 설정
						loginCookie.setMaxAge((int) limitTime);
						//쿠키가 동작할 수 있는 유효한 url
						loginCookie.setPath("/");
						response.addCookie(loginCookie);
						
						//자동 로그인 유지시간을 날짜 객체고 변환(DB저장 때문)
						long expireDate = System.currentTimeMillis() + (limitTime * 1000);
						//Date 객체의 생성자에 매개값으로 밀리초의 정수를 전달하면 날짜 형태로 변경
						Date limitDate = new Date(expireDate);
						
						service.keepLogin(session.getId(), limitDate, vo.getEmail());
						
						}
					}
				}
			}
			*/
		
	}
	
	// 로그아웃 처리
	@GetMapping("/logout")
	public String logout(HttpSession session, 
					HttpServletRequest request, HttpServletResponse response) {
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		session.removeAttribute("member");
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		if(loginCookie != null) {
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			service.keepLogin("none", new Date(), member.getEmail());
		}
		
		return "redirect:/";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/join")
	public void joinPage(){}
	
	// 회원정보 수정 페이지 이동
	@GetMapping("/modify")
	public void modifyPage(HttpSession session, Model model){
		String memCode = (String) session.getAttribute("member");
		System.out.println(memCode);
		model.addAttribute("member", service.getInfo(memCode));
	}
	
	// 회원정보 수정 처리
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, String tel2, String tel3) {
		System.out.println(vo);
		vo.setTel(vo.getTel() + "-" + tel2 + "-" + tel3);
		service.modify(vo);
		session.removeAttribute("member");
		return "redirect:/member/login";
	}
	
	// 비밀번호 수정 페이지 이동
	@GetMapping("/pwModify")
	public void pwModifyPage(HttpSession session, Model model){
		String memCode = (String) session.getAttribute("member");
		model.addAttribute("member", service.getInfo(memCode));
	}
	
	//비밀번호 수정 처리
	@PostMapping("/pwModify")
	public String pwModify(MemberVO vo, HttpSession session, String newPw) {
		vo.setPassword(newPw);
		service.pwModify(vo);
		session.removeAttribute("member");
		return "redirect:/member/login";
	}
	
	// 회원탈퇴 페이지
	@GetMapping("/delete")
	public void deletePage(HttpSession session, Model model){
		
		String mem = (String) session.getAttribute("member");
		
		System.out.println(session.getAttribute("member"));
		model.addAttribute("pw", service.getInfo(mem));
	}
	
	//탈퇴 처리
	@PostMapping("/delete")
	public String delete(String memberCode, HttpSession session) {
		System.out.println("memCode : " + memberCode);
		service.delete(memberCode);
		session.removeAttribute("member");
		
		return "redirect:/";
	}
	
	// 비밀번호 확인 페이지
	@GetMapping("/pwChk")
	public void pwChek(HttpSession session, Model model) {
		
		String mem = (String)session.getAttribute("member");
		
		model.addAttribute("email", service.getEmail(mem));
		System.out.println(service.getEmail(mem));
	}
	
	//비밀번호 확인
	@PostMapping("/pwChk") 
	@ResponseBody
	public String pwChk(@RequestBody String email) {
		
		if(service.pwChk(email) != 1) {
			return "fail";
		} else {
			return "success";
		}
		
	}
	
	//아이디 찾기 페이지 이동
	@GetMapping("/searchId")
	public void searchId() {}
	
	//아이디 찾기 처리
	@PostMapping("/searchId")
	public String searchId(String name, Model model,  String tel, String tel2, String tel3, RedirectAttributes ra) {
		String phoneNum = tel + "-" + tel2 + "-" + tel3;		
		ra.addFlashAttribute("email", service.searchId(name, phoneNum));
		
		return "redirect:/member/searchId";
	}
	
	//비밀번호 찾기 페이지 이동(비로그인)
	@GetMapping("/searchPw")
	public void searchPw() {}
	
	//비밀번호 변경 처리(비로그인)
	@PostMapping("/searchPw")
	public String searchPw(String newPw, String email) {
		System.out.println("eamil: " + email + "password: " + newPw);
		service.newPw(email, newPw);
		return "redirect:/member/login";
	}
	
	//이메일 인증(비동기)
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		return mailService.joinEmail(email);
	} //이메일 인증 끝
	
}





















