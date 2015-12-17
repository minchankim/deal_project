package com.project.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("admin.member.memberController")
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService service;
	
	@RequestMapping(value="/admin/member/memberList", method=RequestMethod.GET)
	public ModelAndView member() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
		List<AdminMember> list=service.memberList(map);
		ModelAndView mav = new ModelAndView( ".admin.member.memberList");
		mav.addObject("memberList", list);
		return mav;
	}
	
	@RequestMapping(value="/admin/member/busiList", method=RequestMethod.GET)
	public ModelAndView busi() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<AdminMember> list=service.busiList(map);
		ModelAndView mav = new ModelAndView(".admin.member.busiList");
		mav.addObject("busiList", list);
		return mav;
	}
	
	@RequestMapping(value="/admin/member/blackList", method=RequestMethod.GET)
	public String black() throws Exception {
		return ".admin.member.blackList";
	}
}
