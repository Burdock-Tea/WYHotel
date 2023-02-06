package com.ictproject.wyhotel.instagram.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.ictproject.wyhotel.command.InstagramVO;
import com.ictproject.wyhotel.util.paging.PageVO;

public interface IInstagramService {
	
	//등록
	void insert(InstagramVO vo, MultipartFile file);
	
	//목록
	List<InstagramVO> getList(PageVO paging);
	
	//상세보기
	InstagramVO getDetail(int bno);
	
	//삭제
	void delete(int bno);
	
	//수정
	void modify(InstagramVO vo);
	
	
}
