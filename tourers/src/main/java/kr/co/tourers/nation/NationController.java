package kr.co.tourers.nation;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tourers.vo.NationSpotVO;
import kr.co.tourers.vo.NationInfoVO;

@Controller
public class NationController {

	@Inject
	private NationService service;
	
	@RequestMapping(value="/nation/nationInfo.do")
	public String selectNation(Model model, String nationName) {
		
		NationInfoVO nation = service.selectNation(nationName);
		model.addAttribute("nation", nation);
		
		return "/nation/nationInfo";
	}
	
	
	@RequestMapping(value="/nation/isNation.do")
	@ResponseBody
	public int isNation(String nationName) {
		
		// 검색시 해당하는 나라가 있으면 int값 리턴
		return service.isNation(nationName);
	}
	
	@RequestMapping(value="/nation/spotName.do")
	public String getSpotName(Model model, String nationName) {
		
		// 주요 관광지 페이지의 관광지 이름들을 보여주기 위한 List
		List<NationSpotVO> spots = service.getSpotName(nationName);
		model.addAttribute("spots", spots);
		model.addAttribute("nName", nationName);
		
		return "/nation/nationSpot";
	}
	
	@RequestMapping(value="/nation/spotDetail.do")
	@ResponseBody
	public NationSpotVO getSpotDetail(String spotName) {
		
		// 관광지를 클릭했을 때 관광지의 정보를 return
		NationSpotVO spot = service.spotDetail(spotName);
		
		return spot;
	}
	
}
