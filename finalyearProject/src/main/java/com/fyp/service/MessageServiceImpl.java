package com.fyp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fyp.dao.MessageDAO;
import com.fyp.vo.ChatVO;
import com.fyp.vo.MessageVO;
import com.fyp.vo.MessagesSinceVO;

@Service
public class MessageServiceImpl implements MessageService{
	@Inject
	private MessageDAO dao;
	
	//select the messages
	@Override
	public List<MessageVO> readMessages(ChatVO vo) throws Exception{
		return dao.readMessages(vo);
	}
	
	//select the messages since the date
	@Override
	public List<MessageVO> readMessagesSince(MessagesSinceVO vo) throws Exception{
		return dao.readMessagesSince(vo);
	}
	
	//insert the message
	@Override
	public void writeMessage(MessageVO vo) throws Exception{
		dao.writeMessage(vo);
	}
}