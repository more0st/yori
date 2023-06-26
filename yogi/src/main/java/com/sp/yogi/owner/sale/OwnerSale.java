package com.sp.yogi.owner.sale;

import java.util.List;

public class OwnerSale {
	private long orderNum;
	private String userId;
	private String userName;
	private String addr1;
	private String addr2;
	private String tel;
	private String order_price;
	private String total_price;
	private String order_date;
	
	private List<OwnerSaleMenu> ownerSaleMenu;
	
	private String menu;
	private String orderCount;
	private String menuPrice;
	
	
	
	public String getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(String orderCount) {
		this.orderCount = orderCount;
	}
	public List<OwnerSaleMenu> getOwnerSaleMenu() {
		return ownerSaleMenu;
	}
	public void setOwnerSaleMenu(List<OwnerSaleMenu> ownerSaleMenu) {
		this.ownerSaleMenu = ownerSaleMenu;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	private String restaurantNum;
	
	public String getOrder_price() {
		return order_price;
	}
	public void setOrder_price(String order_price) {
		this.order_price = order_price;
	}
	public String getRestaurantNum() {
		return restaurantNum;
	}
	public void setRestaurantNum(String restaurantNum) {
		this.restaurantNum = restaurantNum;
	}
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	
	
}
