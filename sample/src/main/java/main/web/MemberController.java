package main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import main.service.MemberVO;
import main.service.impl.MemberService;

@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	/*
	 * 회원등록화면
	 */
	@RequestMapping(name = "/memberWrite.do")
	public String memberWrite() {
		return "/member/memberWrite"; 
	}
	/*
	 * 회원등록처리(저장)
	 */
	@RequestMapping("/memberWriteSave.do")
	public String insertMember(MemberVO vo) throws Exception {
		
		String message = "";
		
		String result = memberService.insertMember(vo);
		if(result == null) {
			message  ="ok";
		}
		
		return message;
		
	}

}
