package com.sp.yogi.admin.service;

import java.util.List;
import java.util.Map;

import com.sp.yogi.admin.domain.Report;

public interface ReportManageService {
	public List<Report> listReport(Map<String, Object> map);
	
	public Report readReport(String reportNum);
	
	
}
