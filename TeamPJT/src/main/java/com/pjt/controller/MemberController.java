package com.pjt.controller;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pjt.member.commend.MemberVO;
import com.pjt.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {

	
	@Autowired
	private MemberService memberservice;
	
	//로그인 화면
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinform(MemberVO member) throws Exception{
		
		
		return null;
		
	}
	
	
	
	
	
	
}
