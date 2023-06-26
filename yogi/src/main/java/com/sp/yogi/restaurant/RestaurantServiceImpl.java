package com.sp.yogi.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service("restaurant.restaurantService")
public class RestaurantServiceImpl implements RestaurantService{
	@Autowired
	private CommonDAO dao;
	
	// 주소 추출
	@Override
	public String extractAddress(String address) {
        // 구 추출
        String districtRegex = "(\\S+구)\\s";
        Pattern districtPattern = Pattern.compile(districtRegex);
        Matcher districtMatcher = districtPattern.matcher(address);
        String district = "";
        if (districtMatcher.find()) {
            district = districtMatcher.group(1);
        }

        // 동 추출
        String neighborhoodRegex = "\\((\\S+동)\\)";
        Pattern neighborhoodPattern = Pattern.compile(neighborhoodRegex);
        Matcher neighborhoodMatcher = neighborhoodPattern.matcher(address);
        String neighborhood = "";
        if (neighborhoodMatcher.find()) {
            neighborhood = neighborhoodMatcher.group(1);
        }

        return district + " " + neighborhood;

    }

	
	// 가게 리스트
	@Override
	public List<Restaurant> listRestaurant(Map<String, Object> map) throws Exception {
		List<Restaurant> list = null;
		
		try {
			list = dao.selectList("restaurant.listRestaurant", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	// 가게 상세정보
	@Override
	public RestaurantInfo readRestaurantInfo(Long restaurantNum) {
		RestaurantInfo restaurantInfo = null;
		List<Category> categoryList = null;
		
		try {
			restaurantInfo = dao.selectOne("restaurant.readRestaurantInfo", restaurantNum);
			restaurantInfo.setFoodInfo(restaurantInfo.getFoodInfo().replaceAll("\n", "<br>"));
			
			categoryList = readCategory(restaurantNum);
			
			restaurantInfo.setCategoryList(categoryList);;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return restaurantInfo;
	}


	// 가게 카테고리 
	@Override
	public List<Category> readCategory(Long restaurantNum) {
		List<Category> categoryList = null;
		
		try {
			categoryList = dao.selectList("restaurant.readCategory", restaurantNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return categoryList;
	}
	


	// 가게 메뉴 
	@Override
	public List<Menu> readMenu(Long num) {
		List<Menu> menuList = null;
		
		try {
			menuList = dao.selectList("restaurant.readMenu", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return menuList;
	}

	// 가게 옵션
	@Override
	public List<Option> readOption(Long menuNum) {
		List<Option> optionList = null;

		try {
			optionList = dao.selectList("restaurant.readOption", menuNum);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return optionList;
	}
	
	// 좋아요 여부 확인
	@Override
	public boolean isLike(Map<String, Object> map) {
		Boolean like = false;
		int count = 0;
		
		try {
			// 리뷰 달았는지 ( 0: 리뷰 x, 1: 리뷰 o )
			count = dao.selectOne("restaurant.isLike", map);
			
			if(count == 1) {
				like = false;
			} else {
				like = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return like;
	}
	
	
	// 좋아요 
	@Override
	public boolean insertLike(Map<String, Object> map) throws Exception {
		boolean state = false;
		try {
			boolean isLike = isLike(map);
			
			if(! isLike) {
				dao.deleteData("restaurant.deleteLike", map);
				state = true;
			} else {
				dao.insertData("restaurant.insertLike", map);
				state = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return state;
	}


	// 가게 상세 정보2 ( 배달팁, 메뉴개수, 리뷰개수 )
	@Override
	public Restaurant readRestaurantInfo2(Map<String, Object> map) {
		Restaurant restaurant = new Restaurant();
		
		try {
			restaurant = dao.selectOne("restaurant.readRestaurantInfo2", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return restaurant;
	}

	// 리뷰 리스트
	@Override
	public List<Review> readReivew(Long restaurantNum) {
		List<Review> reviewList = null;
		
		try {
			reviewList = dao.selectList("restaurant.readReivew", restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reviewList;
	}

	// 별점 구하기
	@Override
	public double readRating(Long restaurantNum) {
		double rating = 0;
		
		try {
			rating = dao.selectOne("restaurant.readRating",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rating;
	}

}
