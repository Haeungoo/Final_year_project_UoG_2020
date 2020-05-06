package com.fyp.service;

import java.util.List;

import com.fyp.vo.ChatVO;
import com.fyp.vo.MessageVO;
import com.fyp.vo.MessagesSinceVO;

public interface MessageService{
	
	//select the messages
	public List<MessageVO> readMessages(ChatVO vo) throws Exception;
	
	//select the messages since the date
	public List<MessageVO> readMessagesSince(MessagesSinceVO vo) throws Exception;

	//insert the message
	public void writeMessage(MessageVO vo) throws Exception;
}