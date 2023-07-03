package com.sp.yogi.mypage;

public class Like {

	private String userId;
	private String restaurantName;
	private String userName;
	private Long restaurantNum;
	private String imgFileName;
	private Long reviewCount;
	private Long basePrice;
	private double rating;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public Long getRestaurantNum() {
		return restaurantNum;
	}

	public void setRestaurantNum(Long restaurantNum) {
		this.restaurantNum = restaurantNum;
	}

	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}

	public Long getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(Long reviewCount) {
		this.reviewCount = reviewCount;
	}

	public Long getBasePrice() {
		return basePrice;
	}

	public void setBasePrice(Long basePrice) {
		this.basePrice = basePrice;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

}
