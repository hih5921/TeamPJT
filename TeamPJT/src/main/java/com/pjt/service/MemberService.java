package com.pjt.service;

import com.pjt.member.commend.MemberVO;

public interface MemberService {
	
	public int join(MemberVO vo); //회원가입
	public int login(MemberVO vo); //로그인
	public int idCheck(String id); //아이디 확인

}
