package com.sp.yogi.admin.service;

import java.util.List;
import java.util.Map;

import com.sp.yogi.admin.domain.Faq;

public interface FaqService {

	public List<Faq> listFaq(Map<String, Object> map);
	
	
	public Faq readFaq(long num);
	
	public void answerFaq(Faq dto) throws Exception;
	
	
	public void deleteAnswer(long num) throws Exception;
	void deleteFaq(long num, String pathname) throws Exception;
	
	public List<Faq> listFile(long num);
	public Faq readFile(long fileNum);
	
	public int dataCount(Map<String, Object> map);


	
	public void deleteFile(Map<String, Object> map) throws Exception;
	
}
