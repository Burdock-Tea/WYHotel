package com.ictproject.wyhotel.instagram.mapper;

import java.util.List;

import com.ictproject.wyhotel.command.InstagramVO;
import com.ictproject.wyhotel.util.paging.PageVO;

public interface IInstagramMapper {
	
	//등록
	void insert(InstagramVO vo);
	
	//목록
	List<InstagramVO> getList(PageVO paging);
	
	//상세보기
	InstagramVO getDetail(int bno);
	
	//삭제
	void delete(int bno);
	
	//수정
	void modify(InstagramVO vo);
}
