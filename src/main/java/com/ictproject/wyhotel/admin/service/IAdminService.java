package com.ictproject.wyhotel.admin.service;

import java.util.List;

import com.ictproject.wyhotel.command.MemberVO;

public interface IAdminService {
	
	public List<MemberVO> getMemberList(String category, String search);

}
