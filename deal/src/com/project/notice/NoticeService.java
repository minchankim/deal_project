package com.project.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	public int insertNotice(Notice dto, String mode);
	public List<Notice> listNotice(Map<String, Object>map);
	public int dataCount(Map<String, Object>map);
	public List<Notice> listNoticeTop();

	
	public int updateHitCount(int num);
	public Notice nextReadNotice(Map<String, Object>map);
	public Notice preReadNotice(Map<String, Object>map);
	
	
	public Notice readNotice(int num);
	
	public int updateNotice(Notice dto);
	public int deleteNotice(int num);
	
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object>map);
	public int DataCountReply(Map<String, Object>map);
	public int deleteReply(int replyNum);
	
	
}
