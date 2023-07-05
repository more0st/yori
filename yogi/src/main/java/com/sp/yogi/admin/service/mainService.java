package com.sp.yogi.admin.service;

import java.util.List;

import com.sp.yogi.admin.domain.MainDomain;

public interface mainService {
	
	// 가입한 회원 수
	public Long memberCount();
	
	// 입점된 가게 수
	public Long ownerCount();
	
	// 입점 대기 가게 수
	public Long ownerWaitCount();
	
	// 오늘 매출
	public Long todaySales();
	
	// 최근 5번 주문
	public List<MainDomain> recentSales();
	
	// 최고 매출 가게
	public List<MainDomain> bestOwner();
	

}
