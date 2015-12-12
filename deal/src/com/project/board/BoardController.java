package com.project.board;

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

@Controller("board.boardController")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/board/list")
	public ModelAndView list(HttpServletRequest req, 
			@RequestParam(value = "pageNum", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue)throws Exception {
		
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
		
		int start = (current_page - 1) * numPerPage;
		map.put("start", start);
		
		List<Board> list = service.listBoard(map);
		
		//글번호만들기
		int listNum, n = 0;
	
		Iterator<Board> it = list.iterator();
		while (it.hasNext()) {
			Board data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);

			data.setCreated(data.getCreated().substring(0, 10));
			n++;
		}

		String params = "";
		String urlList = cp + "/board/list.do";
		String urlArticle = cp + "/board/article.do?pageNum=" + current_page;

		if (searchValue.length() != 0) {
			params = "searchKey=" + searchKey
					+ "&searchValue="
					+ URLEncoder.encode(searchValue, "UTF-8");
		}

		if (params.length() != 0) {
			urlList += "?" + params;
			urlArticle += "&" + params;
		}

		ModelAndView mav=new ModelAndView(".board.list");
		mav.addObject("list", list);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageNum", current_page);
		mav.addObject("urlArticle", urlArticle);
		mav.addObject("pageIndexList",
				myUtil.pageIndexList(current_page, total_page, urlList));

		return mav;
	}
	
	@RequestMapping(value="/board/created", method=RequestMethod.GET)
	public ModelAndView createdForm(HttpSession session)throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null){
			return new ModelAndView(".member.login");
		}
		
		ModelAndView mav = new ModelAndView(".board.created");
		mav.addObject("mode", "created");
		return mav;
	}
	
	@RequestMapping(value = "/board/created", method=RequestMethod.POST)
	public String createdSubmit(HttpSession session, Board dto) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null){
			return "redirect:/member/login.do";
		}
		
		dto.setUserId(info.getUserId());
		service.insertBoard(dto, "created");
		return "redirect:/board/list.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/board/article")
	public ModelAndView article(HttpSession session,
			@RequestParam int num,
			@RequestParam String pageNum,
			@RequestParam(defaultValue="subject") String searchKey,
			@RequestParam(defaultValue="") String searchValue)throws Exception {
		
		
		SessionInfo info=
				(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return new ModelAndView(".member.login");
		}
		
		//조회수 증가시키기
		service.updateHitCount(num);
		
		//게시물 가져오기
		Board dto = service.readBoard(num);
		if(dto==null) {
			new ModelAndView("redirect:/board/list.do?pageNum="+pageNum);
		}
		
		dto.setContent(
				dto.getContent().replaceAll("\n", "<br>"));
		//이전글, 다음글
		searchValue=URLDecoder.decode(searchValue, "UTF-8");
		
		
		Map<String, Object> map=new HashMap<>();
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("num", num);
		
		Board nextReadDto = service.nextReadBoard(map);
	    Board preReadDto = service.preReadBoard(map);
		
		
		String params="pageNum="+pageNum;
		if(searchValue.length()!=0) {
			params+="&searchKey="+searchKey;
			params+="&searchValue="+
			    URLEncoder.encode(searchValue, "utf-8");
		}
		
		ModelAndView mav=new ModelAndView(".board.article");
		
		mav.addObject("dto", dto);
		mav.addObject("nextReadDto", nextReadDto);
		mav.addObject("preReadDto", preReadDto);
		mav.addObject("pageNum", pageNum);
		mav.addObject("params", params);
		
		return mav;
		
		
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/board/delete")
	public String delete(
			HttpSession session,
			@RequestParam int num,
			@RequestParam String pageNum
			) throws Exception {
		
		SessionInfo info=
				(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login.do";
		}
		
		Board dto=service.readBoard(num);
		if(dto.getUserId().equals(info.getUserId())||
				info.getUserId().equals("admin"))
				service.deleteBoard(num);
		
		return "redirect:/board/list.do?pageNum="+pageNum;		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/board/update", method=RequestMethod.GET)
	public ModelAndView updateForm(HttpSession session,
			@RequestParam int num,
			@RequestParam String pageNum) throws Exception{
		
		
		SessionInfo info=
				(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return new ModelAndView(
					"redirect:/member/login.do");
		}
		
		Board dto=service.readBoard(num);
		if(dto==null || ! dto.getUserId().equals(info.getUserId())) {
			return new ModelAndView(
					"redirect:/board/list.do?pageNum="+pageNum);
		}
		
		ModelAndView mav=
				new ModelAndView(".board.created");
		mav.addObject("mode", "update");
		mav.addObject("dto", dto);
		mav.addObject("pageNum", pageNum);
		return mav;

	}
	
	@RequestMapping(value="/board/update",
			method=RequestMethod.POST)
	public String updateSubmit(
			HttpSession session,
			Board dto,
			@RequestParam String pageNum
			) throws Exception {
		
		SessionInfo info=
				(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login.do";
		}
		
		service.updateBoard(dto);
		
		// return "redirect:/board/list.do?pageNum="+pageNum;
		return "redirect:/board/article.do?num="
		         +dto.getNum()+"&pageNum="+pageNum;
	}

	
	
	@RequestMapping(value="/board/insertReply", method=RequestMethod.POST)
	public void insertReply(HttpServletResponse resp, HttpSession session, Reply dto) throws Exception{
	
		SessionInfo info=(SessionInfo)
				session.getAttribute("member");
		
		String state="true";
		if(info==null) { // 로그인이 되지 않는 경우
			state="loginFail";
		} else {
			dto.setUserId(info.getUserId());
			int result=service.insertReply(dto);
			if(result==0)
				state="false";
		}
		
		JSONObject job = new JSONObject();
		job.put("state", state);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print(job.toString());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="board/listReply")
	public ModelAndView listReply(@RequestParam int num,
								@RequestParam(value="pageNo", defaultValue="1")int current_page)throws Exception{
		
		int numPerPage = 5;
		int total_page;
		int dataCountReply;
		
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("num", num);
		
		dataCountReply = service.DataCountReply(map);
		total_page = myUtil.getPageCount(numPerPage, dataCountReply);
		
		int start = (current_page - 1) * numPerPage;
		map.put("start", start);
		
		List<Reply> listReply = service.listReply(map);
		
		Iterator<Reply>it = listReply.iterator();
		while (it.hasNext()) {
			Reply data = it.next();
			data.setContent(
					data.getContent().replaceAll("\n", "<br>"));
		}
		
		ModelAndView mav = new ModelAndView("board/listReply");
		
		mav.addObject("listReply", listReply);
		mav.addObject("dataCountReply", dataCountReply);
		mav.addObject("pageNo", current_page);
		// AJAX 인자 두개
		mav.addObject("pageIndexList",
				myUtil.pageIndexList(current_page, total_page));
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/board/deleteReply", method=RequestMethod.POST)
	public void deleteReply(HttpServletResponse resp,
			HttpSession session,
			@RequestParam int replyNum)throws Exception{
		
		SessionInfo info=(SessionInfo)
				session.getAttribute("member");
		
		String state="true";
		if(info==null) { // 로그인이 되지 않는 경우
			state="loginFail";
		} else {
			int result=service.deleteReply(replyNum);
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