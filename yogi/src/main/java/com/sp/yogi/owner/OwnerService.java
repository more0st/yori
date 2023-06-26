package com.sp.yogi.owner;

import java.util.Map;

public interface OwnerService {
	public Owner loginOwner(String userId);
	
	public void insertOwner(Owner dto) throws Exception;
	
	public void updateOwnership(Map<String, Object> map) throws Exception;
	public void updateLastLogin(String userId) throws Exception;
	public void updateOwner(Owner dto) throws Exception;
	
	public Owner readOwner(String userId);
	public Owner readOwner(long OwnerNum);
	
	public Owner readOwnerEmail(String email);
	
	public Owner readRestaurant(String userId);
	
	public void deleteOwner(Map<String, Object> map) throws Exception;
	
	public void generatePwd(Owner dto) throws Exception;
	
	public void sendIdInfo(Owner dto) throws Exception;
	
	public int readStatus(String userId);
	
	
	public int todayOrderCount(Map<String, Object> map);
	public int todayOrderSum(Map<String, Object> map);
	public int reviewRating(Long restaurantNum);
	public int reviewRatingCount(Long restaurantNum);


}
