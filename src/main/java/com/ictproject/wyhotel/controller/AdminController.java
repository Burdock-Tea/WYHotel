package com.ictproject.wyhotel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ictproject.wyhotel.admin.service.IAdminService;
import com.ictproject.wyhotel.command.DiningReservationVO;
import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.command.QuestionVO;
import com.ictproject.wyhotel.command.RoomReservationVO;
import com.ictproject.wyhotel.util.paging.PageVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Autowired
	private IAdminService service;
	
	// 관리자 회원관리 페이지 이동
	@GetMapping("/member")
	public void memberPage(PageVO paging , Model model) {
		
		log.info("String category : " + paging.getCategory());
		log.info("String keyword : " + paging.getKeyword());
		
		model.addAttribute("list", service.getMemberList(paging));
		model.addAttribute("pc", service.getPageCreator(paging));
	}
	
	// 관리자가 수정 버튼을 누를때 비동기 방식으로 회원의 정보를 불러옴
	@PostMapping("/getMemberInfo")
	@ResponseBody
	public MemberVO getMemberInfo(@RequestBody String memberCode) {		
		log.info("getMemberInfo / memberCode : " + memberCode);
		return service.getMemberInfo(memberCode);
	}
	
	// 회원 정보 수정 처리
	@PostMapping("/update")
	public String updateMember(MemberVO member) {
		
		log.info("update / member : " + member);
		
		service.updateMember(member);
		
		return "redirect:/admin/member";
	}
	
	// 회원 삭제 처리
	@PostMapping("/memberDelete")
	public String deleteMember(String memberCode) {
		
		log.info("memberCode is " + memberCode);
		
		service.deleteMember(memberCode);
		
		return "redirect:/admin/member";
	}
	
	/*
	 * 작성일 : 23/01/09
	 * 작성자 : 권우영
	 * 
	 * 해당 회원에게 임시비밀번호 발급 
	 */
	
	// 회원에게 임시비밀번호 발급
	@PostMapping("/updateTempPassword")
	public String updateTempPassword(MemberVO member, RedirectAttributes ra) {
		
		log.info("updateTempPassword // member is : " + member);
					
		service.updateTempPassword(member);
		ra.addFlashAttribute("msg", "transferEmail");
		
		return "redirect:/admin/member";
	}
	
	// 관리자 문의내역 페이지로 이동
	@GetMapping("/question")
	public String qusetionPage(Model model) {
		
		model.addAttribute("list", service.getQuestionList());		
		
		return "/admin/question";
	}
	
	// 모달창에 띄워줄 문의내역 가져오기 (비동기)
	@PostMapping("/getQuestion")
	@ResponseBody
	public QuestionVO getQuestion(@RequestBody String questionCode) {
		return service.getQuestion(questionCode);
	}
	
	// 문의내역 답장 보내기
	@PostMapping("/replyQuestion")
	@ResponseBody
	public String replyQuestion(@RequestBody QuestionVO question) {
		
		if(service.replyQuestion(question)) {
			return "success";
		} else {
			return "fail";
		}
		
		
	}
	
	// 관리자 예약페이지 이동
	@GetMapping("/reservation")
	public String moveReservationPage() {
		return "/admin/reservation";
	}
	
	// 관리자 예약확인
	@PostMapping("/reservation")
	public String moveReservationPage(String category, String isMem, String keyword, Model model) {

		/*
		 *  예약번호면 -> 바로 검색
		 *  이름 -> 회원 / 비회원 체크 -> 검색어
		 */
		
		System.out.println(category + ' ' + isMem + ' ' + keyword);
		
		Map<String, String> data = new HashMap<>();
		
		data.put("category", category);
		data.put("isMem", isMem);
		data.put("keyword", keyword);		
		
		List<RoomReservationVO> roomReservList = service.getRoomReservList(data);
		List<DiningReservationVO> diningReservList = service.getDiningReservList(data);
		
		model.addAttribute("roomList", roomReservList);
		model.addAttribute("diningList", diningReservList);
		
		log.info(roomReservList);
		log.info(diningReservList);
		
		return "/admin/reservation";
	}
	
	@PostMapping("/cancelRoomReservation")
	@ResponseBody
	public String cancelRoomReservation(@RequestBody String reservationCode) {
		System.out.println(reservationCode);
	
		
		int flag = service.cancelRoomReservation(reservationCode);
		
		if (flag == 1) {
			System.out.println("DB 정상 삭제 완료");
			return "success";
		} else {
			return "fail";
		}
		
		
	}
	
	@PostMapping("/cancelDiningReservation")
	@ResponseBody
	public String cancelDiningReservation(@RequestBody String reservationCode) {
		System.out.println(reservationCode);

		
		int flag = service.cancelDiningReservation(reservationCode);
		
		if (flag == 1) {
			return "success";
		} else {
			return "fail";
		}
		
	}

}
