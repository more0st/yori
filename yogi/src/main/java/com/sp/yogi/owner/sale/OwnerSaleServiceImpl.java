package com.sp.yogi.owner.sale;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

@Service("owner.sale.ownerSaleService")
public class OwnerSaleServiceImpl implements OwnerSaleService {

	@Autowired
	private CommonDAO dao;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("ownerSale.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@Override
	public int menuDataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("ownerSale.menuDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int total_price(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("ownerSale.total_price", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<OwnerSale> listOwnerSale(Map<String, Object> map) {
		List<OwnerSale> list = null;

		try {
			list = dao.selectList("ownerSale.listOwnerSale", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<OwnerSaleMenu> listOwnerSaleMenu(Long orderNum) {
		List<OwnerSaleMenu> list = null;
		
		try {
			list = dao.selectList("ownerSale.listOwnerSaleMenu", orderNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<OwnerSale> menuList(Map<String, Object> map) {
		List<OwnerSale> list = null;

		try {
			list = dao.selectList("ownerSale.menuList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
