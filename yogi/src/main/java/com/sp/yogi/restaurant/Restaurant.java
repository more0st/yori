package com.sp.yogi.restaurant;

public class Restaurant {
	// 리뷰 개수
	private Long reviewCount;
	
	private Long restaurantNum;
	private Double rating;
	private String restaurantName;
	private String basePrice;
	private int state;
	
	// 주소, 카테고리
	private String addr1;
	private Long categoryNum;
	
	// 이미지
	private String imageFilename;
	
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public Long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public Long getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(Long reviewCount) {
		this.reviewCount = reviewCount;
	}
	public Long getRestaurantNum() {
		return restaurantNum;
	}
	public void setRestaurantNum(Long restaurantNum) {
		this.restaurantNum = restaurantNum;
	}
	public Double getRating() {
		return rating;
	}
	public void setRating(Double rating) {
		this.rating = rating;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public String getBasePrice() {
		return basePrice;
	}
	public void setBasePrice(String basePrice) {
		this.basePrice = basePrice;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}
