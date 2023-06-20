package com.sp.yogi.owner;

import java.util.Map;

public interface OwnerService {
	public Owner loginOwner(String userId);
	
	public void insertOwner(Owner dto) throws Exception;
	
	public void updateOwnership(Map<String, Object> map) throws Exception;
	public void updateLastLogin(String userId) throws Exception;
	public void updateOwner(Owner dto) throws Exception;
	
	public Owner readOwner(String userId);
	public Owner readOwner(long OwnerNum);
	
	public void deleteOwner(Map<String, Object> map) throws Exception;
	
	public void generatePwd(Owner dto) throws Exception;
}
