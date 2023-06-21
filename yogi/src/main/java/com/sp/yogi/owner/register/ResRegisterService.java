package com.sp.yogi.owner.register;

// 입점문의 - 입점 정보 등록
public interface ResRegisterService {
	
	/**
	 * [ 입점문의 신청 ]
	 * resRegister	입점을 위한 업체 정보
	 */
	public void insertResRegister(ResRegister resRegister) throws Exception;
	
	
	/**
	 * [ 입점문의 신청 후 > 업제 입점상태 : 입점대기(2) ]
	 */
	public void updateStatus(String userId) throws Exception;
}
