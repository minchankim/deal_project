package com.project.letter;

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

@Controller("letter.letterController")
public class LetterController {

	@Autowired
	private LetterService service;


	//페이징처리시 사용할 것
	/*@Autowired
	private MyUtil myUtil;*/
	
	
	//쪽지 보내기폼은 모달창으로 인식함--바로 post로 보냄????--질문-- 받는아이디
	@RequestMapping(value="/letter/send", method=RequestMethod.POST)
	public void sendSubmit(HttpServletResponse resp, HttpSession session, Letter dto) throws Exception{
	
		// 쪽지 보내기
		SessionInfo info=(SessionInfo)session.getAttribute("member");
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
		int noticeletter=0; // 받은 쪽지 알람수
		try {
				
				dto.setSendUserId(info.getUserId());
				System.out.println(dto.getReceiveUserId());
				service.insertLetter(dto);
				noticeletter = service.readNewLetterCount(info.getUserId());
				session.setAttribute("ldto", noticeletter);
				state="true";
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		/*info.setLetterNoticeCount(service.readNewLetterCount(info.getUserId()));
		session.setAttribute("letterNoticeCount", info.getLetterNoticeCount());*/
		
		JSONObject job = new JSONObject();
		job.put("isLogin", "true");
		job.put("state", state);
		job.put("noticeletter", noticeletter);
		
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(job.toString());
	}
	
	// 받은 쪽지 리스트/ 보낸쪽지 리스트 -- 동시에 
	@RequestMapping(value="/letter/list")
	public ModelAndView list(HttpServletResponse resp, HttpSession session,
			Letter dto
		
			) throws Exception{
		
		//보낸쪽지리스트
		SessionInfo info = (SessionInfo)session.getAttribute("member");

				if (info == null) {
					return new ModelAndView(".member.login");
				}
		
		
		List<Letter> list1 = null;
		List<Letter> list2 = null;
		
		list1=service.listReceive(info.getUserId());
		list2=service.listSend(info.getUserId());
		
		ModelAndView mav=new  ModelAndView(".note.list");

			mav.addObject("list1", list1);
			mav.addObject("list2", list2);

		
			return  mav;
	
	}
	
	
	// top 리스트에 출력하기
	@RequestMapping(value="/letter/listTopReceive")
	public ModelAndView listTopReceive(HttpServletResponse resp, HttpSession session, Letter dto)
			throws Exception{
			
		SessionInfo info = (SessionInfo)session.getAttribute("member");
	
		List<Letter> list  = null;
		list = service.listTopReceive(info.getUserId());
		ModelAndView mav = new ModelAndView("note/listTopReceive"); // ajax 처리하기위해서
		
		mav.addObject("list", list);
	
		return mav;
		
	}
	
	//읽은 상태로 변환 하기
	@RequestMapping(value="/letter/updateIdentify", method=RequestMethod.POST)
	public void updateIdentify(
			HttpServletResponse resp, 
			HttpSession session,
			int num
			) throws Exception{
		// 쪽지 보기에서 답변을 확인 한 경우 읽은 상태로 만들기
				SessionInfo info=(SessionInfo)session.getAttribute("member");
				if(info==null) {
					JSONObject job=new JSONObject();
					job.put("isLogin", "false");

					// 로그인이 되지 않은 상태를 JSON으로 전송
					resp.setContentType("text/html; charset=utf-8");
					PrintWriter out=resp.getWriter();
					out.print(job.toString());
					
					return;
				}
				String state = "false";
				int noticeletter2 =0;
				
				try {
					service.updateIdentifyDay(num);
					noticeletter2 = service.readNewLetterCount(info.getUserId());
					session.setAttribute("ldto", noticeletter2);
					state="true";
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				
				JSONObject job=new JSONObject();
				job.put("isLogin", "true");
				job.put("state", state);
				job.put("noticeletter2", noticeletter2);
				
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out=resp.getWriter();
				out.print(job.toString());
	}
	
	
	
	
}
