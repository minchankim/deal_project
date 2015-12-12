package com.project.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	public int insertMember(Member dto);
	public int updateMember(Member dto);
	public int deleteMember(String userId);
	public Member readMember(String userId);
	
	//°¡°İÈïÁ¤
	public List<Member> listBusiness(Map<String, Object> map);
}
