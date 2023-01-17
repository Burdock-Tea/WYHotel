package com.ictproject.wyhotel.util;

import java.util.Random;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.command.QuestionVO;

@Service
public class MailSendService {

	@Autowired
	private JavaMailSender mailSender;
	
	private int authNum;
	private String tempPassword;
	
	//난수 발생 (맘대로 설정 해도 됨.)
	public void makeRandomNumber() {
		//난수의 범위 : 111111 ~ 999999
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호: " + checkNum);
		authNum = checkNum;
	}
	
	// 임시비밀번호 발급
	public void makeTempPassword() {
		String uuid = UUID.randomUUID().toString();
		tempPassword = uuid.split("-")[0];
	}
	
	// 회원 가입 시 사용할 이메일 양식
	public String joinEmail(String email) {
		makeRandomNumber(); //인증번호 생성.
		
		String setFrom = "test123test1591@gmail.com"; // email-config에 설정한 발신용 이메일 주소를 입력.
		String toMail = email; // 수신받을 이메일
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목
		String content = "<div style=\"border: 1px solid rgb(187, 187, 187); color: rgb(63, 63, 63); width: 500px; padding: 20px 0 40px 40px; \">\r\n" + 
				"        <img src=\"https://i.ibb.co/gDfYhCN/logo.png\" alt=\"logo\" border=\"0\"><h3 style=\"padding-bottom: 5px;\"> 이메일 인증 코드</h3>\r\n" + 
				"        <p style=\"padding-bottom: 7px;\">\r\n" + 
				"            안녕하세요. 고객님 <br>\r\n" + 
				"            맴버쉽 서비스를 이용하기 위한 인증번호(<strong>"+ authNum +"</strong>)를  발송 하였습니다\r\n" + 
				"        </p>\r\n" + 
				"        <strong style=\"background: rgb(231, 231, 231); color: rgb(63, 63, 63); padding: 8px 180px 8px 180px;\">" + authNum + "</strong> <br><br>\r\n" + 
				"        <small style=\"color: silver;\"> ! 인증메일은 1시간 이내로 완료해 주세요</small>\r\n" + 
				"    </div>"; // 이메일에 삽입할 내용.
		mailSend(setFrom, toMail, title, content);
		
		return Integer.toString(authNum); // 정수를 문자열로 변환하여 리턴.
	}
	
	/*
	 * 작성일 : 23/01/09
	 * 작성자 : 권우영
	 * 작성내용 : 임시비밀번호 생성 및 이메일 전송
	 * 비회원 예약시 입력한 이메일로 예약 내역 전송
	 */
	
	// 관리자 회원관리에서 임시비밀번호 생성하여 전달
	public String sendPasswordEmail(String email) {
		makeTempPassword();
		
		String setFrom = "test123test1591@gmail.com"; // email-config에 설정한 발신용 이메일 주소를 입력.
		String toMail = email; // 수신받을 이메일
		String title = "임시비밀번호 발급 이메일 입니다."; // 이메일 제목
		String content = "<div style=\"border: 1px solid rgb(187, 187, 187); color: rgb(63, 63, 63); width: 500px; padding: 20px 0 40px 40px; \">\r\n" + 
				"        <img src=\"https://i.ibb.co/gDfYhCN/logo.png\" alt=\"logo\" border=\"0\"><h3 style=\"padding-bottom: 5px;\"> 임시비밀번호</h3>\r\n" + 
				"        <p style=\"padding-bottom: 7px;\">\r\n" + 
				"            안녕하세요. 고객님 <br>\r\n" + 
				"            비밀번호를 초기화 하였으며, 초기화된 비밀번호는 <strong>"+ tempPassword +"</strong> 입니다.\r\n" + 
				"        </p>\r\n" +
				"    </div>"; // 이메일에 삽입할 내용.
		mailSend(setFrom, toMail, title, content);
		
		return tempPassword;
	}
	
	// 비회원 예약시 메일 전송해주는 메소드
	public void sendReservationInfo(String reservCode, String email) {
		
		String setFrom = "test123test1591@gmail.com"; // email-config에 설정한 발신용 이메일 주소를 입력.
		String toMail = email; // 수신받을 이메일
		String title = "[WYHotel] 예약 완료 이메일입니다."; // 이메일 제목
		String content = "<div style=\"border: 1px solid rgb(187, 187, 187); color: rgb(63, 63, 63); width: 500px; padding: 20px 0 40px 40px; \">\r\n" + 
				"        <h3 style=\"padding-bottom: 5px;\"> 예약완료</h3>\r\n" + 
				"        <p style=\"padding-bottom: 7px;\">\r\n" + 
				"            안녕하세요. 고객님 <br>\r\n" + 
				"            예약이 완료되었으며, 고객님이 예약한 예약번호는 <strong>"+ reservCode +"</strong> 입니다.\r\n" +
				"        </p>\r\n" +
				"    </div>"; // 이메일에 삽입할 내용.
		mailSend(setFrom, toMail, title, content);
		
	}
	
	// 문의내역에 대한 답변 이메일로 전송
	public boolean sendQuestionReply(QuestionVO question) {	
		
		System.out.println("in sendQuestionReply : " + question);
		
		String setFrom = "test123test1591@gmail.com";
		String toMail = question.getCustomerEmail();
		String title = "[WYHotel] Re:" + question.getQuestionTitle();
		String content = "<div style=\"border: 1px solid rgb(187, 187, 187); color: rgb(63, 63, 63); width: 500px; padding: 20px 0 40px 40px; \">\r\n" + 
				"        <h3 style=\"padding-bottom: 5px;\">문의내역</h3>\r\n" + 
				"        <p style=\"padding-bottom: 7px;\">\r\n" + 
				"            안녕하세요. 고객님 문의하신 내용에 대한 답변입니다.<br>\r\n" + 
				"            " + question.getQuestionAnswer() + "<br>\r\n" +
				"        </p>\r\n" +
				"    </div>";
		
		return mailSend(setFrom, toMail, title, content);
	}
	
	// 이메일 전송 메서드
	private boolean mailSend(String setFrom, String toMail, String title, String content) {
		
		MimeMessage message = mailSender.createMimeMessage();
		try {
			//기타 설정들을 담당할 MimeMessageHelper 객체를 생성.
			//생성자의 매개값으로는 MimeMessage 객체, boolean, 문자 인코딩 설정
			//true 매개값을 전달하면 MultiPart 형식의 메세지 전달이 가능 (첨부 파일)
			//값을 전달하지 않는다면 단순 텍스트만 사용.
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			//true -> html 형식으로 전송, 안주면 단순 텍스트로 전달.
			helper.setText(content , true);
			
			//메일 전송.
			mailSender.send(message);
			return true;
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
}
