package com.project.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.dao.CommonDAO;

@Service("admin.adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int memberTCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("adminMain.memberTCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int busiTCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("adminMain.busiTCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dealTCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("adminMain.dealTCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dealjoinCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("adminMain.dealjoinCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int maleCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("adminMain.maleCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int femaleCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("adminMain.femaleCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
