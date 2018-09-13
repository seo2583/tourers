package kr.co.tourers.member;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tourers.vo.MemberVO;
import kr.co.tourers.vo.TermsVO;

@Repository
public class MemberDAO {

	@Inject
	private SqlSessionTemplate mybatis;
	
	public MemberVO login(MemberVO vo) {
		return mybatis.selectOne("mapper_member.login", vo);
	}

	public TermsVO getTerms() {
		return mybatis.selectOne("mapper_member.getTerms");
	}
	
	public void insertMember(MemberVO vo) {
		mybatis.insert("mapper_member.register", vo);
	}
	
	// 아이디 중복체크
	public int duplCheckUid(String uid) {
		return mybatis.selectOne("mapper_member.duplCheckUid", uid);
	}
	
	// 닉네임 중복체크
	public int duplCheckNick(String nick) {
		return mybatis.selectOne("mapper_member.duplCheckNick", nick);
	}
	
	// 이메일 중복체크
	public int duplCheckEmail(String email) {
		return mybatis.selectOne("mapper_member.duplCheckEmail", email);
	}
	
}
