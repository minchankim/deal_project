package com.project.qna;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.common.MyUtil;
import com.project.member.SessionInfo;

import net.sf.json.JSONObject;

@Controller("qna.qnaController")
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/qna/list")
	public ModelAndView list(HttpServletRequest req,
			@RequestParam(value = "pageNum", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue) throws Exception{
		
		String cp = req.getContextPath();

		int numPerPage = 10;
		int total_page;
		int dataCount;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.getPageCount(numPerPage, dataCount);
		
		if (total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * numPerPage;
		
		map.put("start", start);
		
		List<Qna> list=service.listQna(map);
		
		int listNum,n=0;
		
		Iterator<Qna> it = list.iterator();
		while (it.hasNext()) {
			Qna data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			data.setCreated(data.getCreated().substring(0, 10));
			n++;
		}
		String params = "";
		String urlList = cp + "/qna/list.do";
		String urlArticle = cp + "/qna/list.do?pageNum=" + current_page;
		
		if (searchValue.length() != 0) {
			params = "searchKey=" + searchKey + "&searchValue="
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		if (params.length() != 0) {
			urlList += "?" + params;
			urlArticle+="&"+params;
		}
		
		ModelAndView mav=new ModelAndView(".qna.list");
		mav.addObject("list", list);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageNum", current_page);
		mav.addObject("urlArticle", urlArticle);
		mav.addObject("pageIndexList",myUtil.pageIndexList(current_page, total_page, urlList));

		return mav;
	}
	@RequestMapping(value="/qna/created", method=RequestMethod.GET)
	public ModelAndView qnaForm(HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null){
			return new ModelAndView(".member.login");
		}
		
		ModelAndView mav = new ModelAndView(".qna.created");
		mav.addObject("mode", "created");
		return mav;
	}
	
	@RequestMapping(value="/qna/created", method=RequestMethod.POST)
	public ModelAndView qnaSubmit(HttpSession session,Qna qna) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null)
			return new ModelAndView("redirect:/main.do");
		
		qna.setUserId(info.getUserId());
		service.insertQna(qna);
		
		return new ModelAndView("redirect:/qna/list.do");
	}
	
	@RequestMapping(value="/qna/replyCreated", method=RequestMethod.POST)
	public void replyCreated(HttpServletResponse resp,HttpSession session,Qna dto)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state="true";
		if(info==null) { // 로그인이 되지 않는 경우
			state="loginFail";
		} else {
			dto.setUserId(info.getUserId());
			int result=service.insertReply(dto);
			if(result==0)
				state="false";
		}
		
		// 작업 결과를 json으로 전송
		JSONObject job=new JSONObject();
		job.put("state", state);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print(job.toString());
	}
	
	@RequestMapping(value="/qna/reply")
	public ModelAndView reply(
			@RequestParam (value="num")int num
			//,HttpServletResponse resp
			)throws Exception{
		
		List<Qna> listReply=service.listReply(num);
		service.updateHitCount(num);
		
		Iterator<Qna> it=listReply.iterator();
		while(it.hasNext()){
			Qna dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		//JSONObject ob=new JSONObject();
		//ob.put("dataCount", dataCount);
		//ob.put("pageIndexList", pageIndexList);
		//ob.put("num", num);
		//ob.put("listReply", listReply);
		
		//resp.setContentType("text/html;charset=utf-8");
		//PrintWriter out=resp.getWriter();
		//out.print(ob.toString());
		
		ModelAndView mav=new ModelAndView("qna/reply");
		mav.addObject("num",num);
		mav.addObject("listReply", listReply);
		return mav;
	}
	
	@RequestMapping(value="/faq/faqList")
	public ModelAndView faqList(HttpServletRequest req
			) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Qna> list = service.faqList(map);
		
		ModelAndView mav = new ModelAndView(".faq.list");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/qna/deleteQna",method=RequestMethod.POST)
	public void deleteQna(HttpServletResponse resp,HttpSession session,
			@RequestParam(value="num")int num
			)throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state="true";
		if(info==null){
			state="loginFail";
		}else {
			int result=service.deleteReply(num);
			if(result==0)
				state="false";
		}
		JSONObject job=new JSONObject();
		job.put("state", state);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print(job.toString());
	}
}