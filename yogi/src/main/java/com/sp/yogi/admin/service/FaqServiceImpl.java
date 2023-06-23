package com.sp.yogi.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.admin.domain.Faq;
import com.sp.yogi.common.FileManager;
import com.sp.yogi.common.dao.CommonDAO;

@Service("admin.faqServiceImpl")
public class FaqServiceImpl implements FaqService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list = null;

		try {
			list = dao.selectList("faqManage.listFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Faq readFaq(long num) {
		Faq dto = null;

		try {
			dto = dao.selectOne("faqManage.readFaq", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void answerFaq(Faq dto) throws Exception {
		try {
			dao.updateData("faqManage.answerFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteAnswer(Faq dto) throws Exception {
		try {
			dao.updateData("faqManage.deleteAnswer",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
	}

	@Override
	public void deleteFaq(long num, String pathname) throws Exception {
		try {
			// 파일 지우기
			List<Faq> listFile = listFile(num);
			if (listFile != null) {
				for (Faq dto : listFile) {
					fileManager.doFileDelete(dto.getImgFileName(), pathname);
				}
			}

			// 파일 테이블 내용 지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);

			dao.deleteData("faqManage.deleteFaq", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("faqManage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Faq> listFile(long num) {
		List<Faq> listFile = null;

		try {
			listFile = dao.selectList("faqManage.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listFile;
	}

	@Override
	public Faq readFile(long fileNum) {
		Faq dto = null;

		try {
			dto = dao.selectOne("faqManage.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("faqManage.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


}
