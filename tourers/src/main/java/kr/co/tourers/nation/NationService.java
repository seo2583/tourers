package kr.co.tourers.nation;

import java.util.List;

import kr.co.tourers.vo.NationSpotVO;
import kr.co.tourers.vo.NationInfoVO;

public interface NationService {
	
	public NationInfoVO selectNation(String nationName);
	public int isNation(String nationName);
	public List<NationSpotVO> getSpotName(String nationName);
	public NationSpotVO spotDetail(String spotName);
	
}