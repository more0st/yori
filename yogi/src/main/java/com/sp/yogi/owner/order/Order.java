package com.sp.yogi.owner.order;

import java.util.List;

public class Order {
	private long orderNum;
	private String userId;
	private String order_date;
	private String addr1;
	private String addr2;
	private String tel;
	private String memo;
	private String total_price;
	private long restaurantNum;
	private String restaurantName;
	private String nickName;
	
	private long orderItemNum;
	private long menuNum;
	private long orderCount;
	private String menuPrice;
	
	private long statusNum;
	private String statusName;
	private String field;
	
	private long payNum;
	private String pay_date;
	private String payMethod;
	private String price;
	private long couponNum;
	private long state;
	private String optionName;
	
	private List<Order> menuList;
	private String menu;
	
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public List<Order> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Order> menuList) {
		this.menuList = menuList;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
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
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public long getRestaurantNum() {
		return restaurantNum;
	}
	public void setRestaurantNum(long restaurantNum) {
		this.restaurantNum = restaurantNum;
	}
	public long getOrderItemNum() {
		return orderItemNum;
	}
	public void setOrderItemNum(long orderItemNum) {
		this.orderItemNum = orderItemNum;
	}
	public long getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(long menuNum) {
		this.menuNum = menuNum;
	}
	public long getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(long orderCount) {
		this.orderCount = orderCount;
	}
	public String getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	public long getStatusNum() {
		return statusNum;
	}
	public void setStatusNum(long statusNum) {
		this.statusNum = statusNum;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public long getPayNum() {
		return payNum;
	}
	public void setPayNum(long payNum) {
		this.payNum = payNum;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public long getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(long couponNum) {
		this.couponNum = couponNum;
	}
	public long getState() {
		return state;
	}
	public void setState(long state) {
		this.state = state;
	}
	
}
