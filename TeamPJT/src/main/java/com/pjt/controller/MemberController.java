package com.pjt.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pjt.member.commend.MemberVO;
import com.pjt.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {

	//1111
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
	
	//마이페이지
	@RequestMapping("/mypage")
	public String mypage() {
		return "/pjt/member/mypage";
	}
	
	//내 정보 변경
	@RequestMapping("/update_member")
	public String update_member(HttpSession session) {
		// MemberVO vo = (MemberVO)session.getAttribute("vo");
		return "/pjt/member/update_member";
	}
	
	//비밀번호 변경
	@RequestMapping("/update_pw")
	public String update_pw() {
		return "/pjt/member/update_pw";
	}
	
	//회원탈퇴
	@RequestMapping("/delete")
	public String delete() {
		return "/pjt/member/delete";
	}
	
	@RequestMapping("/update_member_form")
	public String update_member_form(MemberVO vo,RedirectAttributes RA) {
		int result = memberservice.update(vo);
		if(result==1) {
			RA.addFlashAttribute("msg", "정보수정 성공");
		}else {
			RA.addFlashAttribute("msg","정보수정 실패");
		}
		return "redirect:/member/mypage";
	}
	
	@RequestMapping("/update_pw_form")
	public String update_pw_form(@RequestParam("newpw") String newpw,RedirectAttributes RA,HttpSession session) {
		String id = (String)session.getAttribute("user_id");
		int result = memberservice.updatePW(newpw,id);
		if(result==1) {
			RA.addFlashAttribute("msg", "비밀번호 변경 완료");
		}else {
			RA.addFlashAttribute("msg","비밀번호 변경 실패");
		}
		return "redirect:/member/mypage";
	}
	
	@RequestMapping("delete_form")
	public String delete_form(RedirectAttributes RA,HttpSession session) {
		// 세션으로 아이디 값 불러오기
		String id = (String)session.getAttribute("user_id");
		int result = memberservice.delete(id);
		
		if(result==1) {
			RA.addFlashAttribute("msg", "회원탈퇴 완료");
		}else {
			RA.addFlashAttribute("msg","회원탈퇴 실패");
			return "redirect:/member/mypage";
		}
		
		return "redirect:/pjt/main";
	}
	
	
	
	
	
	
}
