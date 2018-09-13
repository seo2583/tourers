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
		
		return service.isNation(nationName);
	}
	
	@RequestMapping(value="/nation/spotName.do")
	public String getSpotName(Model model, String nationName) {
		
		List<NationSpotVO> spots = service.getSpotName(nationName);
		model.addAttribute("spots", spots);
		model.addAttribute("nName", nationName);
		
		return "/nation/nationSpot";
	}
	
	@RequestMapping(value="/nation/spotDetail.do")
	@ResponseBody
	public NationSpotVO getSpotDetail(String spotName) {
		
		NationSpotVO spot = service.spotDetail(spotName);
		
		return spot;
	}
	
}
