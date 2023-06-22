package com.sp.yogi.owner.market;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

@Service("owner.market.marketService")
public class MarketServiceImpl implements MarketService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertResImg(Market dto) throws Exception {
		try {
			dao.insertData("marketinfo.insertResImg", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertTip(Market dto) throws Exception {
		try {
			dao.insertData("marketinfo.insertTip", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateHour(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("marketinfo.updateHour",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateBasePrice(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("marketinfo.updateBasePrice",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateFoodInfo(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("marketinfo.updateFoodInfo",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteResImg(long fileNum) throws Exception {
		try {
			dao.deleteData("marketinfo.deleteResImg", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void deleteTip(long num) throws Exception {
		try {
			dao.deleteData("marketinfo.deleteTip", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public Market readRestaurant(long restaurantNum) {
		Market dto=null;
		
		try {
			dto=dao.selectOne("marketinfo.readRestaurant",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Market readResImg(long restaurantNum) {
		Market dto=null;
		
		try {
			dto=dao.selectOne("marketinfo.readResImg",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public Market readTip1(long restaurantNum) {
		Market dto=null;
		
		try {
			dto=dao.selectOne("marketinfo.readTip1",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Market readTip2(long num) {
		Market dto=null;
		
		try {
			dto=dao.selectOne("marketinfo.readTip2",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
