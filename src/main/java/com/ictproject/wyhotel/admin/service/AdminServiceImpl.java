package com.ictproject.wyhotel.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.admin.mapper.IAdminMapper;
import com.ictproject.wyhotel.command.MemberVO;
import com.ictproject.wyhotel.command.QuestionVO;
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
	
	// 문의내역 관련 서비스
	// 문의내역 리스트 가져오기
	@Override
	public List<QuestionVO> getQuestionList() {	
		
		return mapper.getQuestionList();
		
	}
	
	// 문의내역 하나 가져오기
	@Override
	public QuestionVO getQuestion(String questionCode) {
		return mapper.getQuestion(questionCode);
	}
	
	// 메일도 보내고, DB에 값 수정 진행해야함!
	@Override
	public boolean replyQuestion(QuestionVO question) {
		// 완전체 VO 세팅 (메일에 필요한 내용이니까 왠만해서는 다 가져가자)
		QuestionVO vo = mapper.getQuestion(question.getQuestionCode());
		vo.setQuestionAnswer(question.getQuestionAnswer());
		
		// 메일이 정상적으로 보내졌으면 true 리턴
		if(mailService.sendQuestionReply(vo)) {
			mapper.updateQuestion(vo);
			return true;
		} else {
			return false;
		}
		
		
	}

}
