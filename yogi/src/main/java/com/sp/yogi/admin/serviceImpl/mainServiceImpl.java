package com.sp.yogi.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.admin.domain.MainDomain;
import com.sp.yogi.admin.service.mainService;
import com.sp.yogi.common.dao.CommonDAO;

@Service
public class mainServiceImpl implements mainService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Long memberCount() {
		Long memberCount = 0L;
		
		try {
			memberCount = dao.selectOne("adminMain.memberCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberCount;
	}

	@Override
	public Long ownerCount() {
		Long ownerCount = 0L;
		
		try {
			ownerCount = dao.selectOne("adminMain.ownerCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ownerCount;
	}

	@Override
	public Long ownerWaitCount() {
		Long ownerWaitCount = 0L;
		
		try {
			ownerWaitCount = dao.selectOne("adminMain.ownerWaitCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ownerWaitCount;
	}

	@Override
	public Long todaySales() {
		Long todaySales = 0L;
		
		try {
			todaySales = dao.selectOne("adminMain.todaySales");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return todaySales;
	}

	@Override
	public List<MainDomain> recentSales() {
		List<MainDomain> list = null;
		
		try {
			list = dao.selectList("adminMain.recentSales");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<MainDomain> bestOwner() {
		List<MainDomain> list = null;
		
		try {
			list = dao.selectList("adminMain.bestOwner");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
