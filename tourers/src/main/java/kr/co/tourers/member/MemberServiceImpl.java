package kr.co.tourers.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.tourers.vo.MemberVO;
import kr.co.tourers.vo.TermsVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Override
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}
	
	@Override
	public TermsVO getTerms() {
		return dao.getTerms();
	}

	@Override
	public void insertMember(MemberVO vo) {
		dao.insertMember(vo);
	}

	@Override
	public int duplCheck(int type, String value) {
		
		int result = 0;
		
		if(type == 0) {
			result = dao.duplCheckUid(value);
		} else if(type == 1) {
			result = dao.duplCheckNick(value);
		} else if(type == 2) {
			result = dao.duplCheckEmail(value);
		}
		
		return result;
	}

}
