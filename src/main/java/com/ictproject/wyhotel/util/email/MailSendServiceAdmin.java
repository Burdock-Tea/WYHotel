package com.ictproject.wyhotel.util.email;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailSendServiceAdmin {

	@Autowired
	private JavaMailSender mailsender;
	
	public void beFed(Map<String, String> param) {
		System.out.println(param.toString());
		String setFrom = "ppipong_@naver.com";
		String toMail = param.get("email");
		String title = param.get("title");
		
		/* 컨텐츠 영역 */
		String content = "<div style=\"background: linear-gradient(to top left, #6699ff 39%, #33ccff 98%); width: 900px; height: 700px;\">\r\n" + 
				"    <div style=\"width: 600px; margin:0 auto; text-align:center; font-size: 16px; padding-top: 40px;\">\r\n" + 
				"        <div style=\"text-align: left; background: #fff; padding: 20px 0; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.089)  5px 5px 10px;\">\r\n" + 
				"            <p style=\"margin:10px 20px; padding-bottom: 10px; border-bottom: 1px solid #888;\">\r\n" + 
				"                <b style=\"color: #666; margin-right: 30px;\">호텔명</b>\r\n" + 
				"                <span style=\"font-size: 15px;\">"+param.get("branch")+"</span>           \r\n" + 
				"            </p>\r\n" + 
				"            <p style=\"margin:10px 20px; padding-bottom: 10px; border-bottom: 1px solid #888;\">\r\n" + 
				"                <b style=\"color: #666; margin-right: 30px;\">질문 유형</b>\r\n" + 
				"                <span style=\"font-size: 15px;\">"+param.get("qnaType")+"</span>           \r\n" + 
				"            </p>\r\n" + 
				"            <p style=\"margin:10px 20px; padding-bottom: 10px; border-bottom: 1px solid #888;\">\r\n" + 
				"                <b style=\"color: #666; margin-right: 30px;\">전화번호</b>\r\n" + 
				"                <span style=\"font-size: 15px;\">"+param.get("phone")+"</span>           \r\n" + 
				"            </p>\r\n" + 
				"            <p style=\"margin:10px 20px; padding-bottom: 10px; border-bottom: 1px solid #888;\">\r\n" + 
				"                <b style=\"color: #666; margin-right: 30px;\">이메일</b>\r\n" + 
				"                <span style=\"font-size: 15px;\">"+param.get("email")+"</span>           \r\n" + 
				"            </p>\r\n" + 
				"            <p style=\"margin:10px 20px; padding-bottom: 10px;\">\r\n" + 
				"                <b style=\"color: #666; margin-right: 30px;\">내용</b>\r\n" + 
				"                <span>"+param.get("content")+"</span>           \r\n" + 
				"            </p>\r\n" + 
				"        </div>\r\n" + 
				"    </div>\r\n" + 
				"    </div>";
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