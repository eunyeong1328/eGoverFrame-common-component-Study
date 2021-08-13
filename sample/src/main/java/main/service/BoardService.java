package main.service;

import java.util.List;

public interface BoardService {
	/*
	 * 일반게시판 저장처리
	 */
	public String insertNBoard(BoardVO vo) throws Exception;
	/* 
	 * 일반게시판 화면목록
	 */
	 public List<?> selectNBoardList(BoardVO vo) throws Exception;
	 /*
	  *  Total 갯수 얻기
	  */
	 public int selectNBoardTotal(BoardVO vo) throws Exception;
	 /*
	  * 상세화면
	  */
	 public BoardVO selectNBoardDetail(int unq) throws Exception;
	 /*
	  *  조회수 증가
	  */
	 public int updateNBoardHits(int unq) throws Exception;
	 /*
	  * 2021.05.10 수정처리(최소작성)
	  * 개발자 : 홍길동
	  * 2021.11.12 수정처리 (변경작성)
	  * 개발자:누구누구
	  * 수정처리
	  */
	 public int updateNBoard(BoardVO vo) throws Exception; 
	 /*
	  * 암호확인
	  */
	 public int selectNBoardPass(BoardVO vo) throws Exception;
	 
 
}
