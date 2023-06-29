package com.sp.yogi.admin.domain;

public class MemberWithCount extends Member {
	private int reviewCount;
	private int buyCount;
	private int reviewReportCount;
	
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getBuyCount() {
		return buyCount;
	}
	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}
	public int getReviewReportCount() {
		return reviewReportCount;
	}
	public void setReviewReportCount(int reviewReportCount) {
		this.reviewReportCount = reviewReportCount;
	}

}
