package com.ictproject.wyhotel.member.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.command.MembershipVO;
import com.ictproject.wyhotel.member.mapper.IMemberMapper;

@Service
public class MemberServiceImpl implements IMemberService {
	
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
		
		//비밀번호를 암호화 해서 member객체에 다시 저장하기
		String securPw = encoder.encode(vo.getPassword());
		
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
		
		//비밀번호를 암호화 해서 member객체에 다시 저장하기
		String securPw = encoder.encode(vo.getPassword());
		
		vo.setPassword(securPw);
		
		mapper.pwModify(vo);
	}
	
	/**
	 *	작 성 자 : 이 준 희
	 *	작 성 일 : 2023-01-16
	 *	내     용 : 회원 삭제 부분 로직 수정(비밀번호 가져와서 암호화 매치 후 비교)
	 * */
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
		
		//비밀번호를 암호화 해서 member객체에 다시 저장하기
		String securPw = encoder.encode(password);
		
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
	
	@Override
	public int telChk(String tel) {
		return mapper.telChk(tel);
	}
	
	
	/**
	 *	작 성 자 : 백 건 욱
	 *	작 성 일 : 2023-01-09
	 *	내     용 : 멤버십 관련 메소드 추가
	 * */
	@Override
	public MembershipVO getMembershipInfo(String grade) {
		
		return mapper.getMembershipInfo(grade);
	}
	
	@Override
	public void updateMembership(MemberVO member, String paymentKey) {
		
		mapper.updateMembership(member, paymentKey);
	}
	
	@Override
	public void accumulatePoint(String memberCode, String pointAccumulate) {
		
		mapper.accumulatePoint(memberCode, pointAccumulate);
	}
	
}















