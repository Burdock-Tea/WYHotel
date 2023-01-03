package com.ictproject.wyhotel.member.commons;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.member.mapper.IMemberMapper;

public class AutoLoginInterceptor implements HandlerInterceptor {
	
	@Autowired
	private IMemberMapper mapper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("자동 로그인 인터셉터 ㄱㄱ");
		
		//login Cookie의 존재 유무를 확인
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		//자동 로그인을 신청한 싸람이라면 로그인 유지를 위해 세션 데이터를 만들어 준다.
		HttpSession session = request.getSession();
		
		//자동 로그인을 이전에 신청한 사람
		if(loginCookie != null) {
			
			MemberVO vo = mapper.getMemberWithSessionId(loginCookie.getValue());
			System.out.println("쿠키의 값: " + loginCookie.getValue());
			System.out.println("DB에서 가져온 값: " + vo);
			if(vo != null) {
				//자동 로그인 신청한 사람의 로그인 데이터(세션)을 만들어 준다.
				session.setAttribute("login", vo);
				System.out.println("세션 제작 끝");
			}
			
		}
		
		return true;
		
	}

}
