package com.project.admin.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller("admin.member.memberController")
public class MemberController {
	@RequestMapping(value="/admin/member/memberList", method=RequestMethod.GET)
	public String member() throws Exception {
		return ".admin.member.memberList";
	}
	
	@RequestMapping(value="/admin/member/busiList", method=RequestMethod.GET)
	public String busi() throws Exception {
		return ".admin.member.busiList";
	}
	
	@RequestMapping(value="/admin/member/blackList", method=RequestMethod.GET)
	public String black() throws Exception {
		return ".admin.member.blackList";
	}
}


