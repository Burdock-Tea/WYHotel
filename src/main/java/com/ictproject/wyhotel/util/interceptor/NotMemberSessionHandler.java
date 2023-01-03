package com.ictproject.wyhotel.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class NotMemberSessionHandler implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		String member = (String)session.getAttribute("member");
		System.out.println("handler memberCode: " + member);
		
		String uri = request.getRequestURI();

		if (member != null && !uri.equals("/wyhotel/reservation/myReservations")) {
			if (member.substring(0,1).equals("1") || member.substring(0,1).equals("2")) {

				session.removeAttribute("member");
				System.out.println("handler memberCode: " + session.getAttribute("member"));
			}
		}
		
		return true;
		
	}
	
}
