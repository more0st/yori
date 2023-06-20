package com.sp.yogi.owner.register;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;


// 입점문의 - 입점 정보 등록
@Service("resRegister.resRegisterService")
public class ResRegisterServiceImpl implements ResRegisterService{
	@Autowired
	private CommonDAO dao;

	/**
	 * [ 입점문의 신청 ]
	 * resRegister	입점을 위한 업체 정보
	 */
	@Override
	public void insertResRegister(ResRegister dto) throws Exception {
		
		try {
			if (dto.getRestaurantTel1().length() != 0 && dto.getRestaurantTel2().length() != 0 && dto.getRestaurantTel3().length() != 0) {
				dto.setRestaurantTel(dto.getRestaurantTel1() + "-" + dto.getRestaurantTel2() + "-" + dto.getRestaurantTel3());
			}
			
			// 사장님 로그인 할 경우 체크.
			
			// 입점 문의정보 저장
			dao.insertData("register.insertResRegister", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	

}
