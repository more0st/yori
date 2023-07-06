package com.sp.yogi.mypage;

public class Order {
	// 주문 상태
	private Long stateNum;
	private Long orderNum;
	private String statusName;
	private String field;
	private String memo;

	// 결제
	private Long payNum;
	private String payMethod;
	private String price;
	private String couponNum;
	private String state;

	// 환불
	private String refundMemo;

	public Long getStateNum() {
		return stateNum;
	}

	public void setStateNum(Long stateNum) {
		this.stateNum = stateNum;
	}

	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Long getPayNum() {
		return payNum;
	}

	public void setPayNum(Long payNum) {
		this.payNum = payNum;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(String couponNum) {
		this.couponNum = couponNum;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getRefundMemo() {
		return refundMemo;
	}

	public void setRefundMemo(String refundMemo) {
		this.refundMemo = refundMemo;
	}

}
