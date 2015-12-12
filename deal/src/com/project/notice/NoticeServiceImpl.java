package com.project.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.dao.CommonDAO;

@Service("notice.noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertNotice(Notice dto, String mode) {
		int result = 0;
		
		try {
			result = dao.insertData("notice.insertNotice", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		try {
			list=dao.getListData("notice.listNotice", map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("notice.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list = null;
		
		try {
			list=dao.getListData("notice.listNoticeTop");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateHitCount(int num) {
		int result = 0;
		try {
			result = dao.updateData("notice.updateHitCount", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Notice readNotice(int num) {
		Notice dto = null;
		try {
			dto = dao.getReadData("notice.readNotice", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateNotice(Notice dto) {
		int result = 0;
		
		try {
			result = dao.updateData("notice.updateNotice", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int deleteNotice(int num) {
		int result = 0;
		try {
			
			result = dao.deleteData("notice.deleteNotice", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReply(Reply dto) {
		int result = 0;
		
		try {
			
			result = dao.insertData("notice.insertReply", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		try {
			
			list = dao.getListData("notice.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int DataCountReply(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("notice.dataCountReply", map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(int replyNum) {
		int result = 0;
		
		try {
			result = dao.deleteData("notice.deleteReply", replyNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto = null;
		
		try {
			
			dto =dao.getReadData("notice.nextReadNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto = null;
		try {
			
			dto =dao.getReadData("notice.preReadNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

}
