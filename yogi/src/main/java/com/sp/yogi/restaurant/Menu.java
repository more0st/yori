package com.sp.yogi.restaurant;

import java.util.List;

public class Menu {
	private List<Option> optionList;
	private Long menuNum;	// 메뉴 번호
	private String num;		// 카테고리 번호
	private String menu;	// 메뉴 이름
	private Long price;		// 메뉴 가격
	private String imageFilename;
	private int stock;		// 메뉴 품절 여부 (0:품절 / 1:판매중)
	
	
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public List<Option> getOptionList() {
		return optionList;
	}
	public void setOptionList(List<Option> optionList) {
		this.optionList = optionList;
	}
	public Long getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(Long menuNum) {
		this.menuNum = menuNum;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
}
