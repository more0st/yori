package com.sp.yogi.mypage;

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
	
}
