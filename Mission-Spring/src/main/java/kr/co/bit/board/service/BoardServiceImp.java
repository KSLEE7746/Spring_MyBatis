package kr.co.bit.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bit.board.dao.BoardDAO;
import kr.co.bit.board.vo.BoardVO;

@Service
public class BoardServiceImp implements BoardService {
	
	@Autowired
	private BoardDAO dao;

	public List<BoardVO> selectAllBoard() {
		
		List<BoardVO> list = dao.selectAllBoard();
		
		// TODO Auto-generated method stub
		return list;
	}

	public BoardVO selectByNoBoard(int no) {
		BoardVO board = dao.selectByNoBoard(no);
		return board;
	}

	public void insertBoard(BoardVO board) {
		dao.insertBoard(board);		
	}

	public void updateBoard(BoardVO board) {
		dao.updateBoard(board);		
	}

	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}
}
