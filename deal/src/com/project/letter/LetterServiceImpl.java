package com.project.letter;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.dao.CommonDAO;

@Service("letter.letterService")
public class LetterServiceImpl implements LetterService{
	@Autowired
	CommonDAO dao;
	

	@Override
	public int insertLetter(Letter dto) {
		int result=0;

		try {
			result=dao.insertData("letter.insertLetter", dto);
			dao.updateData("letter.updateAlarmCount", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
		
		
	}

	@Override
	public int dataCountReceive(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("letter.dataCountReceive", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Letter> listReceive(String userId) {
		
		List<Letter> list = null;
		
		try {
			list=dao.getListData("letter.listReceive", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Letter> listTopReceive(String userId) {
		List<Letter> list = null;
		try {
				list = dao.getListData("letter.listTopReceive", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
		
	}
	
	@Override
	public int dataCountSend(Map<String, Object> map) {
			int result=0;
			try {
				result=dao.getIntValue("letter.dataCountSend", map);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		return result;
	}

	@Override
	public List<Letter> listSend(String userId) {
		
		List<Letter> list = null;
		
		try {
			list = dao.getListData("letter.listSend", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public Letter readReceive(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Letter preReadReceive(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Letter nextReadReceive(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Letter readSend(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Letter preReadSend(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Letter nextReadSend(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Letter readReplReceive(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	//쪽지 읽은상태 바꾸기
	@Override
	public int updateIdentifyDay(int num) {
		int result=0;
		
		try {
			result=dao.updateData("letter.updateIdentifyDay", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	

	@Override
	public int deleteLetter(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int readNewLetterCount(String userId) {
		int result=0;
		try {
			result=dao.getReadData("letter.readLetterCount", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Letter> listSend(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Letter> listReceive(Map<String, Object> map) {
	
		
		List<Letter> list = null;
		
		try {
			list=dao.getListData("letter.listReceive", map);
		} catch (Exception e) {
		
			System.out.println(e.toString());
			
		}
		return list;
	}

}
