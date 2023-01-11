package com.ictproject.wyhotel.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.admin.mapper.IAdminMapper;
import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.util.MailSendService;
import com.ictproject.wyhotel.util.paging.PageCreator;
import com.ictproject.wyhotel.util.paging.PageVO;

@Service
public class AdminServiceImpl implements IAdminService {

	@Autowired
	private IAdminMapper mapper;
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private PageCreator pc;
	
	@Override
	public List<MemberVO> getMemberList(PageVO paging) {		
		return mapper.getMemberList(paging);
	}
	
	@Override
	public PageCreator getPageCreator(PageVO paging) {
		pc.setPaging(paging);
		pc.setArticleTotalCount(mapper.getMemberCount(paging));
		return pc;
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
	
	@Override
	public void updateTempPassword(MemberVO member) {
		// 메일도 보내고, 리턴값으로 변경되는 임시 비밀번호 받아옴
		String tempPassword = mailService.sendPasswordEmail(member.getEmail());
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();	
		
		member.setPassword(encoder.encode(tempPassword));
		
		mapper.updateTempPassword(member);
	}

}
