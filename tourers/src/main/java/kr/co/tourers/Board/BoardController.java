package kr.co.tourers.Board;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tourers.vo.BoardFilesVO;
import kr.co.tourers.vo.BoardVO;
import kr.co.tourers.vo.MemberVO;

@Controller
public class BoardController {

	@Inject
	private BoardService service;
	
	@RequestMapping(value="/board/commu.do")
	public String commu(Model model, String cat, int pg) {
		
		// 한 화면에 보여질 글의 수
		int countPage = 10;

		// 이전 or 다음 버튼을 눌렀을때
		// 이전은 10, 20, 30 ... 다음은 11, 21, 31의 페이징 번호로 이동
		int previous = (pg - 1) / countPage * countPage;
		int next = ((pg - 1) / countPage + 1) * countPage + 1;

		// 카테고리별 게시물의 총 갯수
		int total = service.getTotalList(cat);

		// 페이징 갯수 29개, 30개는 3개의 페이지. 31개는 4개의 페이지.
		int count = 0;
		if (total % countPage == 0) {
			if (total == 0) {
				count = 1;
			} else {
				count = total / countPage;
			}
		} else {
			count = total / countPage + 1;
		}

		// 밑에 하단 페이지번호 begin 부터 end 까지 -> 1~10 or 11~20 or 21~30 ...
		int begin = (pg - 1) / countPage * countPage + 1;
		int end = begin + countPage - 1;
		if (end > count) {
			end = count;
		}

		// 데이터베이스에서 불러올 데이터의 시작 값
		int limit = (pg - 1) * countPage;

		// List에 보여줄 글 번호
		total -= limit;

		List<BoardVO> list = service.getList(cat, limit);
		model.addAttribute("list", list);
		model.addAttribute("cat", cat);
		model.addAttribute("pg", pg);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
		model.addAttribute("privious", previous);
		model.addAttribute("next", next);
		
		if (cat.equals("inquiry") || cat.equals("update")) {
			return "/board/servicepage";
		} else if (cat.equals("pic")) {
			
			// 사진이 저장된 경로를 데이터베이스를 이용해서 저장할 pic ArrayList
			List<String> pic = new ArrayList<String>();
			
			Iterator<BoardVO> iterator = list.iterator();
			while(iterator.hasNext()) {
				BoardFilesVO bfvo = service.getPicture(iterator.next().getSeq());
				String path = bfvo.getViewPath();
				String newName = bfvo.getNewName();
				String image = path+newName;
				pic.add(image);
			}

			model.addAttribute("pic", pic);
			
			return "/board/picture";
		} else {
			return "/board/community";
		}
	}
	
	@RequestMapping(value="/board/introduce.do")
	public String introduce() {
		return "/board/introduce";
	}
	
	@RequestMapping(value="/board/view.do")
	public String view(HttpSession session, Model model, String cat, int pg, int seq) {
		
		// seq가 일치하는 글, 글에 첨부된 파일, 글의 댓글들
		BoardVO view = service.view(seq);
		BoardFilesVO file = service.getFile(seq);
		List<BoardVO> comments = service.getComment(seq);
		
		// 해당 글의 조회수 증가
		service.hitUp(seq);
		
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		model.addAttribute("view", view);
		model.addAttribute("file", file);
		model.addAttribute("comments", comments);
		model.addAttribute("user", user);
		model.addAttribute("cat", cat);
		model.addAttribute("pg", pg);
		
		return "/board/view";
	}
	
	@RequestMapping(value="/board/write.do", method=RequestMethod.GET)
	public String write(Model model, String cat, int pg) {
		
		model.addAttribute("cat", cat);
		model.addAttribute("pg", pg);
		return "/board/write";
	}

	@RequestMapping(value="/board/write.do", method=RequestMethod.POST)
	public String write(HttpSession session, HttpServletRequest request, BoardVO vo, String cat, int pg) throws Exception {
		
		// 서버 상의 프로젝트 실제 경로 (/home/seok/tourers)
		String path = request.getSession().getServletContext().getRealPath("/");
		String root = request.getContextPath();
		String saveTarget = path+"resources/upload/";
		String viewTarget = root+"/resources/upload/";
		String oName = null;
		String uName = null;
		
		// 파일 업로드
		MultipartFile file = vo.getFname();
		
		// 파일 첨부 되었을 때 
		if (!file.isEmpty()) {
			// 첨부파일의 원래 이름
			oName = file.getOriginalFilename();
			// 확장자 추출
			String ext = oName.substring(oName.lastIndexOf("."));
			// 첨부파일의 새로운 이름에 확장자를 더함
			uName = UUID.randomUUID().toString()+ext;
			
			file.transferTo(new File(saveTarget + uName));
			vo.setFile(1);
		}
		
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		
		vo.setTr_id(mvo.getTr_id());
		vo.setCat(cat);
		vo.setRegip(request.getRemoteAddr());
		
		// 가장 최신 작성 글
		int seq = service.write(vo);
		
		// 파일이 첨부되었을 때 BoardFiles 데이터베이스에 새 레코드 삽입 
		if (!file.isEmpty()) {
			
			BoardFilesVO bfvo = new BoardFilesVO();
			
			bfvo.setParent(seq);
			bfvo.setSavePath(saveTarget);
			bfvo.setViewPath(viewTarget);
			bfvo.setOldName(oName);
			bfvo.setNewName(uName);
			
			service.fileUpload(bfvo);
		}
		
		return "redirect:/board/view.do?cat="+cat+"&pg="+pg+"&seq="+seq;
	}
	
	@RequestMapping(value="/board/comment_write.do", method=RequestMethod.POST)
	public String comment_write(HttpSession session, HttpServletRequest request, BoardVO vo, String cat, int pg, int seq) {
		
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		
		vo.setParent(seq);
		vo.setTr_id(mvo.getTr_id());
		vo.setRegip(request.getRemoteAddr());
		
		// 댓글 작성
		service.comment_write(vo);
		
		// 해당 글의 댓글 개수 +1
		service.comment_num_plus(seq);
		
		return "redirect:/board/view.do?cat="+cat+"&pg="+pg+"&seq="+seq;
	}
	
	@RequestMapping(value="/board/comment_delete.do")
	public String comment_delete(String cat, int pg, int seq, int c_seq) {
		
		// 댓글 삭제하고 해당 글의 댓글 개수 -1
		service.comment_delete(c_seq);
		service.comment_num_minus(seq);
		
		return "redirect:/board/view.do?cat="+cat+"&pg="+pg+"&seq="+seq;
	}

	@RequestMapping(value="/board/modify.do", method=RequestMethod.GET)
	public String modify(Model model, String cat, int pg, int seq) {
		
		BoardVO vo = service.view(seq);
		
		if (vo.getFile() == 1) {
			BoardFilesVO bfvo = service.getFile(seq);
			model.addAttribute("bfvo", bfvo);
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("cat", cat);
		model.addAttribute("pg", pg);
		
		return "/board/modify";
	}

	@RequestMapping(value="/board/modify.do", method=RequestMethod.POST)
	public String modify(BoardVO vo, String cat, int pg) {
		
		service.modify(vo);
		
		return "redirect:/board/view.do?cat="+cat+"&pg="+pg+"&seq="+vo.getSeq();
	}
	
	@RequestMapping(value="/board/post_delete.do")
	public String post_delete(String cat, int pg, int seq) {
		
		// 해당 글 삭제시 댓글과 첨부파일 또한 다같이 삭제
		service.deleteAll(seq);
		
		return "redirect:/board/commu.do?cat="+cat+"&pg="+pg; 
	}
	
	@RequestMapping(value="/board/fileDown.do")
	public void fileDown(HttpServletResponse response, int seq) throws Exception {
		
		BoardFilesVO bfvo = service.getFile(seq);
		
		String path = bfvo.getSavePath() + "/" + bfvo.getNewName();
		File file = new File(path);
		String name = new String(bfvo.getOldName().getBytes("UTF-8"), "iso-8859-1");

		if (file.exists()) {
			
			service.file_num_plus(seq);
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=" + name + ";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "private");

			byte b[] = new byte[1024];

			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

			int read = 0;
			while ((read = bis.read(b)) != -1) {
				bos.write(b, 0, read);
			}

			bos.flush();				
			bos.close();				
			bis.close();
		
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('파일을 찾을 수 없습니다');</script>");
		}
	}
	
}
