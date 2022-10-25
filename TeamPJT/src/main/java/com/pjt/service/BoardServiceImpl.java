package com.pjt.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pjt.command.BoardVO;

import com.pjt.command.Criteria;

import com.pjt.command.ImgVO;
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
		if(vo.getImageList() == null || vo.getImageList().size() <= 0) {
			return;
		}
		System.out.println("1"+vo.getImageList());
		System.out.println("2"+vo.getBoard_num());
		for(ImgVO attach : vo.getImageList()) {
			attach.setBoard_num(vo.getBoard_num());
			bmp.imageEnroll(attach);
		}
		
	}
	
	@Override
	public void modify(BoardVO vo) {
		bmp.modify(vo);
	}
	
	@Override
	public List<BoardVO> search(String Board_title) {
		return bmp.search(Board_title);
	}
	
	@Override
	public ArrayList<BoardVO> getlist(Criteria cri) {
		ArrayList<BoardVO>list = bmp.pagingList(cri);
		return list;
	}
	
	@Override
	public int getTotal() {
		int total = bmp.getTotal();
		return total;
	}
	
	@Override
	public List<BoardVO> top4() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int searchCount(String Board_title) {
		
		return bmp.searchCount(Board_title);
	}

	
}
