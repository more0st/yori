package com.sp.yogi.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	
	public void updateHitCount(long num) throws Exception;
	public Notice readNotice(long num);
	
	public List<Notice> listFile(long num);
	public Notice readFile(long fileNum);
}
