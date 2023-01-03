package com.ictproject.wyhotel.member.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.member.mapper.IMemberMapper;

@Service
public class MamberServiceImpl implements IMemberService {
	
	@Autowired
	private IMemberMapper mapper;
	
	@Override
	public MemberVO login(String email, String password) {
		return mapper.login(email, password);
	}
	
	@Override
	public MemberVO getInfo(String memberCode) {
		return mapper.getInfo(memberCode);
	}

	@Override
	public void modify(MemberVO vo) {
		mapper.modify(vo);
	}

	@Override
	public void pwModify(MemberVO vo) {
		mapper.pwModify(vo);
	}

	@Override
	public void delete(String memberCode) {
		mapper.delete(memberCode);
	}

	@Override
	public int pwChk(String email) {
		return mapper.pwChk(email);
	}
	
	@Override
	public String getEmail(String memberCode) {
		return mapper.getEmail(memberCode);
	}
	
	@Override
	public String searchId(String name, String tel) {
		return mapper.searchId(name, tel);
	}
	
	@Override
	public void newPw(String email, String password) {
		mapper.newPw(email, password);
	}
	
	@Override
	public void keepLogin(String session, Date limitTime, String email) {
		Map<String, Object> data = new HashMap<>();
		data.put("sessionId", session);
		data.put("limitDate", limitTime);
		data.put("email", email);
		mapper.keepLogin(data);
	}
	
}















