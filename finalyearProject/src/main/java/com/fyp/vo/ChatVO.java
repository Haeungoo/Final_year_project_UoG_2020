package com.fyp.vo;

public class ChatVO{
	private int cno;
	private String user1;
	private String user2;
	
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getUser1() {
		return user1;
	}
	public void setUser1(String user1) {
		this.user1 = user1;
	}
	public String getUser2() {
		return user2;
	}
	public void setUser2(String user2) {
		this.user2 = user2;
	}

	@Override
	public String toString() {
		return "ChatVO[cno=" + cno + ", user1=" + user1 + ", user2=" + user2 + "]";
	}
	 

	
	
}