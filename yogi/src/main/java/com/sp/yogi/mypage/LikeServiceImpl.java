package com.sp.yogi.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

@Service("mypage.likeService")
public class LikeServiceImpl implements LikeService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<MyPage> likeList(String userId) {
		List<MyPage> list = null;

		try {
			list = dao.selectList("mypage.likeList", userId);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
