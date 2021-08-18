package main.service.impl;

import main.service.MemberVO;

public interface MemberService {
	/*
	 * 회원등록처리(save)
	 */
	public String insertMember(MemberVO vo) throws Exception;
	

}
