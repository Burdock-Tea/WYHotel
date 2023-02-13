package com.ictproject.wyhotel.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ictproject.wyhotel.command.InstagramVO;
import com.ictproject.wyhotel.instagram.service.IInstagramService;
import com.ictproject.wyhotel.member.service.IMemberService;
import com.ictproject.wyhotel.util.paging.PageVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/instagram")
@Log4j
public class InstagramController {
	
	@Autowired
	private IInstagramService service;
	@Autowired
	private IMemberService member;
	
	//인스타그램 홈페이지
	@GetMapping("/instagram")
	public void instagram(HttpSession session, Model model) {
		String memberCode = (String) session.getAttribute("member");
		
		model.addAttribute("mem", member.getInfo(memberCode));
		
	}
	
	//글 등록
	@PostMapping("/insert")
	@ResponseBody
	public String insert(MultipartFile file, String content, HttpSession session) {
		
		//로그인 중인 사용자의 이메일을 작성자로 사용
		String email = member.getEmail((String)session.getAttribute("member"));
		
		InstagramVO vo = new InstagramVO();
		vo.setEmail(email);
		vo.setContent(content);
		service.insert(vo, file);
		
		return "success";
		
	}
	
	//글 목록
	@GetMapping("/getList")
	@ResponseBody
	public List<InstagramVO> getList(PageVO paging) {
		paging.setCpp(3);
		return service.getList(paging);
	}
	
	//피드 사진 표출
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileLoca, String fileName) {
		
		File file = new File("C:/test/upload/" + fileLoca + "/" + fileName);
		
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			headers.add("merong", "hello");
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	//상세보기
	@GetMapping("/getDetail/{bno}")
	@ResponseBody
	public InstagramVO getDetail(@PathVariable int bno) {
		return service.getDetail(bno);
	}
	
	//수정
	@PostMapping("/modify") 
	@ResponseBody
	public String modify(@RequestBody InstagramVO vo) {
		
		System.out.println(vo);
		System.out.println("content: " + vo.getContent());
		System.out.println("bno: " + vo.getBno());
		service.modify(vo);
		
		return "success";
		
	}
	
	//삭제
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody InstagramVO vo) {
		
		vo = service.getDetail(vo.getBno());
		
		service.delete(vo.getBno());
		
		//글 삭제 시 이미지도 같이 삭제
		File file = new File(vo.getUploadPath() + vo.getFileLoca() + "/" + vo.getFileName());
		return file.delete() ? "success" : "fail";
	}
	
}











