package com.fyp.dao;

import java.util.List;

import com.fyp.vo.CommentVO;

public interface CommentDAO{
	
	//read the comment
	public List<CommentVO> readComment(int bno) throws Exception;

	//insert the comment
	public void writeComment(CommentVO vo) throws Exception;

	//update the comment
	public void updateComment(CommentVO vo) throws Exception;
	
	//delete the comment
	public void deleteComment(CommentVO vo) throws Exception;
	
	//select the comment
	public CommentVO selectComment(int rno) throws Exception;

}