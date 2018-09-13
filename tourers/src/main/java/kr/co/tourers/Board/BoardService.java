package kr.co.tourers.Board;

import java.util.List;

import kr.co.tourers.vo.BoardFilesVO;
import kr.co.tourers.vo.BoardVO;

public interface BoardService {
	
	public List<BoardVO> getList(String cat, int limit);
	public BoardFilesVO getPicture(int parent);
	public int getTotalList(String cat);
	public BoardVO view(int seq);
	public BoardFilesVO getFile(int parent);
	public List<BoardVO> getComment(int parent);
	public void hitUp(int seq);
	public int write(BoardVO vo);
	public void fileUpload(BoardFilesVO bfvo);
	public void comment_write(BoardVO vo);
	public void comment_delete(int seq);
	public void comment_num_plus(int seq);
	public void comment_num_minus(int seq);
	public void modify(BoardVO vo);
	public void deleteAll(int seq);
	public void file_num_plus(int parent);
}