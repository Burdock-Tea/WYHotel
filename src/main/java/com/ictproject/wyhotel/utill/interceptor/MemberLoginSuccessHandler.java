package com.ictproject.wyhotel.utill.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.ictproject.wyhotel.command.MemberVO;

public class MemberLoginSuccessHandler implements HandlerInterceptor {
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		if(request.getMethod().equals("POST")) {
			
			ModelMap map = modelAndView.getModelMap();
			MemberVO vo = (MemberVO) map.get("user");
			
			if(vo != null) { //로그인 성공
				System.out.println("로그인 성공 로직 동작");
				HttpSession session = request.getSession();
				
				session.setAttribute("member", vo.getMemberCode());
				
				response.sendRedirect(request.getContextPath() + "/");
			} else { //vo == null -> 로그인 실패
				modelAndView.setViewName("redirect:/member/login");
				FlashMap fm = new FlashMap();
				fm.put("msg", "loginFail");
				FlashMapManager fmm = RequestContextUtils.getFlashMapManager(request);
				fmm.saveOutputFlashMap(fm, request, response);
				
			}
		}
		
	}
			
}
