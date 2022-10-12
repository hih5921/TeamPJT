package com.pjt.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pjt/")
public class test {

	@RequestMapping("/mypage")
	public String mypage() {
		return "pjt/mypage";
	}
	
	@RequestMapping("/update_member")
	public String update_member() {
		return "pjt/update_member";
	}
	
	@RequestMapping("/update_pw")
	public String update_pw() {
		return "pjt/update_pw";
	}
	
	@RequestMapping("/delete")
	public String delete() {
		return "pjt/delete";
	}
}
