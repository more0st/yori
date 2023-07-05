package com.sp.yogi.member;

import java.util.Map;

public interface MemberService {
	public Member loginMember(String userId);
	
	public void insertMember(Member dto) throws Exception;
	
	public void updateMembership(Map<String, Object> map) throws Exception;
	public void updateLastLogin(String userId) throws Exception;
	public void updateMember(Member dto) throws Exception;
	
	public Member readMember(String userId);
	public Member readMember(long memberNum);
	public Member readMemberEmail(String email);
	public Member readMemberNickName(String nickName);

	public void deleteMember(Map<String, Object> map) throws Exception;
	
	public void generatePwd(Member dto) throws Exception;
	
	public void sendIdInfo(Member dto) throws Exception;
	
	public boolean enableMember(String userId) throws Exception;
	public void failCount(String userId) throws Exception;
	public void updateEnabled(String userId) throws Exception;
}
