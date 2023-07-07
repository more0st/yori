package com.sp.yogi.owner.order;

import java.util.List;

public interface OrderService {
	
	//readResNum : 로그인한 아이디의 업체번호 가져오기
	public Order readResNum(String userId);
	//orderList : 가게별 주문 리스트
	public List<Order> orderList(long restaurantNum);
	//orderCount : 가게별 주문개수
	public int orderCount(long restaurantNum);
	
	//menuCount : 주문번호별 메뉴개수
	public int menuCount(long orderNum);
	//orderMenuList : 주문번호별 주문메뉴내역(옵션추가되면수정하기)
	public List<Order> orderMenuList(long orderNum);
	//orderInfoList : 주문번호별 주문상세내역
	public Order orderInfoList(long orderNum);
	//paymentInfo : 주문번호별 결제정보
	public Order paymentInfo(long orderNum);
	//couponInfo : 주문번호별 쿠폰정보
	public Order couponInfo(long orderNum);
	
	//updateStatus2 : 주문상태변경(2:접수)
	public void updateStatus2(long orderNum) throws Exception;
	//updateStatus3 : 주문상태변경(3:배달시작)
	public void updateStatus3(long orderNum) throws Exception;
	//updateStatus4 : 주문상태변경(4:배달완료)
	public void updateStatus4(long orderNum) throws Exception;
	//updateStatus5 :  주문취소(5:취소/memo:취소사유)
	public void updateStatus5(Order dto) throws Exception;
	//insertRefund : 환불
	public void insertRefund(Order dto) throws Exception;
	//updatePayment : 결제상태 변경
	public void updatePayment(long payNum) throws Exception;
	
}
