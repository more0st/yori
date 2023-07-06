package com.sp.yogi.mypage;

public class Coupon {
	private long orderNum;
	private Long eventNum;
	private Long couponNum;
	private String content;
	private String discount;
	private String min_price;
	private String created_date;
	private String expired_date;
	private String used_date;
	private int status;
	private String userId;

	public long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}

	public Long getEventNum() {
		return eventNum;
	}

	public void setEventNum(Long eventNum) {
		this.eventNum = eventNum;
	}

	public Long getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(Long couponNum) {
		this.couponNum = couponNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getMin_price() {
		return min_price;
	}

	public void setMin_price(String min_price) {
		this.min_price = min_price;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getExpired_date() {
		return expired_date;
	}

	public void setExpired_date(String expired_date) {
		this.expired_date = expired_date;
	}

	public String getUsed_date() {
		return used_date;
	}

	public void setUsed_date(String used_date) {
		this.used_date = used_date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
