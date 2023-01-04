package com.ictproject.wyhotel.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ictproject.wyhotel.command.MemberVO;

public interface IAdminMapper {
	
	public List<MemberVO> getMemberList(@Param("category") String category, @Param("search") String search);

}
