package com.sp.yogi.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;
import com.sp.yogi.home.Home;

@Service("mypage.myPageService")
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertAddr(MyPage dto) throws Exception {
		try {
			dao.insertData("mypage.insertAddr", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteAddr(Long addressNum, String userId) throws Exception {
		try {
			Home dto = new Home();
			
			dto.setAddressNum(addressNum);
			dto.setUserId(userId);
			
			dao.deleteData("mypage.deleteAddr", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<MyPage> listMyPage(String userId) {
		List<MyPage> list = null;
		
		try {
			
			list = dao.selectList("mypage.listMyPage",userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MyPage readOrderDetail(long num) {
		MyPage dto = null;
		
		try {
			dto = dao.selectOne("mypage.orderDetail2", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<MyPage> listOrderDetail(long num) {
		List<MyPage> list = null;
		try {
			
			list = dao.selectList("mypage.orderDetail", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
