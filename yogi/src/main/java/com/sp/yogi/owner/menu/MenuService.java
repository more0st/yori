package com.sp.yogi.owner.menu;

import java.util.List;

public interface MenuService {

	//categoryList : 카테고리 list
	public List<Menu> categoryList(long restaurantNum);
	//categoryCount : 카테고리 개수
	public int categoryCount(long restaurantNum);
	//insertCategory : 카테고리 추가
	public void insertCategory(Menu dto) throws Exception;
	//updateCategory : 카테고리 수정 update
	public void updateCategory(Menu dto) throws Exception;
	//deleteCategory : 카테고리 삭제 delete
	public void deleteCategory(long num) throws Exception;
	//menuList : 카테고리번호별 메뉴리스트
	public List<Menu> menuList(long num);
	//menuCount : 카테고리번호별 메뉴개수
	public int menuCount(long num);
	//readMenu : 메뉴번호별 메뉴정보불러오기
	public Menu readMenu(long menuNum);
	//insertMenu : 메뉴등록
	public void insertMenu(Menu dto,String pathname) throws Exception;
	//updateMenu : 메뉴수정
	public void updateMenu(Menu dto) throws Exception;
	//deleteMenu : 카테고리번호별 메뉴별 삭제
	public void deleteMenu(Menu dto) throws Exception;
	//insertOption : 옵션추가
	public void insertOption(Menu dto) throws Exception;
	//optionList : 옵션 리스트
	public List<Menu> optionList(long menuNum);
	//deleteOption : 옵션 삭제
	public void deleteOption(long menuNum);
	
 }
