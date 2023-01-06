package com.ictproject.wyhotel.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminAuthHandler implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("관리자권한 인터셉트 동작!");
		
		//세션에서 로그인 데이터를 얻은 후 확인을 해 주자.
		HttpSession session = request.getSession();
		
		//관리자 권한 없는사람
		if(session.getAttribute("admin") == null) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			String html = "<script>\r\n" + 
						  "alert('관리자 권한이 없습니다.');\r\n" + 
						  "location.href='" + request.getContextPath() + "/'\r\n" + 
						  "</script>";
			out.print(html);
			out.flush();
			return false;

		} else { //관리자 권한 있는사람
			
			return true;
		}
	}
	
}
