package com.project.admin.member;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {
	public List<AdminMember> memberList(Map<String, Object> map);
	public List<AdminMember> busiList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
