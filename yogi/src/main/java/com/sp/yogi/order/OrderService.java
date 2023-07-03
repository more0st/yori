package com.sp.yogi.order;

import java.util.List;
import java.util.Map;

public interface OrderService {

	/**
	 * 
	 * @return				주문 번호
	 */
	public String productOrderNumber();
	
	/**
	 * 
	 * @param map			결제 정보
	 * @param list			메뉴 리스트
	 * @throws Exception
	 */
	public void insertOrder(Map<String, Object> map, List<Order> list) throws Exception;
	
	/**
	 * 
	 * @param userId		회원 아이디
	 * @return				쿠폰 리스트
	 */
	public List<Order> listCoupon(String userId);
	
	/**
	 * 
	 * @param couponNum 	쿠폰 번호
	 * @throws Exception
	 */
	public void useCoupon(Long couponNum) throws Exception;
	
}
