package com.sp.yogi.owner.sale;

import java.util.List;
import java.util.Map;

public interface OwnerSaleService {
	public int dataCount(Map<String, Object> map);
	public int menuDataCount(Map<String, Object> map);

	public int total_price(Map<String, Object> map);

	public List<OwnerSale> listOwnerSale(Map<String, Object> map);
	public List<OwnerSaleMenu> listOwnerSaleMenu(Long orderNum);
	
	public List<OwnerSale> menuList(Map<String, Object> map);



}
