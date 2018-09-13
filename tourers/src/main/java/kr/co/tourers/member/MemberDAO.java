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
	
	// ���̵� �ߺ�üũ
	public int duplCheckUid(String uid) {
		return mybatis.selectOne("mapper_member.duplCheckUid", uid);
	}
	
	// �г��� �ߺ�üũ
	public int duplCheckNick(String nick) {
		return mybatis.selectOne("mapper_member.duplCheckNick", nick);
	}
	
	// �̸��� �ߺ�üũ
	public int duplCheckEmail(String email) {
		return mybatis.selectOne("mapper_member.duplCheckEmail", email);
	}
	
}
