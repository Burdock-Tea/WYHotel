package com.ictproject.wyhotel.reply.service;

import java.util.List;

import com.ictproject.wyhotel.command.ReplyVO;

public interface IReplyService {
	
	//댓글 등록
	void replyRegist(ReplyVO vo);
	//댓글 목록 요청
	List<ReplyVO> getList(int bno, int pageNum);
	//댓글 개수 (페이징)
	int getTotal(int bno);
	//비밀번호 확인
	int emailCheck(ReplyVO vo);
	//댓글 수정
	void update(ReplyVO vo);
	//댓글 삭제
	void delete(int rno);
	
}
