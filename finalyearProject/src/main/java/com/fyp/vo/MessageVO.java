package com.fyp.vo;

import java.util.Date;

public class MessageVO{
	
	private int mno;
	private int cno;
	private String content;
	private String user1;
	private Date senddate;

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}
	
	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUser1() {
		return user1;
	}

	public void setUser1(String user1) {
		this.user1 = user1;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	@Override
	public String toString() {
		return "MessageVO[mno=" + mno + ", cno=" + cno + ", content=" + content + ", sender=" + user1 + "]";
	}
	 
}