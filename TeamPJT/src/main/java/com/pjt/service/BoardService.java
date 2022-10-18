package com.pjt.service;

import java.util.ArrayList;
import java.util.List;

import com.pjt.command.BoardVO;

public interface BoardService {
	public BoardVO getDetaile(int board_num);
	public void register(BoardVO vo);
}
//test 