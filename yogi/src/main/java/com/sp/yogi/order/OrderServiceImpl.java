package com.sp.yogi.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

@Service("order.orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public Order readMember(String userId) {
		
		Order dto = null;
		
		try {
			dto = dao.selectOne("order.readMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
