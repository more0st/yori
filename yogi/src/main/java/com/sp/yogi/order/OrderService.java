package com.sp.yogi.order;

public interface OrderService {
	/**
	 * 
	 * @param userId 검색할 아이디
	 * @return
	 */
	public Order readMember(String userId);
	
}
