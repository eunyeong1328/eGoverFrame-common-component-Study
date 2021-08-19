package main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndViewDefiningException;

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
	
	@RequestMapping("/idcheck.do")
	@ResponseBody //ajax에 jsp화면으로 메세지 전달
	public String selectMemberIdCheck(String userid) throws Exception{
		
		String message = "";
		int count = memberService.selectMemberIdCheck(userid);
		if(count == 0) {
			message = "ok"; 
		}
		return message;
	}
	
	@RequestMapping("/post1.do")
	public String post1() {
		return "member/post1";
	}
	
	@RequestMapping("/post2.do")
	public String post2(String dong, ModelMap model) throws Exception{
		List<?> list = memberService.selectPostList(dong);
		model.addAttribute("resultList",list);
		return "member/post2";
	}
	
	@RequestMapping("/loginWrite.do")
	public String loginWrite() {//db연동을 하지 않기 때문에 throws Exception안 해도 된다.
		return "member/loginWrite";
	}
	
	@RequestMapping("loginWriteSub.do")//비동기 방식으로 데이터가 넘어오면
	@ResponseBody 						//다시 화면에 데이터를 결과 메세지로 보내야 한다.
	public String loginProcessing(MemberVO vo, HttpSession session) throws Exception{
											//session을 만들어주는 클래스
		String message = "";
		int count = memberService.selectMemberCount(vo);
		System.out.println(count);
		if(count == 1) {
			//session 생성
			session.setAttribute("SessionUserID", vo.getUserid());
			//message 처리
			message = "ok";
		}
		return message;
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("SessionUserID");
		return "member/loginWrite";
	}
}
