package com.project.main;

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

import com.project.main.MainService;
import com.project.member.SessionInfo;
import com.project.common.FileManager;
import com.project.common.MyUtil;
import com.project.deal.Deal;
import com.project.deal.DealService;



@Controller("mainController")
@RequestMapping(value="/main")
public class MainController {
	
	@Autowired
	private MainService service;
	@Autowired
	private DealService dservice;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	 
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView method(
			HttpServletRequest req,HttpSession session
			) {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		 Map<String, Object> map = new HashMap<String, Object>();
		 List<Deal> mainList = service.listDeal(map);
		 ModelAndView mav = new ModelAndView(".mainLayout");
		try {
			
			 List<Deal> DealInList = dservice.listDealIn(info.getUserId());
				mav.addObject("DealInList", DealInList);
		} catch (Exception e) {
			System.out.println(e.toString()+"로그인 안하면 생기는 NULL이니 상관 ㄴㄴMAINCONTROLLER임");
		}
		
		
		 
		 
		
		 
		 
		
	
		mav.addObject("MainDealList", mainList);
	
		
		return mav;
	}
	
	
	
}
