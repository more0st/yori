package com.sp.yogi.restaurant;

import org.springframework.stereotype.Service;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service("restaurant.restaurantService")
public class RestaurantServiceImpl implements RestaurantService{

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

}
