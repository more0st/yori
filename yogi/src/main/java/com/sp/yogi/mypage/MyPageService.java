package com.sp.yogi.mypage;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	
	/**
	 * 
	 * @param dto			주소록 등록
	 * @throws Exception	
	 */
	public void insertAddr(MyPage dto) throws Exception;
	
	/**
	 * 
	 * @param addressNum	주소록 번호
	 * @param userId		세션 아이디
	 * @throws Exception
	 */
	public void deleteAddr(Long addressNum, String userId) throws Exception;
	
	public List<MyPage> listMyPage(String userId);
	
	public List<MyPage> listOrderDetail (long num);
	
	public int dataCount(Map<String, Object> map);
	public MyPage readOrderDetail(long num);

	
}


