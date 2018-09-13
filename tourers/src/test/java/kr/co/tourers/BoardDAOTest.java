package kr.co.tourers;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.tourers.Board.BoardDAO;
import kr.co.tourers.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;
	
	@Test
	public void test() {
		
		BoardVO vo = new BoardVO();
		
		vo.setParent(3);
		vo.setTr_id("seok");
		vo.setContent("¥Ò±€¿‘¥œ¥Ÿ.");
		vo.setRegip("0:0:0:0:0:0:0:1");
		
		dao.comment_write(vo);
		
	}
	
}
