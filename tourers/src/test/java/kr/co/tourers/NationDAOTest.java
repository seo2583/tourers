package kr.co.tourers;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.tourers.nation.NationDAO;
import kr.co.tourers.vo.NationInfoVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class NationDAOTest {

	@Inject
	private NationDAO dao;
	
	@Test
	public void testSelect() {
		
		NationInfoVO nation = new NationInfoVO();
		
		nation = dao.selectNation("ÇÑ±¹");
		
		System.out.println("nation_name : " + nation.getTr_country_name());
		
	}
	
}
