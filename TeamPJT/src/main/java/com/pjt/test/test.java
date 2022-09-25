package com.pjt.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pjt/")
public class test {
	
	@RequestMapping("/index")
	public String test() {
		System.out.println("실행");
		
		return "pjt/index";
	}
}
