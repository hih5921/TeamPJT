package com.pjt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pjt.command.Criteria;
import com.pjt.command.ReplyPageVO;
import com.pjt.command.ReplyVO;
import com.pjt.mapper.ReplyMapper;

import lombok.Setter;


@Service
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public ReplyVO get(int rno) {
		
		return mapper.read(rno);
	}
	
	@Override
	public List<ReplyVO> getList(Criteria cri, int bno) {
		
		return mapper.getListWithPaging(cri, bno);
	}
	
	@Override
	public int modify(ReplyVO vo) {
		
		return mapper.update(vo);
	}
	
	@Override
	public int register(ReplyVO vo) {
		
		return mapper.insert(vo);
	}
	
	@Override
	public int remove(int rno) {
		return mapper.delete(rno);
	}
	@Override
	public ReplyPageVO getListPage(Criteria cri, int bno) {
		
		return new ReplyPageVO(mapper.getCountBybno(bno), mapper.getListWithPaging(cri, bno));
	}
}
