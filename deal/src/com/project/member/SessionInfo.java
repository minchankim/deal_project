package com.project.member;

//세션에 저장할 객체의 클래스(아이디,이름,권한등)
public class SessionInfo {
	private String userName, userId;
	private int cash;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}
}
