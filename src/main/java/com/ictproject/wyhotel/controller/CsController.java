package com.ictproject.wyhotel.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ictproject.wyhotel.cs.service.ICsService;
import com.ictproject.wyhotel.util.captcha.CaptchaUtil;
import com.ictproject.wyhotel.util.email.MailSendServiceAdmin;

import cn.apiclub.captcha.Captcha;

/*
 * @author : 박민희
 * 작성일 : 22/12/29
 * version : 1.0
 * */

@Controller
@RequestMapping("/cscenter")
public class CsController {
	
	@Autowired
	private MailSendServiceAdmin mailsender;
	
	@Autowired
	private ICsService service;
	
	@GetMapping("/faq")
	public void csFaq() {};
	
	@GetMapping("/customer")
	public void customer() {};
	
	// captcha 이미지 가져오는 메서드
	@GetMapping("/captchaImg")
	@ResponseBody
	public void captchaImg(HttpServletRequest req, HttpServletResponse res) throws Exception{
		new CaptchaUtil().getImgCaptCha(req, res);
	}

	// 전달받은 문자열로 음성 가져오는 메서드
	@GetMapping("/captchaAudio")
	@ResponseBody
	public void captchaAudio(HttpServletRequest req, HttpServletResponse res) throws Exception{
		Captcha captcha = (Captcha) req.getSession().getAttribute(Captcha.NAME);
		String getAnswer = captcha.getAnswer();
		new CaptchaUtil().getAudioCaptCha(req, res, getAnswer);
	}

	// 사용자가 입력한 보안문자 체크하는 메서드
	@PostMapping("/chkAnswer")
	@ResponseBody
	public String chkAnswer(HttpServletRequest req, HttpServletResponse res,@RequestBody String params) {
		String result = "";
		Captcha captcha = (Captcha) req.getSession().getAttribute(Captcha.NAME);
		
		if(params != null && !"".equals(params)) {
			if(captcha.isCorrect(params)) {
				req.getSession().removeAttribute(Captcha.NAME);
				result = "1";
			} else {
				result = "0";
			}
		}
		return result;
	}
	
	/*
	 * 
	 *  작성일 : 23/01/17
	 *  작성자 : 권 우 영
	 *  메일 작성 이후 문의내역 DB값 넣기 추가
	 *  
	 */
	@PostMapping("/mailSend")
	public String name(@RequestParam Map<String, String> param, RedirectAttributes ra) {	
		
		String phone = param.get("phone1") + param.get("phone2") + param.get("phone3");
		param.put("phone", phone);
		
		if(mailsender.beFed(param)) {
			// 메일 전송 성공시
			System.out.println("문의내역 메일 전송 성공! DB 값 입력");
			// TODO: 서비스로 MAP 데이터 주고, 서비스에서 DB값 입력
			ra.addFlashAttribute("msg", "mailSendSuccess");
			service.insert(param);
			
		} else {
			// 메일 전송 실패시
			System.out.println("문의내역 메일 전송 실패! DB 에는 들어가지 않습니다");
			ra.addFlashAttribute("msg", "mailSendError");
		}	
		
		return "redirect:/cscenter/customer";
	}
	
	
}
