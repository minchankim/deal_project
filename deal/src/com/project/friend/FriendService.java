package com.project.friend;

import java.util.List;
import java.util.Map;

public interface FriendService {	
	public List<Friend> followFriend( Friend dto); //��ģ���߰� 
	public List<Friend> friendSearchList(Map<String, Object> map); //ģ�� ã�� ����������Ʈ
	public List<Friend> myFriendList(String friendUserId);	 //��ģ�� ����Ʈ
	
	public int deleteFriend(int num); //��ģ�� ����
	public int deleteFriendList(List<Integer> numList);

	public List<Friend> friendList(String userId); //��� ȸ��

}
