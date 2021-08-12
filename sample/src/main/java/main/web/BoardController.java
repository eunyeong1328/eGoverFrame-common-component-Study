package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

//실질적인 프로그래밍
@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody //비동기 전송방식으로  화면에 데이터 전송 
	public String insertNBoard(BoardVO vo) throws Exception{
		// result = null 정상실행시 null
		String result = boardService.insertNBoard(vo);
		System.out.println(result);
		String msg = "";
		if(result == null) msg = "ok";
		else msg = "fail";
		
		return msg; //값 전달
	}
	
	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo,ModelMap model) throws Exception{
		List<?> list = boardService.selectNBoardList(vo);
		System.out.println("list: " + list);
		model.addAttribute("resultList",list);
		return"board/boardList";
	}
}
