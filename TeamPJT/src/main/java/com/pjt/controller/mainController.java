package com.pjt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pjt/")
public class mainController {
	
	@RequestMapping("/main")
	public String main() {

		return "pjt/main";
	}
	
	@RequestMapping("/detaile")
	public String detaile() {

		return "pjt/detaile";
	}
}
