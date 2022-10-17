package com.pjt.mapper;

import java.util.List;

import com.pjt.command.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> getList(int board_num);
	
}
