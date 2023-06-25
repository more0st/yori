package com.sp.yogi.owner.market;

import org.springframework.web.multipart.MultipartFile;

public class Market {
	
	private String userId;//회원아이디
	private Long restaurantNum;//업체번호
	private String basePrice;//최소주문금액
	private int state;//오픈/마감상태
	private String openingHour;//오픈시간
	private String closingHour;//마감시간
	private String foodInfo;//원산지 정보
	
	private Long num;//배달지역 등록번호
	private String addr;//배달지역(동단위)
	private String deliveryFee;//동별 배달요금
	
	private Long fileNum;//업체이미지번호
	private String imageFilename;//이미지파일이름
	private MultipartFile selectFile;
	
	

	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getRestaurantNum() {
		return restaurantNum;
	}
	public void setRestaurantNum(Long restaurantNum) {
		this.restaurantNum = restaurantNum;
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
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(String deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public Long getFileNum() {
		return fileNum;
	}
	public void setFileNum(Long fileNum) {
		this.fileNum = fileNum;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	
	
}
