package com.project.cash;

import java.io.PrintWriter;
import java.util.List;

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
	

	@RequestMapping(value="/cash/insertCash", method=RequestMethod.POST)
public void insertCash(HttpServletResponse resp, HttpSession session, Cash dto) throws Exception{
	
	// ĳ�� �ֱ�

	SessionInfo info = (SessionInfo)session.getAttribute("member");
	if(info==null) {
		JSONObject job=new JSONObject();
		job.put("isLogin", "false");
		
		// �α����� ���� ���� ���¸� json���� ����
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(job.toString());
		return;
}
	
		String state = "false";
		int scash=0;
		try {
			dto.setUserId(info.getUserId());
			// ��-- ����
			
			
		
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
/*System.out.println("�����ݾ�"+scash);*/
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(job.toString());
}
	
	@RequestMapping(value="/cash/returnCash", method=RequestMethod.POST)
public void returnCash(HttpServletResponse resp, HttpSession session, Cash dto) throws Exception{
	
	// ĳ�� ȯ���ϱ�

	SessionInfo info = (SessionInfo)session.getAttribute("member");
	if(info==null) {
		JSONObject job=new JSONObject();
		job.put("isLogin", "false");
		
		// �α����� ���� ���� ���¸� json���� ����
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(job.toString());
		return;
}
	
		String state = "false";
		int scash2=0;
		try {
			dto.setUserId(info.getUserId());
			
			// ȯ�� ��û �Ƶ���
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
		job.put("scash2", scash2);

		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(job.toString());
}
	
	
	@RequestMapping(value="/cash/list")
	public ModelAndView list(HttpServletResponse resp, HttpSession session,
			Cash dto
		
			) throws Exception{
		
		//������������Ʈ
		
		//�α��� ������ �˾Ƴ������� ���
				SessionInfo info = (SessionInfo)session.getAttribute("member");

						if (info == null) {
							return new ModelAndView(".member.login");
						}
		
		List<Cash> list1 = null;
		List<Cash> list2 = null;
		//List<Cash> list3 = null;
		
		list1=service.listinsertCash(info.getUserId());
		list2=service.listReturn(info.getUserId());

		//list3=service.listReturn(info.getUserId());
		
		ModelAndView mav=new  ModelAndView(".cash.myCash");

			mav.addObject("list1", list1);
			mav.addObject("list2", list2);
			//mav.addObject("list3", list3);
		
			return  mav;
	
	}
	
	
}
