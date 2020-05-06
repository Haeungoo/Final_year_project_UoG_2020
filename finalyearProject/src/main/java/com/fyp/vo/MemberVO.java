package com.fyp.vo;

import java.util.Date;

public class MemberVO{
	private String userId;
	private String userPw;
	private String userRole;
	private Date regDate;
		
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	@Override
	public String toString() {
		return "MemberVO [userId=" + userId +",userPw="+ userPw + ",userRole=" + userRole +",regDate=" + regDate + "]"; 
	}
}