package com.ictproject.wyhotel.reply.mapper;

import java.util.List;
import java.util.Map;

import com.ictproject.wyhotel.command.ReplyVO;

public interface IReplyMapper {
	
	//댓글 등록
	void replyRegist(ReplyVO vo);
	//댓글 목록 요청
	List<ReplyVO> getList(int bno);
	//댓글 개수 (페이징)
	int getTotal(int bno);
	//이메일 확인
	int emailCheck(ReplyVO vo);
	//댓글 수정
	void update(ReplyVO vo);
	//댓글 삭제
	void delete(int rno);
	//bno 얻어오기
	int getBno(int rno);
	
}
