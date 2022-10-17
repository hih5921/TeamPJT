package com.pjt.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pjt.command.BoardVO;
import com.pjt.service.BoardService;

@Controller
@RequestMapping("/pjt/")
public class mainController {
	
	@Autowired
	BoardService bs;
	
	@RequestMapping("/main")
	public String main() {
		return "pjt/main";
	}
	
	
	
	
	
}
