package com.sp.yogi.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;
import com.sp.yogi.owner.order.Order;
import com.sp.yogi.owner.Owner;

@Service("admin.resManagerService")
public class ResManageServiceImpl implements ResManageService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("resManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Owner> listOwner(Map<String, Object> map) {
		List<Owner> list = null;
		
		try {
			list = dao.selectList("resManage.listOwner", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Owner readOwner(String userId) {
		Owner dto = null;

		try {
			dto = dao.selectOne("resManage.readOwner", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateOwnerEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("resManage.updateOwnerEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertOwnerState(Owner dto) throws Exception {
		try {
			dao.updateData("resManage.insertOwnerState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Owner> listOwnerState(String userId) {
		List<Owner> list = null;
		
		try {
			list = dao.selectList("resManage.listOwnerState", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Owner readOwnerState(String userId) {
		Owner dto = null;

		try {
			dto = dao.selectOne("resManage.readOwnerState", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Order readRestaurantId(String restaurantNum) {
		Order dto = null;
		
		try {
			return dao.selectOne("resManage.readRestaurantId", restaurantNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateOwnerState(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("resManage.updateOwnerState", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int orderListCount(Long restaurantNum) {
		int orderListCount = 0;
		
		try {
			orderListCount = dao.selectOne("resManage.orderListCount", restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderListCount;
	}

	@Override
	public void releaseOwnerEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("resManage.releaseOwnerEnabled", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
