package com.sp.yogi.mypage;

import org.springframework.web.multipart.MultipartFile;

public class MyPage {
	// 주소록에 필요한 dto 나중에 더 추가하셔요
	private Long memberNum;
	private String zip;
	private String addr1;
	private String addr2;
	private String userId;
	private Long addrerssNum;

	// 주문내역에 필요한 DTO
	private Long orderNum;
	private String restaurantName;
	private String total_price;
	private String order_date;
	private String statusName;

	// 주문상세에 필요한 DTO
	private String tel;
	private String memo;
	private String pay_date;
	private String payMethod;
	private String pay_price;
	private String menu;
	private String menu_price;
	private String optionName;
	private String option_price;

	// 리뷰에 필요한 DTO
	private double rating;
	private String content;
	private String imgFileName;
	private String review_reg_date;
	private Long enabled;
	private String reply;
	private String reply_date;
	private Long restaurantNum;
	private MultipartFile selectFile; // <input type='file' name='selectFile' ..

	public Long getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(Long memberNum) {
		this.memberNum = memberNum;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Long getAddrerssNum() {
		return addrerssNum;
	}

	public void setAddrerssNum(Long addrerssNum) {
		this.addrerssNum = addrerssNum;
	}

	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
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

	public String getPay_price() {
		return pay_price;
	}

	public void setPay_price(String pay_price) {
		this.pay_price = pay_price;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getOption_price() {
		return option_price;
	}

	public void setOption_price(String option_price) {
		this.option_price = option_price;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}

	public String getReview_reg_date() {
		return review_reg_date;
	}

	public void setReview_reg_date(String review_reg_date) {
		this.review_reg_date = review_reg_date;
	}

	public Long getEnabled() {
		return enabled;
	}

	public void setEnabled(Long enabled) {
		this.enabled = enabled;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	public Long getRestaurantNum() {
		return restaurantNum;
	}

	public void setRestaurantNum(Long restaurantNum) {
		this.restaurantNum = restaurantNum;
	}

	public MultipartFile getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	

}
