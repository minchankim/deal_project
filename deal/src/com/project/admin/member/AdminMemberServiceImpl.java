package com.project.admin.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.dao.CommonDAO;

@Service("admin.member.memberService")
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	private CommonDAO dao;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("admin.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<AdminMember> memberList(Map<String, Object> map) {
		List<AdminMember> list=null;
		try {
			list=dao.getListData("admin.memberList",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<AdminMember> busiList(Map<String, Object> map) {
		List<AdminMember> list=null;
		try {
			list=dao.getListData("admin.busiList",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}

