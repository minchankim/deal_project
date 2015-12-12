package com.project.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.dao.CommonDAO;



@Service("member.memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertMember(Member dto) {
		int result = 0;
		try {
			//email
			
			
			result = dao.insertData("member.insertMember", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		return result;
	}

	@Override
	public int updateMember(Member dto) {
		int result = 0;
		
			/*
			result = dao.updateData("member.updateMember", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;*/
		return result;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member readMember(String userId) {
		Member dto = null;
		
		try {
			dto=dao.getReadData("member.readMember",userId);
	
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;//값이 안들어감...
	}

	@Override
	public List<Member> listBusiness(Map<String, Object> map) {
		List<Member> list=null;
		try {
			list=dao.getListData("member.listBusiness",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	

}
