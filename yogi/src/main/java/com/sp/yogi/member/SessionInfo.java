package com.sp.yogi.member;

// 세션에 저장할 정보(아이디, 이름, 권한 등)
public class SessionInfo {
	private long memberNum;
	private String userId;
	private String userName;
	private int membership;
	private String addr1;
	private long restaurantNum;
	private String restaurantName;
	
	// 주문시 받아올 주소
	private String deliveryAddr;
	
	// 사장님 open/close 상태관리
	private int openState;
	
	public int getOpenState() {
		return openState;
	}
	public void setOpenState(int openState) {
		this.openState = openState;
	}
	public String getDeliveryAddr() {
		return deliveryAddr;
	}
	public void setDeliveryAddr(String deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public long getRestaurantNum() {
		return restaurantNum;
	}
	public void setRestaurantNum(long restaurantNum) {
		this.restaurantNum = restaurantNum;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public long getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(long memberNum) {
		this.memberNum = memberNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getMembership() {
		return membership;
	}
	public void setMembership(int membership) {
		this.membership = membership;
	}
}
