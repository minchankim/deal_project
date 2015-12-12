package com.project.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.FileManager;
import com.project.common.dao.CommonDAO;
import com.project.deal.Deal;


@Service("main.mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	private CommonDAO  dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<Deal> listDeal(Map<String, Object> map) {
	List<Deal> list=null;
		
		try{
			list=dao.getListData("main.listDeal", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

}
