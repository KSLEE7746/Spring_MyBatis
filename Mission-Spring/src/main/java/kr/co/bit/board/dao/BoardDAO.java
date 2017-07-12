package kr.co.bit.board.dao;

import java.util.List;

import kr.co.bit.board.vo.BoardVO;

public interface BoardDAO {
	
	/**
	 * 전체 게시글 조회 서비스
	 * */
	List<BoardVO> selectAllBoard();
	
	/**
	 * 번호 별 게시글 조회 서비스
	 * */
	BoardVO selectByNoBoard(int no);
	
	/**
	 * 게시글 등록 서비스
	 * */
	void insertBoard(BoardVO board);
	
	/**
	 * @param board
	 * 게시글 수정 서비스
	 */
	void updateBoard(BoardVO board);
	
	
	/**
	 * 게시글 삭제 서비스
	 * */
	void deleteBoard(int no);
}
