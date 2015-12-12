package com.project.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.dao.CommonDAO;

@Service("board.boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int insertBoard(Board dto, String mode) {
		int result = 0;
		
		try {
			
			result = dao.insertData("board.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list=null;
		try {
			list=dao.getListData("board.listBoard", map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}


	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("board.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public Board readBoard(int num) {
		Board dto = null;
		try {
			dto = dao.getReadData("board.readBoard", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}


	@Override
	public int updateHitCount(int num) {
		int result = 0;
		try {
			result = dao.updateData("board.updateHitCount", num);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.getReadData("board.nextReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.getReadData("board.preReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	


	@Override
	public int updateBoard(Board dto) {
		int result=0;
		try {
			result=dao.updateData("board.updateBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public int deleteBoard(int num) {
		int result=0;
		try {
			result=dao.deleteData("board.deleteBoard", 
					num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}		
		return result;
	}


	@Override
	public int insertReply(Reply dto) {
		int result = 0;
		
		try {
			result = dao.insertData("board.insertReply", dto);	
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		try {
			list=dao.getListData("board.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}


	@Override
	public int DataCountReply(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("board.dataCountReply",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public int deleteReply(int replyNum) {
		int result = 0;
		try {
			result = dao.deleteData("board.deleteReply", replyNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}




}
