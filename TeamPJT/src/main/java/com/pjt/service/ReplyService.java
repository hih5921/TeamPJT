package com.pjt.service;

import java.util.List;

import com.pjt.command.BoardVO;
import com.pjt.command.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> getReply(int board_num);
}
