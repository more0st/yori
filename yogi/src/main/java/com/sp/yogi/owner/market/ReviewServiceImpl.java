package com.sp.yogi.owner.market;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.FileManager;
import com.sp.yogi.common.dao.CommonDAO;

@Service("owner.market.reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<Review> reviewList(long restaurantNum) {
		List<Review> list=null;
		
		try {
			list=dao.selectList("reviewinfo.reviewList",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertReviewReport(Review dto) throws Exception {
		try {
			dao.insertData("reviewinfo.insertReviewReport",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateReply(Review dto) throws Exception {
		try {
			dao.updateData("reviewinfo.updateReply",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public double avgRating(long restaurantNum) {
		double result=0;
		try {
			result=dao.selectOne("reviewinfo.avgRating",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public Review reviewReportList(long orderNum) {
		Review dto=null;
		try {
			dto=dao.selectOne("reviewinfo.reviewReportList",orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int reviewCount(long restaurantNum) {
		int result=0;
		try {
			result=dao.selectOne("reviewinfo.reviewCount",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReply(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("reviewinfo.insertReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteReply(Long orderNum) throws Exception {
		try {
			dao.updateData("reviewinfo.deleteReply", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
