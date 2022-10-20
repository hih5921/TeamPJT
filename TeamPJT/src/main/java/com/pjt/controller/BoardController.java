package com.pjt.controller;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pjt.command.BoardVO;
import com.pjt.command.Criteria;
import com.pjt.service.BoardService;
import com.pjt.service.ReplyService;
 

 
@Controller
@RequestMapping("/board/")
public class BoardController {
 
    @Autowired
    BoardService boardService;
    
    @Autowired
    ReplyService rs;
 
    @RequestMapping("/list")
	public String main(Model mo) {
    	mo.addAttribute("board_list",boardService.getlist()); 
		return "pjt/board/list";
	}
    
    @RequestMapping("/detaile")
	public String detaile(int board_num,Model mo) {
    	mo.addAttribute("list", boardService.getDetaile(board_num));
    	mo.addAttribute("reply_list", rs.getList(board_num));
		return "pjt/board/detaile";
	}
    
    @GetMapping("/register")
    public String register(){
    	return "pjt/board/register";
    }
    
    @PostMapping("/register")
    public String register(BoardVO vo) {
    	boardService.register(vo);
    	return "pjt/board/list";
    }
    
    @GetMapping("/modify")
    public String modify(int board_num,Model mo) {
    	mo.addAttribute("list", boardService.getDetaile(board_num));
    	return "pjt/board/modify";
    }
    
    @PostMapping("/modify")
    public String modify(BoardVO vo,Model mo) {
    	boardService.modify(vo);
    	
    	mo.addAttribute("list", boardService.getDetaile(vo.getBoard_num()));
    	mo.addAttribute("reply_list", rs.getList(vo.getBoard_num()));
    	System.out.println(vo.getBoard_num());
    	return "redirect:/board/detaile?board_num="+vo.getBoard_num();
    }
    
    @RequestMapping("/search")
    public String search(String board_title,Model mo) {
    	List<BoardVO> test = boardService.search(board_title);
    	System.out.println(test+"/"+board_title);
    	mo.addAttribute("board_list",test);
    	return "pjt/board/list";
    }
    
}