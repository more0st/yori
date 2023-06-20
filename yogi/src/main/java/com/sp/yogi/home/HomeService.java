package com.sp.yogi.home;

import java.util.List;

public interface HomeService {
	/**
	 * 
	 * @param 		memberNum 세션에 저장된 memberNum 
	 * @return 		주소록 리스트
	 */
	public List<Home> listAddr(Long memberNum);
}
