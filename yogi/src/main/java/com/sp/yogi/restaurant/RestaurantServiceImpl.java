package com.sp.yogi.restaurant;

import org.springframework.stereotype.Service;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service("restaurant.restaurantService")
public class RestaurantServiceImpl implements RestaurantService{

	// 주소 추출
	@Override
	public String extractAddress(String address) {
		// 지역명 추출
        String regionRegex = "\\s(서울|부산|인천|대전|대구|광주|[^\\s]+시)\\s";
        Pattern regionPattern = Pattern.compile(regionRegex);
        Matcher regionMatcher = regionPattern.matcher(address);
        if (regionMatcher.find()) {
            return ""; // 해당 지역명이 있는 경우 빈 문자열 반환
        }

        // 동/리 추출
        String neighborhoodRegex = "\\(([^\\)]+)\\)";
        Pattern neighborhoodPattern = Pattern.compile(neighborhoodRegex);
        Matcher neighborhoodMatcher = neighborhoodPattern.matcher(address);
        if (neighborhoodMatcher.find()) {
            return neighborhoodMatcher.group(1); // 동/리 반환
        }

        return ""; // 동/리가 없는 경우 빈 문자열 반환

    }

}
