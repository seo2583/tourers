package kr.co.tourers.nation;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tourers.vo.NationSpotVO;
import kr.co.tourers.vo.NationInfoVO;

@Repository
public class NationDAO {
	
	@Inject
	private SqlSessionTemplate mybatis;
	
	public NationInfoVO selectNation(String nationName) {
		return mybatis.selectOne("mapper_nation.getNationInfo", nationName);
	}
	
	public int isNation(String nationName) {
		return mybatis.selectOne("mapper_nation.getIsNation", nationName);
	}
	
	public List<NationSpotVO> getSpotName(String nationName) {
		return mybatis.selectList("mapper_nation.getSpotName", nationName);
	}
	
	public NationSpotVO spotDetail(String spotName) {
		return mybatis.selectOne("mapper_nation.getSpotDetail", spotName);
	}
	
}
