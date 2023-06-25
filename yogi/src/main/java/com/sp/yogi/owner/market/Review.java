package com.sp.yogi.owner.market;

public class Review {
	
	private Long orderNum;
	private String userId;
	private Long rating;
	private String content;
	private String imgFileName;
	private String reg_date;
	private Long enabled;
	private String reply;
	private String reply_date;
	private Long restaurantNum;
	private Long reportNum;
	
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getRating() {
		return rating;
	}
	public void setRating(Long rating) {
		this.rating = rating;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public Long getEnabled() {
		return enabled;
	}
	public void setEnabled(Long enabled) {
		this.enabled = enabled;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public Long getRestaurantNum() {
		return restaurantNum;
	}
	public void setRestaurantNum(Long restaurantNum) {
		this.restaurantNum = restaurantNum;
	}
	public Long getReportNum() {
		return reportNum;
	}
	public void setReportNum(Long reportNum) {
		this.reportNum = reportNum;
	}
	
}
