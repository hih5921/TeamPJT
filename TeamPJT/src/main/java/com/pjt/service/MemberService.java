package com.pjt.service;

import com.pjt.member.commend.MemberVO;

public interface MemberService {
	
	public int join(MemberVO vo); 
	public int login(MemberVO vo); 
	public int idCheck(String id); 
	public int nickCheck(String nickname);

}
