package com.fyp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fyp.dao.ChatDAO;
import com.fyp.dao.MessageDAO;
import com.fyp.vo.ChatVO;
import com.fyp.vo.MemberVO;
import com.fyp.vo.MessageVO;

@Service
public class ChatServiceImpl implements ChatService{
	@Inject
	private ChatDAO dao;
	private MessageDAO messageDao;
	
	@Override
	public int newChat(ChatVO chatVO) throws Exception{
		return dao.newChat(chatVO);
	}
	
	@Override
	public void writeMessage(MessageVO messageVO) throws Exception{
		messageDao.writeMessage(messageVO);
	}
	
	@Override
	public void write(ChatVO chatVO) throws Exception {
		dao.write(chatVO);
	}
	
	@Override
	public List<ChatVO> list(MemberVO vo) throws Exception{
		return dao.list(vo);
	}

	@Override
	public ChatVO read(int cno) throws Exception{
		return dao.read(cno);
	}
	
	@Override
	public ChatVO getChat(ChatVO vo) throws Exception{
		return dao.getChat(vo);
	}
}
