package com.sp.yogi.owner.market;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.yogi.common.FileManager;
import com.sp.yogi.common.dao.CommonDAO;

@Service("owner.market.marketService")
public class MarketServiceImpl implements MarketService{

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public void insertResImg(Market dto, String pathname) throws Exception {
		try {
			
			if(!dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					dto.setImageFilename(saveFilename);

					dao.insertData("marketinfo.insertResImg", dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertTip(Market dto) throws Exception {
		try {
			dao.insertData("marketinfo.insertTip", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateHour(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("marketinfo.updateHour",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateBasePrice(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("marketinfo.updateBasePrice",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateFoodInfo(Market dto) throws Exception {
		try {
			dao.updateData("marketinfo.updateFoodInfo",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteResImg(long fileNum, String pathname) throws Exception {
		try {
			dao.deleteData("marketinfo.deleteResImg", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void deleteTip(long num) throws Exception {
		try {
			dao.deleteData("marketinfo.deleteTip", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public Market readRestaurant(long restaurantNum) {
		Market dto=null;
		
		try {
			dto=dao.selectOne("marketinfo.readRestaurant",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public Market readRestaurant2(String userId) {
		Market dto=null;
		
		try {
			dto=dao.selectOne("marketinfo.readRestaurant2",userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Market readResImg(long restaurantNum, String pathname) {
		Market dto=null;
		
		try {
			dto=dao.selectOne("marketinfo.readResImg",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public Market readTip1(long restaurantNum) {
		Market dto=null;
		
		try {
			dto=dao.selectOne("marketinfo.readTip1",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Market readTip2(long num) {
		Market dto=null;
		
		try {
			dto=dao.selectOne("marketinfo.readTip2",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Market> listTip(String userId) {
		List<Market> list=null;
		
		try {
			list=dao.selectList("marketinfo.listTip",userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
