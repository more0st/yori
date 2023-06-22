package com.sp.yogi.admin.service;

import java.util.List;
import java.util.Map;

import com.sp.yogi.admin.domain.Notice;

public interface NoticeService {
	public void insertNotice(Notice dto, String pathname) throws Exception;
	
	public List<Notice> listNotice(Map<String, Object> map);
	
	public void updateHitCount(long num) throws Exception;
	public Notice readNotice(long num);
	
	
	public void insertFile(Notice dto) throws Exception;
	public List<Notice> listFile(long num);
	public Notice readFile(long imgNum);
}
