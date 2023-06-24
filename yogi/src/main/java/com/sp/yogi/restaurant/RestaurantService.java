package com.sp.yogi.restaurant;

import java.util.List;
import java.util.Map;

public interface RestaurantService {
	// 주소 추출
	public String extractAddress(String address);
	
	// 가게 리스트
	public List<Restaurant> listRestaurant(Map<String, Object> map) throws Exception;

	// 가게 상세 정보
	public Restaurant readRestaurantInfo(Long restaurantNum);
}
