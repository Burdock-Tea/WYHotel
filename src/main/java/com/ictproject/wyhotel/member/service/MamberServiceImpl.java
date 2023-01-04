package com.ictproject.wyhotel.member.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.member.mapper.IMemberMapper;

@Service
public class MamberServiceImpl implements IMemberService {
	
	/*
	 * 2022.12.29 임영준 작업 
	 */
	
	@Autowired
	private IMemberMapper mapper;
	
	@Override
	public int idcheck(String email) {
		return mapper.idcheck(email);
	}

	@Override
	public void join(MemberVO vo) {
		//회원 비밀번호를 암호화 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("되기전 비밀번호: " + vo.getPassword());
		
		//비밀번호를 암호화 해서 member객체에 다시 저장하기
		String securPw = encoder.encode(vo.getPassword());
		System.out.println("변경 후 비밀번호: " + securPw);
		
		vo.setPassword(securPw);
		
		mapper.join(vo);
	}
	
	/*
	 * 2022.12.29 이준희 작업 
	 */
	
	@Override
	public MemberVO login(String email) {
		return mapper.login(email);
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
		//회원 비밀번호를 암호화 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("되기전 비밀번호: " + vo.getPassword());
		
		//비밀번호를 암호화 해서 member객체에 다시 저장하기
		String securPw = encoder.encode(vo.getPassword());
		System.out.println("변경 후 비밀번호: " + securPw);
		
		vo.setPassword(securPw);
		
		mapper.pwModify(vo);
	}

	@Override
	public void delete(String memberCode) {
		mapper.delete(memberCode);
	}

	@Override
	public String pwChk(String email) {
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
		//회원 비밀번호를 암호화 인코딩
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("되기전 비밀번호: " + password);
		
		//비밀번호를 암호화 해서 member객체에 다시 저장하기
		String securPw = encoder.encode(password);
		System.out.println("변경 후 비밀번호: " + securPw);
		
		password = securPw;
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















