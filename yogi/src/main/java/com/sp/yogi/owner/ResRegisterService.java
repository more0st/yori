package com.sp.yogi.owner;

// 입점문의 - 입점 정보 등록
public interface ResRegisterService {
	
	/**
	 * [ 입점문의 신청 ]
	 * resRegister	입점을 위한 업체 정보
	 */
	public void insertResRegister(ResRegister resRegister) throws Exception;
	
	
}
