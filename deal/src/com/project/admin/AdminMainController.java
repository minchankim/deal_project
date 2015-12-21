package com.project.admin;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller("admin.mainController")
public class AdminMainController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public ModelAndView main() throws Exception {
		int count1,count2,count3,count4,count5,count6;
		ModelAndView mav = new ModelAndView(".adminMainLayout");
		
		Map<String, Object> map = new HashMap<String, Object>();
		count1=service.memberTCount(map);
		count2=service.busiTCount(map);
		count3=service.dealTCount(map);
		count4=service.dealjoinCount(map);
		count5=service.maleCount(map);
		count6=service.femaleCount(map);
		
		mav.addObject("count1",count1);
		mav.addObject("count2",count2);
		mav.addObject("count3",count3);
		mav.addObject("count4",count4);
		mav.addObject("count5",count5);
		mav.addObject("count6",count6);
		return mav;
	}
}
