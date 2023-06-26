package com.sp.yogi.restaurant;

import java.util.List;

public class Category {
	private List<Menu> menuList;	// 메뉴 리스트
	private Long num;		// 카테고리 번호
	private String menuCategory;	// 메뉴 카테고리
	private Long restaurantNum;	// 업체번호
	
	
	
	public List<Menu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getMenuCategory() {
		return menuCategory;
	}
	public void setMenuCategory(String menuCategory) {
		this.menuCategory = menuCategory;
	}
	public Long getRestaurantNum() {
		return restaurantNum;
	}
	public void setRestaurantNum(Long restaurantNum) {
		this.restaurantNum = restaurantNum;
	}
}
