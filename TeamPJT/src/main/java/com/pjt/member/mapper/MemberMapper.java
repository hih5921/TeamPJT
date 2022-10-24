package com.pjt.member.mapper;

import com.pjt.member.commend.MemberVO;

public interface MemberMapper {
	
	public int join(MemberVO vo); //회원 가입
	public int login(MemberVO vo); //로그인 처리
	public int idCheck(String id); //아이디 확인
	public int update(MemberVO vo); //정보수정
	public int updatePW(String newpw,String id); //비밀번호 변경
	public int delete(String id); //회원탈퇴

} 