package com.sp.yogi.owner.register;

// 입점을 위한 업체 정보
public class ResRegister {
	private Long restaurantNum;		// 업체 번호
	private String businessNum;		// 사업자 등록번호
	private String restaurantName;	// 상호명
	private String restaurantAddr1;	// 사업자 주소1
	private String restaurantAddr2;	// 사업자 주소2
	private String restaurantTel;	// 사업자 전화번호

	private String reg_date;		// 입점 일자

	private String restaurantTel1;		
	private String restaurantTel2;		
	private String restaurantTel3;		

	private Long categoryNum;		// 카테고리 번호
	private Long categoryName;		// 카테고리 이름
	
	
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public Long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public Long getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(Long categoryName) {
		this.categoryName = categoryName;
	}
	public String getRestaurantTel1() {
		return restaurantTel1;
	}
	public void setRestaurantTel1(String restaurantTel1) {
		this.restaurantTel1 = restaurantTel1;
	}
	public String getRestaurantTel2() {
		return restaurantTel2;
	}
	public void setRestaurantTel2(String restaurantTel2) {
		this.restaurantTel2 = restaurantTel2;
	}
	public String getRestaurantTel3() {
		return restaurantTel3;
	}
	public void setRestaurantTel3(String restaurantTel3) {
		this.restaurantTel3 = restaurantTel3;
	}
}
