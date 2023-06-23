package com.sp.yogi.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.yogi.common.FileManager;
import com.sp.yogi.common.dao.CommonDAO;
@Service("faq.faqServiceImpl")
public class FaqServiceImpl implements FaqService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public void insertFaq(Faq dto, String pathname) throws Exception {
		
		try {
			long seq = dao.selectOne("faq.seq");
			dto.setQnum(seq);
			
			dao.insertData("faq.insertFaq", dto);
			
			// 파일
			if (!dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					dto.setImgFileName(saveFilename);

					insertFile(dto);
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("faq.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list = null;
		
		try {
			list = dao.selectList("faq.listFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Faq readFaq(long num) {
		Faq dto = null;
		
		try {
			dto = dao.selectOne("faq.readFaq", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
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

			dao.deleteData("faq.deleteFaq", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertFile(Faq dto) throws Exception {
		try {
			dao.insertData("faq.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Faq> listFile(long num) {
		List<Faq> listFile = null;

		try {
			listFile = dao.selectList("faq.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listFile;
	}

	@Override
	public Faq readFile(long fileNum) {
		Faq dto = null;

		try {
			dto = dao.selectOne("faq.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("faq.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
