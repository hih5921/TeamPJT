package com.pjt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.pjt.command.Criteria;
import com.pjt.command.ReplyPageVO;
import com.pjt.command.ReplyVO;
import com.pjt.service.ReplyService;

import lombok.AllArgsConstructor;


@RestController
@RequestMapping("/replies")
@AllArgsConstructor
public class ReplyController {
	
	@Autowired
	ReplyService rs;
	
	@PostMapping(value = "/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		System.out.println("ReplyVO : "+vo);
		
		return rs.register(vo)==1? new ResponseEntity<String>("success",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{bno}/{page}",produces= {
			MediaType.APPLICATION_XML_VALUE, 
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageVO> getList(@PathVariable("page") int page, @PathVariable("bno") int bno ){
		Criteria cri = new Criteria(page,10);
		System.out.println(cri);
		
		return new ResponseEntity<ReplyPageVO>(rs.getListPage(cri, bno),HttpStatus.OK);
		
	}
	
	//조회 및 삭제 
	@GetMapping(value = "/{rno}",produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") int rno){
		System.out.println("get"+rno);
		return new ResponseEntity<ReplyVO>(rs.get(rno),HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{rno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") int rno){
		
		return rs.remove(rno)==1?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH},consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo,@PathVariable("rno")int rno){
		vo.setReply_num(rno);
		return rs.modify(vo)==1?new ResponseEntity<String>("success",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
}
