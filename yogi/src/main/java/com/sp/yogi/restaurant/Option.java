package com.sp.yogi.restaurant;

public class Option {
	private Long optionNum;		// 옵션번호
	private Long menuNum;		// 메뉴번호
	private String optionGroup;	// 옵션분류 - ex) 크기
	private String optionName;	// 옵션상세 - ex) 소,중,대
	private String price;		// 추가가격
	
	public Long getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(Long optionNum) {
		this.optionNum = optionNum;
	}
	public Long getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(Long menuNum) {
		this.menuNum = menuNum;
	}
	public String getOptionGroup() {
		return optionGroup;
	}
	public void setOptionGroup(String optionGroup) {
		this.optionGroup = optionGroup;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
}
