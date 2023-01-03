package com.ictproject.wyhotel.util.email;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {

	@Autowired
	private JavaMailSender mailsender;
	
	public void beFed(Map<String, String> param) {
		System.out.println(param.toString());
		String setFrom = "ppipong_@naver.com";
		String toMail = param.get("email");
		String title = param.get("title");
		String content = param.get("branch")  
						+ param.get("qnaType")
						+ param.get("phone")
				 	   	+ param.get("content");
		mailsend(setFrom, toMail, title, content);
	}
	
	// 이메일 전송
	public void mailsend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailsender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			System.out.println("메일 전송 직전 !");
			mailsender.send(message);
			System.out.println("메일 전송 성공 !");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}	
	
}
