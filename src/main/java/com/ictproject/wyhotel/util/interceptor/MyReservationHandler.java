package com.ictproject.wyhotel.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class MyReservationHandler implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Object member = session.getAttribute("member");
		
		if (member != null) {
			return true;
		} else {
			response.sendRedirect(request.getContextPath() + "/reservation/reservCheck");
			return false;
		}
	}

}
