package com.fyp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fyp.vo.ChatVO;
import com.fyp.vo.MemberVO;
import com.fyp.vo.MessageVO;

@Repository
public class ChatDAOImpl implements ChatDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int newChat(ChatVO chatVO) throws Exception{
		return sqlSession.selectOne("chatMapper.newChat", chatVO);
	}
	
	@Override
	public void writeMessage(MessageVO messageVO) throws Exception{
		sqlSession.insert("chatMapper.writeMessage", messageVO);
	}
	
	@Override
	public void write(ChatVO chatVO) throws Exception {
		sqlSession.insert("chatMapper.insert", chatVO);
	}
	
	@Override
	public List<ChatVO> list(MemberVO vo) throws Exception{
		return sqlSession.selectList("chatMapper.list", vo);
	}
	
	@Override
	public ChatVO read(int cno) throws Exception{
		return sqlSession.selectOne("chatMapper.read", cno);
	}

	@Override
	public ChatVO getChat(ChatVO chatVO) throws Exception {
		return sqlSession.selectOne("chatMapper.getChat", chatVO);	
	}
}

