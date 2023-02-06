package com.ictproject.wyhotel.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.command.ReplyVO;
import com.ictproject.wyhotel.reply.mapper.IReplyMapper;
import com.ictproject.wyhotel.util.paging.PageVO;

@Service
public class ReplyServiceImpl implements IReplyService {
	
	@Autowired
	private IReplyMapper mapper;

	@Override
	public void replyRegist(ReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(int bno, int pageNum) {
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum); //화면에서 전달한 페이지 번호
		vo.setCpp(mapper.getTotal(bno)); //댓글은 한 화면에 총 댓글 수 개수
		
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo); //페이징 쿼리를 위한 pageNum과 cpp
		data.put("bno", bno); //몇번 글의 댓글 목록
		
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int bno) {
		return mapper.getTotal(bno);
	}

	@Override
	public int emailCheck(ReplyVO vo) {
		return mapper.emailCheck(vo);
	}

	@Override
	public void update(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
	}
	
	
	
}
