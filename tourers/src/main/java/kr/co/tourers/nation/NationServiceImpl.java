package kr.co.tourers.nation;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.tourers.vo.NationSpotVO;
import kr.co.tourers.vo.NationInfoVO;

@Service
public class NationServiceImpl implements NationService {

	@Inject
	private NationDAO dao;

	@Override
	public NationInfoVO selectNation(String nationName) {
		return dao.selectNation(nationName);
	}

	@Override
	public int isNation(String nationName) {
		return dao.isNation(nationName);
	}
	
	@Override
	public List<NationSpotVO> getSpotName(String nationName) {
		return dao.getSpotName(nationName);
	}

	@Override
	public NationSpotVO spotDetail(String spotName) {
		return dao.spotDetail(spotName);
	}

}
