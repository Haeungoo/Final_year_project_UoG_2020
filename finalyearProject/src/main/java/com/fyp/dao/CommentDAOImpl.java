package com.fyp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fyp.vo.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO{
	
	@Inject SqlSession sql;
	
	//read the comment
	@Override
	public List<CommentVO> readComment(int bno) throws Exception {
		return sql.selectList("commentMapper.readComment",bno);
	}
	
	//insert the comment
	@Override
	public void writeComment(CommentVO vo) throws Exception{
		sql.insert("commentMapper.writeComment", vo);
	}
	
	//update the comment
	@Override
	public void updateComment(CommentVO vo) throws Exception{
		sql.update("commentMapper.updateComment", vo);
	}
	
	//delete the comment
	@Override
	public void deleteComment(CommentVO vo) throws Exception{
		sql.delete("commentMapper.deleteComment", vo);
	}
	
	//select the comment
	@Override
	public CommentVO selectComment(int rno) throws Exception{
		return sql.selectOne("commentMapper.selectComment", rno);
	}
	
	
	
}