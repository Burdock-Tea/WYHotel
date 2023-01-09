package com.ictproject.wyhotel.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.ictproject.wyhotel.command.MembershipVO;
import com.ictproject.wyhotel.member.service.IMemberService;
import com.ictproject.wyhotel.util.MailSendService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	@Autowired
	private IMemberService service;
	
	@Autowired
	private MailSendService mailService;
	
	
	/**
	 * 작성일 : 22/12/29
	 * 작성자 : 임영준
	 */
	
	// 로그인 페이지 이동
	@GetMapping("/login")
	public void loginPage(){}
	
	//이메일 중복 체크
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody MemberVO vo) {
		int result = service.idcheck(vo.getEmail());
		
		if(result == 1) {
			return "duplicated";
		}else {
			return "ok";
		}
			
		
	}
	/*
	 * 작성일: 23/01/05
	 * 작성자: 이준희
	 * 전화번호 중복 처리 추가
	 * 
	 * 수정일 : 23/01/09
	 * 작성자 : 권우영
	 * 전화번호 중복 처리 수정
	 */
	//전화번호 중복 체크(회원가입시)
	@ResponseBody
	@PostMapping("/telCheck")
	public String telCheck(@RequestBody String tel) {
		
		if(service.telChk(tel) == 0) {
			return "success";
		} else {
			return "telFail";
		}
		
		/*
			if(member.getTel().equals(vo.getTel())) {
				return "mytel";
			} else if((service.telChk(vo.getTel()) == 0)) {
				return "success";
			} else {
				return "telFail";
			}
		*/
		
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/join")
	public void joinPage(){}
	
	// 회원가입
	@PostMapping("/join")
	public String join(MemberVO vo, String tel2, String tel3, RedirectAttributes ra) {
		String tel = vo.getTel() + "-" + tel2+ "-" + tel3;
		vo.setTel(tel);
	
		service.join(vo);
		ra.addFlashAttribute("msg" , "joinSuccess");
		return "redirect:/member/login";
		
	}
	
	//이메일 인증(비동기)
	@PostMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(@RequestBody String email) {
		return mailService.joinEmail(email);
	} //이메일 인증 끝
	
	/**
	 * 작성일 : 22/12/29
	 * 작성자 : 이준희
	 */
	
	// 로그인 처리
	@PostMapping("/login")
	public String userLogin(HttpSession session, RedirectAttributes ra, 
				HttpServletResponse response, MemberVO vo) {
		
		MemberVO dbData = service.login(vo.getEmail());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(dbData != null) {
			if(encoder.matches(vo.getPassword(), dbData.getPassword())) {
				//로그인 성공 회원을 대상으로 세션 정보를 생성
				session.setAttribute("member", dbData.getMemberCode());
				session.setAttribute("admin", dbData.isAdmin());
				
				System.out.println(session.getId());
				long limitTime = 60 * 60 * 24 * 90;
				
					//자동 로그인 체크 시 처리해야할 내용
					if(vo.isAutoLogin()) {
						//쿠키를 이용하여 자동 로그인 정보를 저장
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
				
					return "redirect:/";
				} else {
					ra.addFlashAttribute("msg", "loginFail");
					
					return "redirect:/member/login";
				}
			
			} else {
				ra.addFlashAttribute("msg", "loginFail");
				
				return "redirect:/member/login";
			}
		
		
	}
	
	// 로그아웃 처리
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes ra, 
					HttpServletRequest request, HttpServletResponse response) {
		
		String memeCode = (String) session.getAttribute("member");
		session.removeAttribute("member");
		session.removeAttribute("admin");
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		
		if(loginCookie != null) {
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			service.keepLogin("none", new Date(), service.getEmail(memeCode));
		}
		
		ra.addFlashAttribute("msg", "logout");
		
		return new ModelAndView("redirect:/");
	}
	
	
	// 회원정보 수정 페이지 이동
	@GetMapping("/modify")
	public void modifyPage(HttpSession session, Model model){
		String memCode = (String) session.getAttribute("member");
		model.addAttribute("member", service.getInfo(memCode));
	}
	
	// 회원정보 수정 처리
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, String tel2, String tel3) {

		vo.setTel(vo.getTel() + "-" + tel2 + "-" + tel3);
		service.modify(vo);
		session.removeAttribute("member");
		return "redirect:/member/modify";
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
		
		model.addAttribute("pw", service.getInfo(mem));
	}
	
	//탈퇴 처리
	@PostMapping("/delete")
	public String delete(String memberCode, HttpSession session) {
		service.delete(memberCode);
		session.removeAttribute("member");
		
		return "redirect:/";
	}
	
	// 비밀번호 확인 페이지
	@GetMapping("/pwChk")
	public void pwChek(HttpSession session, Model model) {
		
		String mem = (String)session.getAttribute("member");
		
		model.addAttribute("email", service.getEmail(mem));
	}
	
	//비밀번호 확인
	@PostMapping("/pwChk") 
	@ResponseBody
	public String pwChk(@RequestBody Map<String, Object> data) {
		String email = (String) data.get("email");
		String password = (String) data.get("password");
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(encoder.matches(password, service.pwChk(email))) {
			return "success";
		} else {
			return "fail";
		}
		
		
	}
	
	//아이디 찾기 페이지 이동
	@GetMapping("/searchId")
	public void searchId() {}
	
	//아이디 찾기 처리
	@PostMapping("/searchId")
	public String searchId(String name, Model model,  String tel, String tel2, String tel3, RedirectAttributes ra) {
		String phoneNum = tel + "-" + tel2 + "-" + tel3;
		if(service.searchId(name, phoneNum) == null) {
			ra.addFlashAttribute("msg", "fail");
		} else {
			ra.addFlashAttribute("msg", "success");
			ra.addFlashAttribute("email", service.searchId(name, phoneNum));
		}
				
		
		
		return "redirect:/member/searchId";
	}
	
	//비밀번호 찾기 페이지 이동(비로그인)
	@GetMapping("/searchPw")
	public void searchPw() {}
	
	//비밀번호 변경 처리(비로그인)
	@PostMapping("/searchPw")
	public String searchPw(String newPw, String email) {
		service.newPw(email, newPw);
		return "redirect:/member/login";
	}
	
	//멤버쉽 페이지 이동
	@GetMapping("/memberShip")
	public String memberShip (HttpSession session,
							RedirectAttributes ra,
							Model model) {
		if(session.getAttribute("member") == null) {
			ra.addFlashAttribute("msg", "loginAuthFail");
			return "redirect:/member/login";
		} else {
			String memCode = (String)session.getAttribute("member");
			String isMem = ((String)session.getAttribute("member")).substring(0, 1);
			if (isMem.equals("1") || isMem.equals("2")) {
				ra.addFlashAttribute("msg", "loginAuthFail");
				return "redirect:/member/login";
			} else {
				model.addAttribute("info", service.getInfo(memCode));
				return "member/memberShip";
			}
		}
	}
	
	// 멤버십 디테일
	@ResponseBody
	@PostMapping("/getMembershipInfo")
	public MembershipVO getMembershipInfo(@RequestBody String grade) {
		System.out.println(grade);
		return service.getMembershipInfo(grade);
	}
	
}





















