package com.sp.yogi.mypage;

public class MyPage {
	// 주소록에 필요한 dto 나중에 더 추가하셔요
	private Long memberNum;
	private String zip;
	private String addr1;
	private String addr2;
	private String userId;
	private Long addrerssNum;
	
	
	public Long getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(Long memberNum) {
		this.memberNum = memberNum;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getAddrerssNum() {
		return addrerssNum;
	}
	public void setAddrerssNum(Long addrerssNum) {
		this.addrerssNum = addrerssNum;
	}
	
	
}
