package com.sp.yogi.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.admin.domain.Store;
import com.sp.yogi.admin.service.StoreService;
import com.sp.yogi.common.dao.CommonDAO;

@Service("admin.service.storeService")
public class StoreServiceImpl implements StoreService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Store> listWait() {
		List<Store> list = null;
	
		try {
			list = dao.selectList("store.listWait");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int countWait() {
		int cnt = 0;
		
		try {
			cnt = dao.selectOne("store.countWait");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public void permitWait(Long restaurantNum) throws Exception {
		try {
			dao.insertData("store.permitWait", restaurantNum);
			dao.insertData("store.permitWait2", restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Store waitInfo(Long restaurantNum) {
		Store dto = null;
		
		try {
			dto = dao.selectOne("store.waitInfo", restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void rejectWait(Long restaurantNum) throws Exception {
		int reject_cnt = 0;
		
		try {
			dao.updateData("store.rejectWait", restaurantNum);
			
			reject_cnt = dao.selectOne("store.cntReject", restaurantNum);
			
			System.out.println("거절 횟수 : " + reject_cnt);
			
			// 거절 횟수 5회이면 계정 차단
			if(reject_cnt == 5) {
				dao.updateData("store.rejectRestaurant", restaurantNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	
}
