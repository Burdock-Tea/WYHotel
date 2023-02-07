package com.ictproject.wyhotel.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ictproject.wyhotel.command.PromotionReservationVO;
import com.ictproject.wyhotel.command.PromotionUploadVO;
import com.ictproject.wyhotel.command.PromotionVO;
import com.ictproject.wyhotel.command.ReservationVO;
import com.ictproject.wyhotel.promotion.service.IPromotionService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/promotion")
@Log4j
public class PromotionController {
	
	/**
	 * 작 성 일 : 2022/12/30
	 * 작 성 자 : 권 우 영
	 * */
	
	@Autowired
	private IPromotionService service;
	
	// 프로모션 리스트 페이지로 이동
	@GetMapping("/list")
	public void listPage(Model model, String hotelCode, String startDate, String endDate) {
		log.info("hotelCode is " + hotelCode);
		log.info("startDate is " + startDate);
		model.addAttribute("promotionList", service.getList(hotelCode, startDate, endDate));
	}
	
	// 비동기 방식, img 태그의 src 속성에 요청을 보내 해당 이미지를 사용자한테 보여주기 위함
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileLocation, String fileName) {
		
		String osName = System.getProperty("os.name").toLowerCase();
		
		String uploadFolder = "C:/test/upload/";
		
		if(osName.equals("linux")) {
			uploadFolder = "/var/upload/";
		}
		
		File file = new File(uploadFolder + fileLocation + "/" + fileName);
		
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			headers.add("img", "imgtag");
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 프로모션 등록 페이지로 이동
	@GetMapping("/insert")
	public void insertPage() {}
	
	// 프로모션 등록 처리
	@PostMapping("/insert")
	public String insert(PromotionUploadVO upload) {	
		
		service.insert(upload);				
		
		return "redirect:/promotion/list";
	}
	
	// 프로모션 수정 페이지로 이동
	@GetMapping("/update")
	public void updatePage(String promotionCodeData, Model model) {
		PromotionVO promotion = service.getPromotion(promotionCodeData);
		
		model.addAttribute("promotion", promotion);
	}
	
	// 프로모션 수정 처리
	@PostMapping("/update")
	public String update(PromotionUploadVO upload, String imageUpdate) {
		// imageUpdate는 html의 checkbox의 value 값
		// checkbox가 check 되었을 경우 on이 들어오게 됨, check가 안되어 있을 시에는 null

		log.info("getFile() : " + upload.getFile());
		log.info("imageUpdate : " + imageUpdate);
		
		service.update(upload, imageUpdate);
		
		
		return "redirect:/promotion/list";
	}
	
	// 프로모션 삭제 처리
	@PostMapping("/delete")
	public String delete(String promotionCodeData) {
		
		service.delete(promotionCodeData);
		
		return "redirect:/promotion/list";
	}
	
	// 프로모션 예약 페이지 이동
	@PostMapping("/payment")
	public String paymentPage(PromotionReservationVO data, Model model) {
		
		ReservationVO reservation = service.convertReservationData(data);
		
		model.addAttribute("reservation", reservation);
		
		return "/reservation/payment";	
	}
}
