package com.sp.yogi.admin.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.admin.service.StoreService;
import com.sp.yogi.common.dao.CommonDAO;

@Service("admin.service.toreService")
public class StoreServiceImpl implements StoreService {
	@Autowired
	private CommonDAO dao;
	
	
}
