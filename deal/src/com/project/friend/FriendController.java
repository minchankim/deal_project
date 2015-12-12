package com.project.friend;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.member.Photo;
import com.project.member.SessionInfo;

import net.sf.json.JSONObject;

@Controller("friendController")
public class FriendController {
	@Autowired
	private FriendService service;

	@RequestMapping(value="/friend/list")
	public ModelAndView list(HttpSession session, Photo dto) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		List<Friend> list=service.friendList(info.getUserId());
		List<Friend> myFriendList=service.myFriendList(info.getUserId());
		ModelAndView mav = new ModelAndView(".friend.list");
		mav.addObject("allList", list);
		mav.addObject("myFriendList", myFriendList);
		mav.addObject("mode", "allList");
		mav.addObject("member",info);
		return mav;
	}
	
	@RequestMapping(value="/friend/myFriendList")
	public ModelAndView myFriendList(HttpSession session, Photo dto) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		List<Friend> myFriendList=service.myFriendList(info.getUserId());


		ModelAndView mav = new ModelAndView(".friend.list");
		mav.addObject("myFriendList", myFriendList);
		mav.addObject("mode", "myFriendList");
		mav.addObject("member",info);
		return mav;
	}
	
	
	@RequestMapping(value="/friend/followFriend", method=RequestMethod.POST)
	public void followFriend(HttpSession session,
			HttpServletResponse resp,
			Friend dto, 
			@RequestParam(value="friendUserId") String friendUserId) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setUserId(info.getUserId());
		dto.setFriendUserId(friendUserId);
		service.followFriend(dto);
		  
		JSONObject job=new JSONObject();
	     
	      resp.setContentType("text/html;charset=utf-8");
	      PrintWriter out=resp.getWriter();
	      out.print(job.toString());
	}
	
	@RequestMapping(value="/friend/deleteFriend", method=RequestMethod.POST)
	public void deleteFriend(HttpSession session,
			HttpServletResponse resp,
			Friend dto, 
			@RequestParam(value="num") int num) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setUserId(info.getUserId());
		service.deleteFriend(num);
		   
		JSONObject job=new JSONObject();
	     
	      resp.setContentType("text/html;charset=utf-8");
	      PrintWriter out=resp.getWriter();
	      out.print(job.toString());
	}
	

}
