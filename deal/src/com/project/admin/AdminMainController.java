package com.project.admin;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.member.SessionInfo;



@Controller("admin.mainController")
public class AdminMainController {
	
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String main(
			//HttpSession session			
			) throws Exception {
		
		/*SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null){
			return "redirect:/member/login.do";
		}
		*/
		return ".adminMainLayout";
	}
}
