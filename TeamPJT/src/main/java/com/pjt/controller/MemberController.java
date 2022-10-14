package com.pjt.controller;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pjt.member.commend.MemberVO;
import com.pjt.service.MemberService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/member")
public class MemberController {

	
	@Autowired
	private MemberService memberservice;
	
	//로그인 화면
	@RequestMapping("/login")
	public String login() {
		return "/pjt/member/login";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "pjt/member/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinform(MemberVO member) throws Exception{
		
		
		return null;
		
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "/pjt/member/mypage";
	}
	
	@RequestMapping("/update_member")
	public String update_member() {
		return "/pjt/member/update_member";
	}
	
	@RequestMapping("/update_pw")
	public String update_pw() {
		return "/pjt/member/update_pw";
	}
	
	@RequestMapping("/delete")
	public String delete() {
		return "/pjt/member/delete";
	}
	
	
	
	
	
	
	
}
