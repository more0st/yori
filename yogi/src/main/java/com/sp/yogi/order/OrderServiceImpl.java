package com.sp.yogi.order;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

@Service("order.orderService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private CommonDAO dao;
	
	private static AtomicLong count = new AtomicLong(0);


	@Override
	public String productOrderNumber() {
		// 상품 주문 번호 생성
		String result = "";
		
		try {
			Calendar cal = Calendar.getInstance();
			String y =String.format("%04d", cal.get(Calendar.YEAR));
			String m = String.format("%02d", (cal.get(Calendar.MONTH) + 1));
			String d = String.format("%03d", cal.get(Calendar.DATE) * 7);
			
			String preNumber = y + m + d;
			String savedPreNumber = "0";
			long savedLastNumber = 0;
			String maxOrderNumber = dao.selectOne("readMaxOrderNumber");
			if(maxOrderNumber != null && maxOrderNumber.length() > 9) {
				savedPreNumber = maxOrderNumber.substring(0, 9);
				savedLastNumber = Long.parseLong(maxOrderNumber.substring(9));
			}
			
			long lastNumber = 1;
			if(! preNumber.equals(savedPreNumber)) {
				count.set(0);
				lastNumber = count.incrementAndGet();
			} else {
				lastNumber = count.incrementAndGet();
				
				if( savedLastNumber >= lastNumber )  {
					count.set(savedLastNumber);
					lastNumber = count.incrementAndGet();
				}
			}
			
			result = preNumber + String.format("%09d", lastNumber);
			
		} catch (Exception e) {
		}
		
		return result;
	}
	
	@Override
	public void insertOrder(Map<String, Object> map, List<Order> list) throws Exception {
		try {
			// order_bundle
			dao.insertData("order.insertOrderBundle", map);
			
			// order_items
			dao.insertData("order.insertOrderItem", list);
			
			// order_status
			dao.insertData("order.insertOrderStatus", map);
			
			// payment
			dao.insertData("order.insertPayment", map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
