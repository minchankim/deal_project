package com.project.admin;

import java.util.Map;

public interface AdminService {
	//��ȸ����, �� ������,�� ����� ��,�ְ� �����ο���,����/���� �ο���
	public int memberTCount(Map<String, Object> map);
	public int busiTCount(Map<String, Object> map);
	public int dealTCount(Map<String, Object> map);
	public int dealjoinCount(Map<String, Object> map);
	public int maleCount(Map<String, Object> map);
	public int femaleCount(Map<String, Object> map);
}
