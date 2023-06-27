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
	
	// 가게 옵션 분류 불러오기
	public List<Option> readOptionGroup(Long menuNum);
	
	// 가게 옵션 분류당 - 옵션 상세
	public List<Option> readOptionName(Option option);
	
	// 좋아요 여부 확인
	public boolean isLike(Map<String,Object> map);
	
	// 좋아요
	public boolean insertLike(Map<String, Object> map) throws Exception;

	// 가게 상세 정보2 ( 배달팁, 메뉴개수, 리뷰개수 )
	public Restaurant readRestaurantInfo2(Map<String,Object> map);
	
	// 리뷰 리스트
	public List<Review> readReivew(Long restaurantNum);
	
	// 별점 구하기
	public double readRating(Long restaurantNum);
	
}
