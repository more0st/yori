package com.sp.yogi.admin.service;

import java.util.List;
import java.util.Map;

import com.sp.yogi.owner.Owner;

public interface ResManageService {
	public int dataCount(Map<String, Object> map);
	public List<Owner> listOwner(Map<String, Object> map);
	
	public Owner readOwner(String userId);
	
	public void updateOwnerEnabled(Map<String, Object> map) throws Exception;
	public void insertOwnerState(Owner dto) throws Exception;
	public List<Owner> listOwnerState(String userId);
	public Owner readOwnerState(String userId);
}
