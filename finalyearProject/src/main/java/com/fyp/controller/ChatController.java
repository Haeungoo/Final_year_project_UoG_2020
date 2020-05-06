package com.fyp.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fyp.service.ChatService;
import com.fyp.service.MessageService;
import com.fyp.vo.ChatVO;
import com.fyp.vo.MemberVO;
import com.fyp.vo.MessageVO;
import com.fyp.vo.MessagesSinceVO;

@Controller
@RequestMapping("/chat/*")
public class ChatController{
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@Inject
	ChatService chatservice;
	
	@Inject
	MessageService messageService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/chat/home";
	}
	
	@RequestMapping(value="/chatView", method=RequestMethod.GET)
	public void chatView() throws Exception{
		logger.info("chatView");
	}
	
	@RequestMapping(value="/chatView2", method=RequestMethod.GET)
	public void chatView2(Model model, ChatVO chatVO) throws Exception{
		logger.info("chatView2");
		logger.info(chatVO.toString());
		logger.info(messageService.readMessages(chatVO).size()+"");
		model.addAttribute("messages", messageService.readMessages(chatVO));
		
	}
	
	@ResponseBody
	@RequestMapping(value="/chatMessageWrite", method=RequestMethod.POST)
	public boolean chatMessageWrite(MessageVO vo) throws Exception{

		logger.info("chatMessageWrite");
		messageService.writeMessage(vo);	
		
		return true;
	}
	
	@ResponseBody
	@RequestMapping(value="/newMessages", method=RequestMethod.POST)
	public List<MessageVO> chatNewMessages(Long date, ChatVO vo) throws Exception{
		Date dateObj = new Date();
		dateObj.setTime(date);
		MessagesSinceVO msvo = new MessagesSinceVO();
		msvo.setDate(dateObj);
		msvo.setChatVO(vo);
		logger.info(dateObj.getTime()+"");
		logger.info("chatNewMessages");
		
		return messageService.readMessagesSince(msvo);	
		
	}	
	
	@RequestMapping(value="/Chat", method=RequestMethod.POST)
	public String Chat(ChatVO chatVO, MessageVO messageVO) throws Exception{
		logger.info("Chat");
		int newChat = chatservice.newChat(chatVO);
		if(newChat==0) {
			chatservice.write(chatVO);
			messageVO.setCno(chatservice.getChat(chatVO).getCno());
			messageService.writeMessage(messageVO);
		}
		return "redirect:/board/list";
		
	}
	@RequestMapping(value="/chatList", method=RequestMethod.GET)
	public String chatList(Model model, MemberVO vo) throws Exception{
		logger.info("chatList");
		
		model.addAttribute("chatList", chatservice.list(vo));
		
		return "chat/chatList";
	}
	
}