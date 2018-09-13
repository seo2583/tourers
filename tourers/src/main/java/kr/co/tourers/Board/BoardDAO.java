package kr.co.tourers.Board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tourers.vo.BoardFilesVO;
import kr.co.tourers.vo.BoardVO;

@Repository
public class BoardDAO {

	@Inject
	private SqlSessionTemplate mybatis;
	
	public List<BoardVO> getList(String cat, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cat", cat);
		map.put("limit", limit);
		
		return mybatis.selectList("mapper_board.getList", map);
	}
	
	public BoardFilesVO getPicture(int parent){
		return mybatis.selectOne("mapper_board.getPicture", parent);
	}
	
	public int getTotalList(String cat) {
		return mybatis.selectOne("mapper_board.getTotalList", cat);
	}
	
	public BoardVO view(int seq) {
		return mybatis.selectOne("mapper_board.view", seq);
	}
	
	public BoardFilesVO getFile(int parent) {
		return mybatis.selectOne("mapper_board.getFile", parent);
	}
	
	public List<BoardVO> getComment(int parent) {
		return mybatis.selectList("mapper_board.getComment", parent);
	}
	
	public void hitUp(int seq) {
		mybatis.update("mapper_board.hitUp", seq);
	}
	
	public int write(BoardVO vo) {
		mybatis.insert("mapper_board.write", vo);
		return vo.getSeq();
	}
	
	public void fileUpload(BoardFilesVO bfvo) {
		mybatis.insert("mapper_board.fileUpload", bfvo);
	}
	
	public void comment_write(BoardVO vo) {
		mybatis.insert("mapper_board.comment_write", vo);
	}
	
	public void comment_delete(int seq) {
		mybatis.delete("mapper_board.comment_delete", seq);
	}
	
	public void comment_num_plus(int seq) {
		mybatis.update("mapper_board.comment_num_plus", seq);
	}
	
	public void comment_num_minus(int seq) {
		mybatis.update("mapper_board.comment_num_minus", seq);
	}
	
	public void modify(BoardVO vo) {
		mybatis.update("mapper_board.modify", vo);
	}

	public void deleteAll(int seq) {
		mybatis.delete("mapper_board.deleteAll", seq);
	}

	public void file_num_plus(int parent) {
		mybatis.update("mapper_board.file_num_plus", parent);
	}
}
