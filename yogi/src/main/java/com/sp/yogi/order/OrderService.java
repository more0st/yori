package com.sp.yogi.order;

public interface OrderService {

	/**
	 * 
	 * @return				주문 번호
	 */
	public String productOrderNumber();
	
	/**
	 * 
	 * @param dto			결제 정보
	 * @throws Exception
	 */
	public void insertOrder(Order dto) throws Exception;
}
