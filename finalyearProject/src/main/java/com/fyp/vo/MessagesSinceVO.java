package com.fyp.vo;

import java.util.Date;

public class MessagesSinceVO{
	private Date date;
	private ChatVO chatVO;
	
	
	public Date getDate() {
		return date;
	}



	public void setDate(Date date) {
		this.date = date;
	}



	public ChatVO getChatVO() {
		return chatVO;
	}



	public void setChatVO(ChatVO chatVO) {
		this.chatVO = chatVO;
	}
	 
	@Override
	public String toString() {
		return "MessagesSinceVO[date=" + date.toString()+ ", chatVO=" + chatVO.toString() + "]";
	}

	
}