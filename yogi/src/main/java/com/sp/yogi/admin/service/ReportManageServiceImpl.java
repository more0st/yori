package com.sp.yogi.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.admin.domain.Report;
import com.sp.yogi.common.dao.CommonDAO;

@Service("admin.reportService")
public class ReportManageServiceImpl implements ReportManageService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Report> listReport(Map<String, Object> map) {
		List<Report> list = null;
		
		try {
			list = dao.selectList("report.listReport", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Report readReport(String reportNum) {
		Report dto = null;
		
		try {
			dto = dao.selectOne("report.readReport", reportNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void deleteReview(Map<String, Object> map) throws Exception {
		
		try {
			dao.deleteData("report.deleteReview", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void hideReview(Map<String, Object> map) throws Exception {

		try {
			dao.deleteData("report.hideReview", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void hideRelease(Map<String, Object> map) throws Exception {

		try {
			dao.deleteData("report.hideRelease", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void cancelReport(long reportNum, String pathname) throws Exception {
		
		try {
			dao.deleteData("report.cancelReport", reportNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	
}
