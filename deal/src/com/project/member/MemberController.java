package com.project.member;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.cash.CashService;





@Controller("memberController")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private PhotoService pservice;
	
	@Autowired
	private CashService cservice;

	
	
	@RequestMapping(value="/member/member", method=RequestMethod.GET)
	public ModelAndView memberForm() throws	Exception{
		
		ModelAndView mav = new ModelAndView(".member.member");

		return mav;
	}
	
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public ModelAndView loginForm() throws	Exception{
		
		ModelAndView mav = new ModelAndView(".member.login");
		mav.addObject("mode", "login");
		return mav;
	}
	
	@RequestMapping(value="/member/default", method=RequestMethod.GET)
	public ModelAndView defaultForm() throws	Exception{
		
		ModelAndView mav = new ModelAndView(".main.default");
		mav.addObject("mode", "login");
		return mav;
	}


	
	
	    @RequestMapping(value="/member/member",method=RequestMethod.POST)
	 public ModelAndView memberSubmit(
			HttpSession session,
			Photo pdto,
			Member dto
			) throws Exception{
		SessionInfo info = new SessionInfo();
		session.setAttribute("member", info);
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+File.separator+"uploads"+File.separator+"photo";
	
	
		  int result = service.insertMember(dto);

		pdto.setUserId(dto.getUserId());
	
		pservice.insertPhoto(pdto, path);
		if(result==0){
			ModelAndView mav = new ModelAndView(".member.member");
			mav.addObject("mode", "created");
			mav.addObject("title", "����");
			mav.addObject("message","���̵� �ߺ����� ȸ�������� ���� �߽��ϴ�.");
			
			return mav;
		}
		
		ModelAndView mav = new ModelAndView(".member.login");
		mav.addObject("message", "ȸ�������� ���� ó�� �Ǿ����ϴ�.<br> �α��� �Ͻñ� �ٶ��ϴ�.");
		mav.addObject("mode", "login");
		return mav;
		
	
	}
	
	@RequestMapping(value="/member/login",method=RequestMethod.POST)
	public ModelAndView loginSubmit(
			HttpSession session,
			@RequestParam String userId,
			@RequestParam String userPwd
			) throws Exception{
		
		Member dto = service.readMember(userId);
		int cdto = cservice.readCash(userId);
		
		if(dto == null){
			String msg = "���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.";
			ModelAndView mav = new ModelAndView(".member.member");
			mav.addObject("message",msg);
			return mav;
		}
		
		System.out.println(cdto);
		SessionInfo info = new SessionInfo();
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		
	
		Photo pdto = pservice.readPhoto(dto.getUserId());

		//���ǿ� �α��� ���� ����
		session.setAttribute("member", info);
		session.setAttribute("pdto", pdto);
		session.setAttribute("cdto", cdto);
		return new ModelAndView("redirect:/");
	}
	
	
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session) 
			throws Exception{
		//���ǿ� ����� ���� �����
		session.removeAttribute("member");
		//���� �ʱ�ȭ
		session.invalidate();
		
		return "redirect:/";
	}
	
	//��������
	@RequestMapping(value="/dealboard/list")
	public ModelAndView list(HttpServletRequest req)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		List<Member> list=service.listBusiness(map);
		ModelAndView mav=new ModelAndView(".dealboard.list");
		mav.addObject("list",list);
		return mav;
	}
}
