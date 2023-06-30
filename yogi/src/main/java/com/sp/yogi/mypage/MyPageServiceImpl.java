package com.sp.yogi.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.FileManager;
import com.sp.yogi.common.dao.CommonDAO;
import com.sp.yogi.home.Home;

@Service("mypage.myPageService")
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;

	
	@Override
	public void insertAddr(MyPage dto) throws Exception {
		try {
			dao.insertData("mypage.insertAddr", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteAddr(Long addressNum, String userId) throws Exception {
		try {
			Home dto = new Home();
			
			dto.setAddressNum(addressNum);
			dto.setUserId(userId);
			
			dao.deleteData("mypage.deleteAddr", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<MyPage> listMyPage(Map<String, Object> map) {
		List<MyPage> list = null;
		
		try {
			
			list = dao.selectList("mypage.listMyPage",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("mypage.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	@Override
	public MyPage readOrderDetail(long num) {
		MyPage dto = null;
		
		try {
			dto = dao.selectOne("mypage.orderDetail2", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<MyPage> listOrderDetail(long num) {
		List<MyPage> list = null;
		try {
			
			list = dao.selectList("mypage.orderDetail", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertReview(MyPage dto, String pathname) throws Exception {
		try {
			String imgFileName = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (imgFileName != null) {
				dto.setImgFileName(imgFileName);
			}
			
			dao.insertData("mypage.insertReview", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateReview(MyPage dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MyPage readData(long num) {
		MyPage dto = null;
		
		try {
			dao.selectOne("mypage.readData, dao", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
		
	}

	@Override
	public List<MyPage> listReview(Map<String, Object> map) {
		List<MyPage> list = null;
		try {
			
			list = dao.selectList("mypage.listReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
		
		
	
}
