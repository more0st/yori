package com.sp.yogi.admin.domain;

public class Store {
	
	private Long restaurantNum;
	private String businessNum;
	private String restaurantName;
	private String userName;
	private String reg_date;
	private String restaurantTel;
	private String tel;
	private String categoryName;
	private String email;
	private int enabled;
	
	private long reportNum;
	private int stateCode;
	private String memo;
	private String registerId;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getRestaurantNum() {
		return restaurantNum;
	}
	public void setRestaurantNum(Long restaurantNum) {
		this.restaurantNum = restaurantNum;
	}
	public String getBusinessNum() {
		return businessNum;
	}
	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getRestaurantTel() {
		return restaurantTel;
	}
	public void setRestaurantTel(String restaurantTel) {
		this.restaurantTel = restaurantTel;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	public long getReportNum() {
		return reportNum;
	}
	public void setReportNum(long reportNum) {
		this.reportNum = reportNum;
	}
	public int getStateCode() {
		return stateCode;
	}
	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getRegisterId() {
		return registerId;
	}
	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}
	
	

}
