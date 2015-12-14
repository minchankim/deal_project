package com.project.myDeal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.deal.Deal;
import com.project.main.MainService;
import com.project.member.SessionInfo;

@Controller("myDealController")
public class MyDealController {
	
	@Autowired
	private MainService service;
	 
	@RequestMapping(value="/myDeal/myDeal",method=RequestMethod.GET)
	public ModelAndView method(
			HttpServletRequest req,HttpSession session
			) {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if (info == null) {
			return new ModelAndView(".member.login");
		}
		 Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", 0);
			map.put("userId", info.getUserId());
			 List<Deal> dealInList = service.dealInList(map);
			 List<Deal> dealUploadList = service.dealUploadList(map);
		 ModelAndView mav = new ModelAndView(".myDeal.myDeal");
		
		
			mav.addObject("dealInList", dealInList);
			mav.addObject("dealUploadList", dealUploadList);
		return mav;
	}
}
