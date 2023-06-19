package com.sp.yogi.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

@Service("home.homeService")
public class HomeServiceImpl implements HomeService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public String readName(long num) {
		String userName = null;
		
		try {
			System.out.println("num : " + num);
			userName = dao.selectOne("home.readName", num);
			System.out.println("userName : " + userName);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userName;
	}

}
