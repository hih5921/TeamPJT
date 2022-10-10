package com.pjt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjt.command.ReplyVO;
import com.pjt.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	ReplyMapper rmp;
	
	@Override
	public List<ReplyVO> getReply(int board_num) {
		
		return rmp.getReply(board_num);
	}
}
