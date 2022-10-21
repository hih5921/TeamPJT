package com.pjt.mapper;

import java.util.ArrayList;
import java.util.List;



import com.pjt.command.BoardVO;
import com.pjt.command.Criteria;

public interface BoardMapper {
	public BoardVO getDetaile(int board_num);
	public void register(BoardVO vo);
	public void modify(BoardVO vo);
	public List<BoardVO> search(String Board_title);
	public List<BoardVO> getlist();
	public int getTotal();
	public ArrayList<BoardVO> pagingList(Criteria cri);
	
}
