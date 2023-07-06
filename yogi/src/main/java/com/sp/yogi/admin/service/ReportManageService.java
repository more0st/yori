package com.sp.yogi.admin.service;

import java.util.List;
import java.util.Map;

import com.sp.yogi.admin.domain.Report;

public interface ReportManageService {
	public List<Report> listReport(Map<String, Object> map);
	
	public Report readReport(String reportNum);
	
	public void deleteReview(Map<String, Object> map) throws Exception; // 리뷰 삭제
	
	public void hideReview(Map<String, Object> map) throws Exception; // 리뷰 숨김
	
	public void cancelReport(long reportNum, String pathname) throws Exception; // 신고 취소
}
