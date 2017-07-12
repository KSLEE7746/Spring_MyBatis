package kr.co.bit.board.dao;

import java.util.List;

import kr.co.bit.board.vo.BoardVO;

public interface BoardDAO {
	
	/**
	 * ��ü �Խñ� ��ȸ ����
	 * */
	List<BoardVO> selectAllBoard();
	
	/**
	 * ��ȣ �� �Խñ� ��ȸ ����
	 * */
	BoardVO selectByNoBoard(int no);
	
	/**
	 * �Խñ� ��� ����
	 * */
	void insertBoard(BoardVO board);
	
	/**
	 * @param board
	 * �Խñ� ���� ����
	 */
	void updateBoard(BoardVO board);
	
	
	/**
	 * �Խñ� ���� ����
	 * */
	void deleteBoard(int no);
}
