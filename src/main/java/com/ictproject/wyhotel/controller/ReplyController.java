package com.ictproject.wyhotel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ictproject.wyhotel.command.ReplyVO;
import com.ictproject.wyhotel.reply.service.IReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private IReplyService service;
	
	@PostMapping("/replyRegist")
	public String replyRegist(@RequestBody ReplyVO vo) {
		service.replyRegist(vo);
		return "success";
	}
	
	//댓글 목록
	@GetMapping("/replyList/{bnos}")
	public List<ReplyVO> replyList(@PathVariable int bnos) {

		// List<ReplyVO> list = service.getList(bnos, pageNum); //댓글 목록 데이터
		// int total = service.getTotal(bnos); // 전체 댓글 개수
		// System.out.println("댓글목록: " + list);
		
		// Map<String, Object> map = new HashMap<>();
		// map.put("list", list);
		// map.put("total", total);
		
		return service.getList(bnos);
	}
	
	@PostMapping("/update")
	public String update(@RequestBody ReplyVO vo) {
		
		if(service.emailCheck(vo) == 1) { //이메일이 맞는 경우
			service.update(vo);
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	@PostMapping("/delete")
	public String delete(@RequestBody ReplyVO vo) {
		if(service.emailCheck(vo) == 1) {
			service.delete(vo.getRno());
			return "success";
		} else {
			return "fail";
		}
	}
	
	@PostMapping("/getBno")
	public int getBno(@RequestBody int rno) {
		System.out.println(service.getBno(rno));
		return service.getBno(rno);
	}
	
	@PostMapping("/getTotal")
	public int getTotal(@RequestBody int bno) {
		System.out.println("bno: " + bno);
		
		return service.getTotal(bno);
	}
}





















