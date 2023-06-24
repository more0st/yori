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
	public Restaurant readRestaurantInfo(Long restaurantNum) {
		Restaurant restaurant = null;
		
		try {
			restaurant = dao.selectOne("restaurant.readRestaurantInfo", restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return restaurant;
	}
}
