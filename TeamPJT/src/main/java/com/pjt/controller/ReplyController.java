package com.pjt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pjt.command.ReplyVO;
import com.pjt.service.ReplyService;

@Controller
@RequestMapping("/replies")
public class ReplyController {

	@Autowired
	ReplyService rs;
	
	@GetMapping(value = "/pages/{board_num}",produces= {
			MediaType.APPLICATION_XML_VALUE, 
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getReply(@PathVariable("board_num") int board_num ){
		
		return new ResponseEntity<List<ReplyVO>>(rs.getReply(board_num),HttpStatus.OK);
	}
	
}
