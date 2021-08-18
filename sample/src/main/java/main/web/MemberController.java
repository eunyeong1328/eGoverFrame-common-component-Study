package main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	
	//다른 클래스를 사용하려면 Resource 선언을 해야 한다.
	@Resource(name = "memberService")
	private MemberService memberService;

	/*
	 * 회원등록화면
	 */
	@RequestMapping(name = "/memberWrite.do")
	public String memberWrite() {
		return "member/memberWrite"; 
	}
	/*
	 * 회원등록처리(저장)
	 */
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception {
		String result = memberService.insertMember(vo);
		System.out.println(result);
		String msg = "";
		if(result == null) msg = "ok"; 
		else msg = "fail";
		return msg;
	}
}
