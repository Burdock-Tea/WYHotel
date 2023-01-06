package com.ictproject.wyhotel.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class MemberAuthHandler implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("회원권한 인터셉터");
		
		//세션에 멤버 데이터를 얻은 후 확인
		HttpSession session = request.getSession();
		
		//로그인 안한 사람
		if(session.getAttribute("member") == null) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			String html =  "<script>\r\n" + 
						  "alert('로그인이 필요한 페이지입니다.');\r\n" + 
						  "location.href='" + request.getContextPath() + "/member/login'\r\n" + 
						  "</script>";
			out.print(html);
			out.flush();
			return false;
		//로그인 한 사람
		} else {
			return true;
			
		}
		
	}
	
}
