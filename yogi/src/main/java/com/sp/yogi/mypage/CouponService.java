package com.sp.yogi.mypage;

import java.util.List;

public interface CouponService {
	public List<MyPage> couponList(String userId);
	
	public Coupon couponInfo(long orderNum);

}
