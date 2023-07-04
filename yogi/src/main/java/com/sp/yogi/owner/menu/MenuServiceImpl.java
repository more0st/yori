package com.sp.yogi.owner.menu;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.FileManager;
import com.sp.yogi.common.dao.CommonDAO;

@Service("owner.menu.menuService")
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<Menu> categoryList(long restaurantNum) {
		List<Menu> list=null;
		try {
			list=dao.selectList("ownerMenu.categoryList",restaurantNum);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int categoryCount(long restaurantNum) {
		int result=0;
		try {
			result=dao.selectOne("ownerMenu.categoryCount",restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertCategory(Menu dto) throws Exception {
		try {
			dao.insertData("ownerMenu.insertCategory",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateCategory(Menu dto) throws Exception {
		try {
			dao.updateData("ownerMenu.updateCategory",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateEnabled(Menu dto) throws Exception {
		try {
			dao.updateData("ownerMenu.updateEnabled",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Menu> menuList(long num) {
		List<Menu> list=null;
		try {
			list=dao.selectList("ownerMenu.menuList",num);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int menuCount(long num) {
		int result=0;
		try {
			result=dao.selectOne("ownerMenu.menuCount",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Menu readMenu(long menuNum) {
		Menu dto=null;
		try {
			dto=dao.selectOne("ownerMenu.readMenu",menuNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertMenu(Menu dto,String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if(saveFilename!=null) {
				dto.setImageFilename(saveFilename);
			}
			
			dao.insertData("ownerMenu.insertMenu",dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateMenu(Menu dto, String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if(saveFilename!=null) {
				dto.setImageFilename(saveFilename);
			}
			
			dao.updateData("ownerMenu.updateMenu",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(long menuNum) throws Exception {
		try {
			dao.deleteData("ownerMenu.deleteMenu",menuNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertOption(Menu dto) throws Exception {
		try {
			System.out.println("임플 넘어옴");
			for(int i=0; i<dto.getOption_names().size(); i++) {
				dto.setOption_name(dto.getOption_names().get(i));
				dto.setOption_price(dto.getOption_prices().get(i));
				System.out.println("그룹명 : "+dto.getOption_group());
				System.out.println("이름 : "+dto.getOption_name());
				System.out.println("가격 : "+dto.getOption_price());
				dao.insertData("ownerMenu.insertOption",dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Menu> optionList(long menuNum) {
		List<Menu> list=null;
		try {
			list=dao.selectList("ownerMenu.optionList",menuNum);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public void deleteOption(Map<String, Object> map) {
		try {
			dao.deleteData("ownerMenu.deleteOption",map);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	@Override
	public String categoryName(long num) {
		String result="";
		
		try {
			result=dao.selectOne("ownerMenu.categoryName",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Menu> optionNameList(Map<String, Object> map) {
		List<Menu> list=null;
		try {
			list=dao.selectList("ownerMenu.optionNameList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Menu> optionGroup(long menuNum) {
		List<Menu> list=null;
		try {
			list=dao.selectList("ownerMenu.optionGroupList",menuNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateStock(Map<String, Object> map) {
		try {
			dao.updateData("ownerMenu.updateStock",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
