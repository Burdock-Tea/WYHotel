package com.ictproject.wyhotel.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ictproject.wyhotel.command.DiningReservationVO;
import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.command.NotMemberVO;
import com.ictproject.wyhotel.command.ReservationVO;
import com.ictproject.wyhotel.command.RoomReservationVO;
import com.ictproject.wyhotel.command.RoomVO;
import com.ictproject.wyhotel.member.service.IMemberService;
import com.ictproject.wyhotel.reservation.service.IReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private IReservationService service;
	
	@Autowired
	private IMemberService mService;
	
	/**
	 * 작 성 일 : 2022/12/29
	 * 작 성 자 : 백 건 욱
	 * */

	// 예약하기 페이지 이동
	@GetMapping("/reservationPage")
	public void reservationPage() {}
	
	// 예약 검색기록 띄우기
	@PostMapping("/reservationPage")
	public void roomResult(@ModelAttribute("reservation") ReservationVO reservation,
							Model model) {
		
		if (reservation.getCategory().equals("hotels")) {
			model.addAttribute("resultList", service.getRoomList(reservation));
		} else {			
			model.addAttribute("resultList", service.getDiningList(reservation));
		}
		
		System.out.println(model.getAttribute("resultList"));
		
	}
	
	// 방 상세정보
	@ResponseBody
	@GetMapping("/roomDetail")
	public RoomVO getRoomDetail(String roomCode) {
		
		return service.getRoomDetail(roomCode);
	}
	
	// 결제페이지 이동
	@PostMapping("/payment")
	public void movePaymentPage(@ModelAttribute("reservation") ReservationVO reservation,
								Model model) {
		
		String category = reservation.getCategory();
		
		if (category.equals("dinings")) {
			model.addAttribute("list", service.getDiningList(reservation));
			reservation = service.cleansingData(reservation);
		} else {
			model.addAttribute("list", service.getRoomList(reservation));
			reservation = service.cleansingData(reservation);
			System.out.println("daterange after cleansing: " + reservation.getDaterange());
		}
	}
	
	// 비회원 추가
	@ResponseBody
	@PostMapping("/createNmemCode")
	public String createNmemCode(@RequestBody NotMemberVO nmember) {
		
		return service.createNmemCode(nmember);
	}
	
	// 다이닝 예약
	@PostMapping("/diningReserv")
	public String dinigReserv(DiningReservationVO diningReserv, String strDate, HttpSession session,
							  RedirectAttributes ra) {
		
		service.reservDining(diningReserv, strDate);
		session.setAttribute("member", diningReserv.getMemberCode());
		ra.addFlashAttribute("msg", "reservSuccess");
		return "redirect:/reservation/myReservations";
	}
	
	// 회원 비회원예약 선택 페이지
	@GetMapping("/reservCheck")
	public void reservCheck() {}
	
	// 비회원 로그인
	@PostMapping("/nmemLogin")
	public String nMemLogin(String reservationCode, String email, 
							HttpSession session, RedirectAttributes ra) {
		
		if (service.nMemLogin(reservationCode, email)) {
			session.setAttribute("member", reservationCode.substring(12));
			System.out.println("memberCode: " + session.getAttribute("member"));
			return "redirect:/reservation/myReservations";
		} else { 
			ra.addFlashAttribute("msg", "nMemLoginFail");
			return "redirect:/reservation/reservCheck";
		}
	}
	
	// 예약확인 페이지
	@GetMapping("/myReservations")
	public void myReservations(HttpSession session, Model model) {
		
		
		model.addAttribute("roomList", service.getReservRoomList(session));
		model.addAttribute("diningList", service.getReservDiningList(session));
		
		System.out.println(service.getReservRoomList(session));
		System.out.println(service.getReservDiningList(session));
		
	}
	
	// reservation detail (dining)
	@ResponseBody
	@PostMapping("/getReservDetailDining")
	public DiningReservationVO getReservDetailDining(@RequestBody String resvNum, HttpSession session) {
		
		return service.getReservDetailDining(resvNum, session);
	}
	
	// get user info
	@ResponseBody
	@PostMapping("/getMemberInfo")
	public MemberVO getMemberInfo(@RequestBody String memberCode) {
		String isMem = memberCode.substring(0, 1);
		System.out.println("isMem: " + isMem);
		if (isMem.equals("1") || isMem.equals("2"))
			return service.getInfo(memberCode);
		else
			return mService.getInfo(memberCode);
	}
	
	// payment success
	@GetMapping("/success")
	public String paymentSuccess(RoomReservationVO roomReserv, 
								String cInDate, String cOutDate,
								String pointAccumulate,
								HttpSession session,
								RedirectAttributes ra) {
		
		System.out.println(roomReserv);
		System.out.println("적립 포인트" + pointAccumulate);
		roomReserv.setCheckInDate(Timestamp.valueOf(cInDate + " 00:00:00.0"));
		roomReserv.setCheckOutDate(Timestamp.valueOf(cOutDate + " 00:00:00.0"));
		service.reservRoom(roomReserv);
		mService.accumulatePoint(roomReserv.getMemberCode(), pointAccumulate);
		session.setAttribute("member", roomReserv.getMemberCode());
		ra.addFlashAttribute("msg", "reservSuccess");
		return "redirect:/reservation/myReservations";
	}
	
	// get room reservation detail
	@ResponseBody
	@PostMapping("/getReservDetailRoom")
	public RoomReservationVO getReservDetailRoom(@RequestBody String resvNum, HttpSession session) {
		
		return service.getReservDetailRoom(resvNum, session);
	}
	
	// cancel dining
	@PostMapping("/cancelDining")
	public String cancelDining(DiningReservationVO reserv, HttpSession session, RedirectAttributes ra){
		
		String resvNum = reserv.getReservationCode();
		
		service.cancelDiningReservation(resvNum, session);
		
		ra.addFlashAttribute("msg", resvNum);
		return "redirect:/reservation/myReservations";
	}

	// member login
	@PostMapping("/login")
	public String login(HttpSession session, RedirectAttributes ra, 
			HttpServletResponse response, MemberVO vo) {
		MemberVO dbData = mService.login(vo.getEmail());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(dbData != null) {
			if(encoder.matches(vo.getPassword(), dbData.getPassword())) {
				//로그인 성공 회원을 대상으로 세션 정보를 생성
				session.setAttribute("member", dbData.getMemberCode());
				session.setAttribute("admin", dbData.isAdmin());
				
				System.out.println(session.getId());
				long limitTime = 60 * 60 * 24 * 90;
				
					//자동 로그인 체크 시 처리해야할 내용
					if(vo.isAutoLogin()) {
						//쿠키를 이용하여 자동 로그인 정보를 저장
						System.out.println("자동로그인 쿠키 생성중");
						//세션 아이디를 가지고 와서 쿠키에 저장(고유한 값)
						Cookie loginCookie = new Cookie("loginCookie", session.getId());
						
						//쿠키수명 설정
						loginCookie.setMaxAge((int) limitTime);
						//쿠키가 동작할 수 있는 유효한 url
						loginCookie.setPath("/");
						response.addCookie(loginCookie);
						
						//자동 로그인 유지시간을 날짜 객체고 변환(DB저장 때문)
						long expireDate = System.currentTimeMillis() + (limitTime * 1000);
						//Date 객체의 생성자에 매개값으로 밀리초의 정수를 전달하면 날짜 형태로 변경
						Date limitDate = new Date(expireDate);
						
						mService.keepLogin(session.getId(), limitDate, vo.getEmail());
					
					}
				
					return "redirect:/reservation/myReservations";
				} else {
					ra.addFlashAttribute("msg", "loginFail");
					
					return "redirect:/member/login";
				}
			
			} else {
				ra.addFlashAttribute("msg", "loginFail");
				
				return "redirect:/reservation/reservCheck";
			}
		
	}
	
	// get paymentKey
	@ResponseBody
	@PostMapping("/getPaymentKey")
	public String getPaymentKey(@RequestBody String resvNum) {
		
		return service.getPaymentKey(resvNum);
	}

	// cancel room reservation
	@PostMapping("/cancelRoom")
	public String cancelRoom(RoomReservationVO reserv, HttpSession session, RedirectAttributes ra) {
		
		String resvNum = reserv.getReservationCode();
		service.cancelRoom(resvNum, session);
		ra.addFlashAttribute("msg", resvNum);
		return "redirect:/reservation/myReservations";
	}

}
