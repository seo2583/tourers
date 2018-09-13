package kr.co.tourers;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.tourers.member.MemberDAO;
import kr.co.tourers.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MemberDAOTest {

	@Inject
	private MemberDAO dao;
	
	@Test
	public void testInsert() {
		
		MemberVO vo = new MemberVO();
		vo.setTr_id("seok");
		vo.setTr_pass("1234");
		vo.setTr_name("서동석");
		vo.setTr_nick("재재");
		vo.setTr_email("seo@na.cop");
		vo.setTr_regip("0.1.1.11.111");
		
		dao.insertMember(vo);
		
	}
	
}
