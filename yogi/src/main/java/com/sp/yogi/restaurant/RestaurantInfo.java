package com.sp.yogi.restaurant;

import java.util.List;

public class RestaurantInfo {
	private Long restaurantNum;
	private String businessNum;
	private String restaurantName;
	private String restaurantAddr1;
	private String restaurantAddr2;
	private String restaurantTel;
	private Long basePrice;
	private String openingHour;
	private String closingHour;
	private String foodInfo;
	
	private List<Category> categoryList;	// 카테고리
	
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
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
	public String getRestaurantAddr1() {
		return restaurantAddr1;
	}
	public void setRestaurantAddr1(String restaurantAddr1) {
		this.restaurantAddr1 = restaurantAddr1;
	}
	public String getRestaurantAddr2() {
		return restaurantAddr2;
	}
	public void setRestaurantAddr2(String restaurantAddr2) {
		this.restaurantAddr2 = restaurantAddr2;
	}
	public String getRestaurantTel() {
		return restaurantTel;
	}
	public void setRestaurantTel(String restaurantTel) {
		this.restaurantTel = restaurantTel;
	}
	public Long getBasePrice() {
		return basePrice;
	}
	public void setBasePrice(Long basePrice) {
		this.basePrice = basePrice;
	}
	public String getOpeningHour() {
		return openingHour;
	}
	public void setOpeningHour(String openingHour) {
		this.openingHour = openingHour;
	}
	public String getClosingHour() {
		return closingHour;
	}
	public void setClosingHour(String closingHour) {
		this.closingHour = closingHour;
	}
	public String getFoodInfo() {
		return foodInfo;
	}
	public void setFoodInfo(String foodInfo) {
		this.foodInfo = foodInfo;
	}	
}
