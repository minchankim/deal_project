package com.project.member;

//���ǿ� ������ ��ü�� Ŭ����(���̵�,�̸�,���ѵ�)
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
