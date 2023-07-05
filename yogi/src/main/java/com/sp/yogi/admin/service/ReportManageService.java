package com.sp.yogi.admin.service;

import java.util.List;
import java.util.Map;

import com.sp.yogi.admin.domain.Report;

public interface ReportManageService {
	public List<Report> listReport(Map<String, Object> map);
	
	public Report readReport(String reportNum);
	
	public void deleteReport(Map<String, Object> map) throws Exception;
	
	public void cancelReport(long reportNum, String pathname) throws Exception;
}
