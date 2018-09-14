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
		
		// 어느 페이지에서 로그인 페이지로 들어왔는지 알기위해 전 페이지의 주소값을 얻기 위한 referer
		String referer = (request.getHeader("Referer")).substring(29);

		model.addAttribute("login", login);
		model.addAttribute("referer", referer);
		
		return "/member/login";
	}
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public String login(HttpSession session, Model model, MemberVO vo, String referer) {

		MemberVO user = service.login(vo);
		System.out.println(referer);
		// 로그인 성공
		if (user != null) {
			session.setAttribute("user", user);
			// 로그인 화면에서 또 로그인 화면을 눌렀을때 referer값이 login이 되어 로그인 후 로그인 페이지로 돌아감을 막기위한 방법  
			if (referer.equals("/member/login.do") || referer.equals("/member/login.do?login=fail") ) {
				return "redirect:/";
			} else {
				return "redirect:"+referer;
			}
		} 
		// 로그인 실패
		else {
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
		
		// 아이디, 닉네임, 이메일 중복을 체크하여 중복되는 경우 int값 return
		int result = service.duplCheck(type, value);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);
		
		return map;
	}
	
}
