package com.sp.yogi.admin.service;

import java.util.List;
import java.util.Map;

import com.sp.yogi.admin.domain.Faq;

public interface FaqService {

	public void updateFaq(Faq dto, String pathname) throws Exception;
	public List<Faq> listFaq(Map<String, Object> map);
	
	public Faq readFaq(long num);
	
	public void answerFaq(Faq dto) throws Exception;
	public void deleteAnswer(long num) throws Exception;
	public void deleteFaq(long num) throws Exception;
	public int dataCount(Map<String, Object> map);
	
	
}
