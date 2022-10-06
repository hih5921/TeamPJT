package com.pjt.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pjt/")
public class test {
	
	@RequestMapping("/main")
	public String test() {

		return "pjt/main";
	}
	
	@RequestMapping("/detaile")
	public String detaile() {
		System.out.println("수정합니다.");
		return "pjt/detaile";
	}
}
