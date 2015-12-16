package com.project.member;

//세션에 저장할 객체의 클래스(아이디,이름,권한등)
public class SessionInfo {
	private String userName, userId;
	private int cash;
	private int dealInNoticeCount,favoriteNoticeCount,uploadNoticeCount;
	private int myDealTotal;
	private int businessNum;
	private int letterNoticeCount; // 받은 쪽지 알람 수
	
	
	

	public int getBusinessNum() {
		return businessNum;
	}

	public void setBusinessNum(int businessNum) {
		this.businessNum = businessNum;
	}

	public int getMyDealTotal() {
		return myDealTotal;
	}

	public void setMyDealTotal(int myDealTotal) {
		this.myDealTotal = myDealTotal;
	}

	public int getDealInNoticeCount() {
		return dealInNoticeCount;
	}

	public void setDealInNoticeCount(int dealInNoticeCount) {
		this.dealInNoticeCount = dealInNoticeCount;
	}

	public int getFavoriteNoticeCount() {
		return favoriteNoticeCount;
	}

	public void setFavoriteNoticeCount(int favoriteNoticeCount) {
		this.favoriteNoticeCount = favoriteNoticeCount;
	}

	public int getUploadNoticeCount() {
		return uploadNoticeCount;
	}

	public void setUploadNoticeCount(int uploadNoticeCount) {
		this.uploadNoticeCount = uploadNoticeCount;
	}

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

	public int getLetterNoticeCount() {
		return letterNoticeCount;
	}

	public void setLetterNoticeCount(int letterNoticeCount) {
		this.letterNoticeCount = letterNoticeCount;
	}
}
