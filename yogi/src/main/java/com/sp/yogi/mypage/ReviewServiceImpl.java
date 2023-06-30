//package com.sp.yogi.mypage;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.sp.yogi.common.FileManager;
//import com.sp.yogi.common.dao.CommonDAO;
//
//@Service("mypage.reviewService")
//public class ReviewServiceImpl implements ReviewService {
//	@Autowired
//	private CommonDAO dao;
//	@Autowired
//	private FileManager fileManager;
//
//	@Override
//	public void insertReview(Review dto, String pathname) throws Exception {
//		try {
//			String imgFileName = fileManager.doFileUpload(dto.getSelectFile(), pathname);
//			if (imgFileName != null) {
//				dto.setImgFileName(dto.getSelectFile().getOriginalFilename());
//			}
//
//			dao.insertData("mypage.insertReview", dto);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw e;
//		}
//	}
//
//	@Override
//	public void updateReview(Review dto, String pathname) throws Exception {
//		
//	}
//
//	@Override
//	public MyPage readData(long num) {
//		MyPage dto = null;
//		
//		try {
//			dto = dao.selectOne("mypage.readData", num);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return dto;
//	}
//	
//
//
//}
