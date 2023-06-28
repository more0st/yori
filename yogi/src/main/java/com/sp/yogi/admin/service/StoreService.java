package com.sp.yogi.admin.service;

import java.util.List;

import com.sp.yogi.admin.domain.Store;

public interface StoreService {

	/**
	 * 
	 * @return		입점대기중인 가게 리스트
	 */
	public List<Store> listWait();
	
	/**
	 * 
	 * @return		입점 대기 중인 가게 수
	 */
	public int countWait();
	
	/**
	 * 
	 * @param restaurantNum		입점 승인할 가게번호
	 * @throws Exception
	 */
	public void permitWait(Long restaurantNum) throws Exception;
	
	/**
	 * 
	 * @param restaurantNum		입점 대기 가게 번호
	 * @return					입점 대기 상세 정보
	 */
	public Store waitInfo(Long restaurantNum);
	
	/**
	 * 
	 * @param restaurantNum		입점 거절 가게 번호
	 * @throws Exception
	 */
	public void rejectWait(Long restaurantNum) throws Exception;
	
}
