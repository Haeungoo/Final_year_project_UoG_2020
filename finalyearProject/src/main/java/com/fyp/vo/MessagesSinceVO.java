package com.fyp.vo;

public class MessagesSinceVO{
	private int cno;
	private int mno;
	
	

	public int getCno() {
		return cno;
	}



	public void setCno(int cno) {
		this.cno = cno;
	}



	public int getMno() {
		return mno;
	}



	public void setMno(int mno) {
		this.mno = mno;
	}



	@Override
	public String toString() {
		return "MessagesSinceVO[cno=" + cno + ", mno=" + mno + "]";
	}
	
}