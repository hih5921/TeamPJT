package com.pjt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjt.member.commend.MemberVO;
import com.pjt.member.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public int join(MemberVO vo) {
		
		int result = mapper.join(vo);
		System.out.println(result);
		
		return result;
	}

	@Override
	public int login(MemberVO vo) {
		
		int result = mapper.login(vo);
		System.out.println(result);
		
		return result;
	}

	@Override
	public int idCheck(String id) {
		
		int result = mapper.idCheck(id);
		System.out.println(result);
		
		return result;
	}
}
