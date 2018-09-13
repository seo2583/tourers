package kr.co.tourers.member;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tourers.vo.MemberVO;
import kr.co.tourers.vo.TermsVO;

@Controller
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String login(String login, Model model, HttpServletRequest request){
		
		String referer = (request.getHeader("Referer")).substring(29);

		model.addAttribute("login", login);
		model.addAttribute("referer", referer);
		
		return "/member/login";
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public String login(HttpSession session, Model model, MemberVO vo, String referer) {

		MemberVO user = service.login(vo);
		
		if (user != null) {
			session.setAttribute("user", user);
			return "redirect:"+referer;
		} else {
			return "redirect:/member/login.do?login=fail";
		}
	}
	
	@RequestMapping(value="/member/logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/terms.do")
	public String term(Model model) {

		TermsVO terms = service.getTerms();
		model.addAttribute("terms", terms);
		
		return "/member/terms";
	}
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.GET)
	public String register() {
		return "/member/register";
	}

	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public String register(HttpServletRequest request, MemberVO vo) {
		
		vo.setTr_regip(request.getRemoteAddr());
		service.insertMember(vo);
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/member/duplCheck.do")
	@ResponseBody
	public Map<String, Integer> duplCheck(int type, String value) {
		
		int result = service.duplCheck(type, value);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);
		
		return map;
	}
	
	
}
