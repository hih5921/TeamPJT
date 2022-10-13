package com.pjt.controller;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pjt.command.BoardVO;
import com.pjt.command.Criteria;
import com.pjt.service.BoardService;
 

 
@Controller
@RequestMapping("/pjt/")
public class BoardController {
 
    @Autowired
    BoardService boardService;
 
    @RequestMapping("/list")
	public String main() {
		return "pjt/list";
	}
    //게시글 리스트 조회
//    @RequestMapping("/list")
//	public String list(Model model,Criteria cri) {
//		//게시글 정보 가져오기...(Criteria을 기준으로 설정)
//		ArrayList<BoardVO> list = boardService.getList(cri);
//		
//		model.addAttribute("board_list", list);
//		
//		//게시글 전체 데이터 가져오기
//		int total = boardService.getTotal();  //게시글 전체 갯수를 알아오는 메서드
//		model.addAttribute("pageMaker", new PageVO(cri, total));
//		
//		return "list";
//   
//    }
    
}