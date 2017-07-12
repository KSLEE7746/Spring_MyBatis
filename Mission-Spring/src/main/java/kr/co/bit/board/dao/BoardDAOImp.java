package kr.co.bit.board.dao;

import java.util.List;

import kr.co.bit.board.vo.BoardVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImp implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplete;
	
	/**
	 * 전체 게시글 조회 서비스 
	 */

	public List<BoardVO> selectAllBoard() {
		List<BoardVO> list = sqlSessionTemplete.selectList("board.dao.BoardDAO.selectAllBoard");
		return list;
	}

	
	public BoardVO selectByNoBoard(int no) {
		BoardVO board = sqlSessionTemplete.selectOne("board.dao.BoardDAO.selectByNoBoard", no);
		return board;
	}


	public void insertBoard(BoardVO board) {
		sqlSessionTemplete.insert("board.dao.BoardDAO.insertBoard", board);		
	}


	public void updateBoard(BoardVO board) {
		sqlSessionTemplete.update("board.dao.BoardDAO.updateBoard", board);		
	}


	public void deleteBoard(int no) {
		sqlSessionTemplete.delete("board.dao.BoardDAO.deleteBoard", no);		
	}
	
	
	

}
