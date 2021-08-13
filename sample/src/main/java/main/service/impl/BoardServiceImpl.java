package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;

//Controller에서 service를 인식할 수 있도록 @를 설정한다.
//컨트롤러와 연결되는 설정
@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name = "boardDAO")
	public BoardDAO boardDAO;
	
	@Override
	public String insertNBoard(BoardVO vo) throws Exception {
		return boardDAO.insertNBoard(vo); 
	}//return 메소드를 실행한 자리에 던진다. 메소드의 결과를 던진다.

	@Override
	public List<?> selectNBoardList(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardList(vo);
	}

	@Override
	public int selectNBoardTotal(BoardVO vo) throws Exception {
		return boardDAO.selectNBoardTotal(vo);
	}

	@Override
	public BoardVO selectNBoardDetail(int unq) throws Exception {
		return boardDAO.selectNBoardDetail(unq);
	}

	@Override
	public int updateNBoardHits(int unq) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
