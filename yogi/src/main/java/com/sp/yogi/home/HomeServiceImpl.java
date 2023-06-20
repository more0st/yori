package com.sp.yogi.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

@Service("home.homeService")
public class HomeServiceImpl implements HomeService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Home> listAddr(Long memberNum) {
		List<Home> list = null;
		
		try {
			list = dao.selectList("home.listAddr", memberNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
