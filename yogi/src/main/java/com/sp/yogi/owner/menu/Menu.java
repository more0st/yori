package com.sp.yogi.owner.menu;

public class Menu {
	private long num;//카테고리번호
	private String menuCategory;//카테고리명
	private long restaurantNum;//업체번호
	
	private long menuNum;//메뉴번호
	private String menu;//메뉴명
	private long price;//메뉴가격
	private String imageFilename;//메뉴이미지이름
	private int stock;//품절여부 (0: 품절 / 1: 판매중)
	
	private long optionNum;//옵션번호
	private String option_group;//옵션대분류
	private String option_name;//옵션소분류
	private long option_price;//옵션추가금액
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getMenuCategory() {
		return menuCategory;
	}
	public void setMenuCategory(String menuCategory) {
		this.menuCategory = menuCategory;
	}
	public long getRestaurantNum() {
		return restaurantNum;
	}
	public void setRestaurantNum(long restaurantNum) {
		this.restaurantNum = restaurantNum;
	}
	public long getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(long menuNum) {
		this.menuNum = menuNum;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
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
	public long getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(long optionNum) {
		this.optionNum = optionNum;
	}
	public String getOption_group() {
		return option_group;
	}
	public void setOption_group(String option_group) {
		this.option_group = option_group;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public long getOption_price() {
		return option_price;
	}
	public void setOption_price(long option_price) {
		this.option_price = option_price;
	}
}
