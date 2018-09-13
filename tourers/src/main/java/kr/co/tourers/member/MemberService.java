package kr.co.tourers.member;

import kr.co.tourers.vo.MemberVO;
import kr.co.tourers.vo.TermsVO;

public interface MemberService {
	
	public MemberVO login(MemberVO vo);
	public TermsVO getTerms();
	public void insertMember(MemberVO vo);
	public int duplCheck(int type, String value);
}