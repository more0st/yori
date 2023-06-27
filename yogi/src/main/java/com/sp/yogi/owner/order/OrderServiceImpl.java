package com.sp.yogi.owner.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

@Service("owner.order.orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Order> orderList(long restaurantNum) {
		List<Order> list=null;
		
		try {
			list=dao.selectList("ownerOrder.orderList",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int orderCount(long restaurantNum) {
		int result=0;
		
		try {
			result=dao.selectOne("ownerOrder.orderCount",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int menuCount(long orderNum) {
		int result=0;
		
		try {
			result=dao.selectOne("ownerOrder.menuCount",orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Order> orderMenuList(long orderNum) {
		List<Order> list=null;
		
		try {
			list=dao.selectList("ownerOrder.orderMenuList",orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Order orderInfoList(long orderNum) {
		Order dto=null;
		
		try {
			dto=dao.selectOne("ownerOrder.orderInfoList",orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Order paymentInfo(long orderNum) {
		Order dto=null;
		
		try {
			dto=dao.selectOne("ownerOrder.paymentInfo",orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public Order readResNum(String userId) {
		Order dto=null;
		
		try {
			dto=dao.selectOne("ownerOrder.readResNum",userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateStatus2(long orderNum) throws Exception {
		try {
			dao.updateData("ownerOrder.updateStatus2",orderNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateStatus3(long orderNum) throws Exception {
		try {
			dao.updateData("ownerOrder.updateStatus3",orderNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateStatus4(long orderNum) throws Exception {
		try {
			dao.updateData("ownerOrder.updateStatus4",orderNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}

	@Override
	public void updateStatus5(Order dto) throws Exception {
		try {
			dao.updateData("ownerOrder.updateStatus5",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertRefund(Order dto) throws Exception {
		try {
			dao.insertData("ownerOrder.insertRefund",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
