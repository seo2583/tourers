package kr.co.tourers.Board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.tourers.vo.BoardFilesVO;
import kr.co.tourers.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public List<BoardVO> getList(String cat, int limit) {
		return dao.getList(cat, limit);
	}
	
	@Override
	public BoardFilesVO getPicture(int parent) {
		return dao.getPicture(parent);
	}

	@Override
	public int getTotalList(String cat) {
		return dao.getTotalList(cat);
	}
	
	@Override
	public BoardVO view(int seq) {
		return dao.view(seq);
	}
	
	@Override
	public BoardFilesVO getFile(int parent) {
		return dao.getFile(parent);
	}
	
	@Override
	public List<BoardVO> getComment(int parent) {
		return dao.getComment(parent);
	}
	
	@Override
	public void hitUp(int seq) {
		dao.hitUp(seq);
	}

	@Override
	public int write(BoardVO vo) {
		return dao.write(vo);
	}

	@Override
	public void fileUpload(BoardFilesVO bfvo) {
		dao.fileUpload(bfvo);
	}
	
	@Override
	public void comment_write(BoardVO vo) {
		dao.comment_write(vo);
	}
	
	@Override
	public void comment_delete(int seq) {
		dao.comment_delete(seq);
	}
	
	@Override
	public void comment_num_plus(int seq) {
		dao.comment_num_plus(seq);
	}

	@Override
	public void comment_num_minus(int seq) {
		dao.comment_num_minus(seq);
	}
	
	@Override
	public void modify(BoardVO vo) {
		dao.modify(vo);
	}

	@Override
	public void deleteAll(int seq) {
		dao.deleteAll(seq);
	}

	@Override
	public void file_num_plus(int parent) {
		dao.file_num_plus(parent);
	}

}
