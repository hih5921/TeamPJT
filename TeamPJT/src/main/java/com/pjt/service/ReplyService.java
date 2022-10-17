package com.pjt.service;

import java.util.List;

import com.pjt.command.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> getList(int board_num); 
}
