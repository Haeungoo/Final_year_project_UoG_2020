package com.fyp.service;

import java.util.List;

import com.fyp.vo.ChatVO;
import com.fyp.vo.MemberVO;
import com.fyp.vo.MessageVO;

public interface ChatService{
	
	public int newChat(ChatVO chatVO) throws Exception;
	
	public void writeMessage(MessageVO messageVO) throws Exception;
	
	public void write(ChatVO chatVO) throws Exception;	

	public List<ChatVO> list(MemberVO vo) throws Exception;
	
	public ChatVO read(int cno) throws Exception;
	
	public ChatVO getChat(ChatVO vo) throws Exception;
}