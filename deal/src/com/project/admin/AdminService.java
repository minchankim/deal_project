package com.project.admin;

import java.util.Map;

public interface AdminService {
	//총회원수, 총 딜갯수,총 사업자 수,최고 참여인원수,남성/여성 인원수
	public int memberTCount(Map<String, Object> map);
	public int busiTCount(Map<String, Object> map);
	public int dealTCount(Map<String, Object> map);
	public int dealjoinCount(Map<String, Object> map);
	public int maleCount(Map<String, Object> map);
	public int femaleCount(Map<String, Object> map);
}
