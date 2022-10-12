package com.pjt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pjt.command.Criteria;
import com.pjt.command.ReplyVO;


public interface ReplyMapper {
	public int insert(ReplyVO vo);
	public ReplyVO read(int reply_num) ;
	public int delete(int reply_num);
	public int update(ReplyVO vo);
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("board_num") int board_num);
	public int getCountBybno(int board_num);
	
}
