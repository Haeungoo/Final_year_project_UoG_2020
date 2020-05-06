package com.fyp.dao;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fyp.vo.ChatVO;
import com.fyp.vo.MessageVO;
import com.fyp.vo.MessagesSinceVO;


@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	//select the message
	@Override
	public List<MessageVO> readMessages(ChatVO vo) throws Exception{
		return sqlSession.selectList("messageMapper.readMessages", vo);
	}
	
	public List<MessageVO> readMessagesSince(MessagesSinceVO vo) throws Exception{
		return sqlSession.selectList("messageMapper.readMessagesSince", vo);
	}

	
	//insert the message
	@Override
	public void writeMessage(MessageVO vo) throws Exception{
		sqlSession.insert("messageMapper.writeMessage", vo);
	}
}