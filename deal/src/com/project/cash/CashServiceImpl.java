package com.project.cash;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.dao.CommonDAO;

@Service("cash.cashService")
public class CashServiceImpl implements CashService{

	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int insertCash(Cash dto) {
		int result=0;
		
		try {
			result=dao.insertData("cash.insertCash", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result=dao.getIntValue("cash.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	//오직 캐시만  잔액 캐쉬만 알수 있음
	@Override
	public int readCash(String userId) {
		int myCash=0;
		try {
			myCash=dao.getReadData("cash.myCash", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		System.out.println(myCash);
		return myCash;
	}


	@Override
	public int returnCash(Cash dto) {
		int result=0;
		
		try {
			result=dao.insertData("cash.returnCash", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
}

/*	@Override
	public List<Cash> listinsertCash(String userId) {
		List<Cash> list = null;
		
		try {
			list = dao.getListData("cash.listInsertCash", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}*/
	
/*
	@Override
	public List<Cash> listBuy(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cash> listReturn(String userId) {
		// TODO Auto-generated method stub
		return null;
	}*/

	/*@Override
	public List<Cash> listBuy(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cash> listReturn(String userId) {
			List<Cash> list = null;
		
		try {
			list = dao.getListData("cash.listReturn", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}*/


}

