package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;
//@를 외우지 말고 "여기 이런게 있어구나~"라고 알기
//@는 그냥 다른 코드 참조해서 만들기
//DAO는 정확하게는 ibatis의 연결를 담당함(sql의 구조를 담고 있는 프로그램)
@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO{

	public String insertNBoard(BoardVO vo) {
		return (String) insert("boardDAO.insertNBoard",vo);
	}

	public List<?> selectNBoardList(BoardVO vo) {
		return list("boardDAO.selectNBoardList",vo);
	}

	public int selectNBoardTotal(BoardVO vo) {
		return (int) select("boardDAO.selectNBoardTotal",vo);
	}
}
