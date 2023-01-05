package com.ictproject.wyhotel.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.admin.mapper.IAdminMapper;
import com.ictproject.wyhotel.command.MemberVO;

@Service
public class AdminServiceImpl implements IAdminService {

	@Autowired
	private IAdminMapper mapper;
	
	@Override
	public List<MemberVO> getMemberList(String category, String search) {		
		return mapper.getMemberList(category, search);
	}
	
	@Override
	public MemberVO getMemberInfo(String memberCode) {		
		return mapper.getMemberInfo(memberCode);
	}
	
	@Override
	public void updateMember(MemberVO member) {
		mapper.updateMember(member);		
	}
	
	@Override
	public void deleteMember(String memberCode) {
		mapper.deleteMember(memberCode);		
	}

}
