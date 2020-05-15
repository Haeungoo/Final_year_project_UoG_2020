package com.fyp.service;

import java.util.List;

import com.fyp.vo.ChatVO;
import com.fyp.vo.MemberVO;
import com.fyp.vo.MessageVO;

public interface ChatService{
	// check whether the chat is new or not
	public int newChat(ChatVO chatVO) throws Exception;
	
	// write message
	public void writeMessage(MessageVO messageVO) throws Exception;
	
	// start the chat
	public void write(ChatVO chatVO) throws Exception;	

	// select the list of chat
	public List<ChatVO> list(MemberVO vo) throws Exception;
	
	// select the list of chat
	public ChatVO read(int cno) throws Exception;
	
	// select the list of chat (connect ChatVO and MessageVO)
	public ChatVO getChat(ChatVO vo) throws Exception;
}