package com.sp.yogi.owner.market;

import java.util.List;

public interface MarketService {
	//insertResImg : 가게이미지등록
	public void insertResImg(Market dto, String pathname) throws Exception;
	//insertTip : 배달팁 추가
	public void insertTip(Market dto) throws Exception;
	
	//updateHour : 시작/종료시간 수정
	public void updateHour(Market dto) throws Exception;
	//updateBasePrice : 최소주문금액 수정
	public void updateBasePrice(Market dto) throws Exception;
	//updateFoodInfo : 원산지정보 수정
	public void updateFoodInfo(Market dto) throws Exception;
	
	//deleteResImg : 가게이미지삭제
	public void deleteResImg(long fileNum, String pathname) throws Exception;
	//deleteTip : 배달팁 삭제
	public void deleteTip(long num) throws Exception;
	
	//readRestaurant : 가게정보가져오기
	public Market readRestaurant(long restaurantNum);
	public Market readRestaurant2(String userId);
	//readResImg : 가게이미지가져오기
	public Market readResImg(long restaurantNum, String pathname);
	//readTip : 배달팁 가져오기
	public Market readTip1(long restaurantNum);//가게번호
	public Market readTip2(long num);//배달팁등록번호
	public List<Market> listTip(String userId);//배달팁리스트
	
}
