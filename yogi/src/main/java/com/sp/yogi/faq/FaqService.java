package com.sp.yogi.faq;

import java.util.List;
import java.util.Map;


public interface FaqService {
	public void insertFaq(Faq dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Faq> listFaq(Map<String, Object> map);
	
	public Faq readFaq(long num);
	public void deleteFaq(long num, String pathname) throws Exception;
	
	public void insertFile(Faq dto) throws Exception;
	public List<Faq> listFile(long num);
	public Faq readFile(long fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
	
	
}
