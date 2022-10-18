package com.pjt.mapper;

import java.util.ArrayList;
import java.util.List;

import com.pjt.command.BoardVO;

public interface BoardMapper {
	public BoardVO getDetaile(int board_num);
	public void register(BoardVO vo);
}
