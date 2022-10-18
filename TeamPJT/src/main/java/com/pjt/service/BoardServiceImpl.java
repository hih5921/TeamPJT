package com.pjt.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjt.command.BoardVO;
import com.pjt.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper bmp;
	
	
	@Override
	public BoardVO getDetaile(int board_num) {
		return bmp.getDetaile(board_num);
	}
	@Override
	public void register(BoardVO vo) {
		bmp.register(vo);
		
	}
}
