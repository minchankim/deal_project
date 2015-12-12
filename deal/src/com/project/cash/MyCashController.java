package com.project.cash;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.member.SessionInfo;

import net.sf.json.JSONObject;

@Controller("myCashController")
public class MyCashController {
	 
	@Autowired
	private CashService service;
	
	@RequestMapping(value="/cash/myCash",method=RequestMethod.GET)
	public ModelAndView method() {
		ModelAndView mav = new ModelAndView(".cash.myCash");
		return mav;
	}
	

	@RequestMapping(value="/cash/insertCash", method=RequestMethod.POST)
public void insertCash(HttpServletResponse resp, HttpSession session, Cash dto) throws Exception{
	
	// 캐시 넣기

	SessionInfo info = (SessionInfo)session.getAttribute("member");
	if(info==null) {
		JSONObject job=new JSONObject();
		job.put("isLogin", "false");
		
		// 로기인이 되지 않은 상태를 json으로 전송
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(job.toString());
		return;
}
	
		String state = "false";
		int scash=0;
		try {
			dto.setUserId(info.getUserId());
			// 총-- 충전
			
			
		
			System.out.println(dto.getCash());
			
			service.insertCash(dto);
			scash = service.readCash(info.getUserId());
			session.setAttribute("cdto", scash);
			state="true";
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		JSONObject job = new JSONObject();
		job.put("jsLogin", "true");
		job.put("state", state);
		job.put("scash", scash);
System.out.println("sssssss"+scash);
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(job.toString());
}
	
	@RequestMapping(value="/cash/returnCash", method=RequestMethod.POST)
public void returnCash(HttpServletResponse resp, HttpSession session, Cash dto) throws Exception{
	
	// 캐시 환전하기

	SessionInfo info = (SessionInfo)session.getAttribute("member");
	if(info==null) {
		JSONObject job=new JSONObject();
		job.put("isLogin", "false");
		
		// 로기인이 되지 않은 상태를 json으로 전송
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(job.toString());
		return;
}
	
		String state = "false";
		int scash2=0;
		try {
			dto.setUserId(info.getUserId());
			
			// 환전 신청 아디이
			
			
			
			service.returnCash(dto);
			scash2 = service.readCash(info.getUserId());
			session.setAttribute("cdto", scash2);
			state="true";
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		JSONObject job = new JSONObject();
		job.put("jsLogin", "true");
		job.put("state", state);

		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(job.toString());
}
	
	// 아이디 별로 잔액 캐쉬 나오는 기능 -- 바로 세션으로 넘김?
/*		@RequestMapping(value="/cahs/myCash", method=RequestMethod.POST)
		public ModelAndView myCash(HttpServletResponse resp, HttpSession session, Cash dto) throws Exception{
			
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");

			if (info == null) {
				return new ModelAndView(".member.login");
			}
			
			List<Cash> list = null;
			list=service.listCash(info.getUserId());
			
			ModelAndView mav = new ModelAndView(".cash.myCash");
			mav.addObject("list",list);
			return mav;
		}
	*/
	
}
