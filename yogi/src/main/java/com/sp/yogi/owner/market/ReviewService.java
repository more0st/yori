package com.sp.yogi.owner.market;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	//reviewList : 업체별 리뷰내역
	public List<Review> reviewList(long restaurantNum);
	//reviewCount : 업체별 리뷰개수
	public int reviewCount(long restaurantNum);
	//reviewReportList : 신고 내역 select (해당 주문번호에 대한 신고 내역이 있는지 select)
	public Review reviewReportList(long orderNum);
	//insertReviewReport : 리뷰 신고 insert
	public void insertReviewReport(Review dto) throws Exception;
	//updateReply : 답글 수정 update : 답글 달기/답글수정/답글삭제(삭제일때는 null값으로 update할 수 있게 설정하기)
	public void updateReply(Review dto) throws Exception;
	//avgRating : 별점 평균 select 
	public double avgRating(long restaurantNum);
	
	//insertReply : 사장님 답급 등록
	public void insertReply(Map<String, Object> map) throws Exception;
	// deleteReply : 사장님 답글 삭제
	public void deleteReply(Long orderNum) throws Exception;
	
}
