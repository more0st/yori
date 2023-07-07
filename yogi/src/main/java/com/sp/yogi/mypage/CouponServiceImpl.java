package com.sp.yogi.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

@Service("mypage.couponService")
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CommonDAO dao;

	@Override
	public List<MyPage> couponList(String userId) {
		List<MyPage> list = null;

		try {
			list = dao.selectList("mypage.listCoupon", userId);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Coupon couponInfo(long orderNum) {
		Coupon dto=null;
		try {
			dto=dao.selectOne("mypage.couponInfo",orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
