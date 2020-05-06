package com.fyp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fyp.dao.CommentDAO;
import com.fyp.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService{
	@Inject 
	private CommentDAO dao;
	
	@Override
	public List<CommentVO> readComment(int bno) throws Exception{
		return dao.readComment(bno);
	}
	
	@Override
	public void writeComment(CommentVO vo) throws Exception{
		dao.writeComment(vo);
	}
	
	@Override
	public void updateComment(CommentVO vo) throws Exception{
		dao.updateComment(vo);
	}
	
	@Override
	public void deleteComment(CommentVO vo) throws Exception{
		dao.deleteComment(vo);
	}
	
	@Override
	public CommentVO selectComment(int rno) throws Exception{
		return dao.selectComment(rno);
	}
}