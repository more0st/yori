package com.sp.yogi.mypage;

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
}
