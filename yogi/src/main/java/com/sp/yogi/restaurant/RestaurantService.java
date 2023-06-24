package com.sp.yogi.restaurant;

import java.util.List;
import java.util.Map;

public interface RestaurantService {
	// 주소 추출
	public String extractAddress(String address);
	
	// 가게 리스트
	public List<Restaurant> listRestaurant(Map<String, Object> map) throws Exception;

	// 가게 상세 정보
	public RestaurantInfo readRestaurantInfo(Long restaurantNum);
	
	// 가게 카테고리
	public List<Category> readCategory(Long restaurantNum);
	
	// 가게 메뉴
	public List<Menu> readMenu(Long num);
	
	// 가게 옵션
	public List<Option> readOption(Long menuNum);
	
	// 좋아요
	Boolean isLike(Map<String,Object> map);
}
