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


	//����¡ó���� ����� ��
	/*@Autowired
	private MyUtil myUtil;*/
	
	
	//���� ���������� ���â���� �ν���--�ٷ� post�� ����????--����-- �޴¾��̵�
	@RequestMapping(value="/letter/send", method=RequestMethod.POST)
	public void sendSubmit(HttpServletResponse resp, HttpSession session, Letter dto) throws Exception{
	
		// ���� ������
		SessionInfo info=(SessionInfo)session.getAttribute("member");
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
		try {
				
				dto.setSendUserId(info.getUserId());
			System.out.println(dto.getReceiveUserId());
				service.insertLetter(dto);
			state="true";
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		JSONObject job = new JSONObject();
		job.put("isLogin", "true");
		job.put("state", state);
		
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(job.toString());
	}
	
	// ���� ���� ����Ʈ/ �������� ����Ʈ -- ���ÿ� 
	@RequestMapping(value="/letter/list")
	public ModelAndView list(HttpServletResponse resp, HttpSession session,
			Letter dto
		
			) throws Exception{
		
		//������������Ʈ
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
	
	//���� ���·� ��ȯ �ϱ�
	@RequestMapping(value="/letter/updateIdentify", method=RequestMethod.POST)
	public void updateIdentify(
			HttpServletResponse resp, 
			HttpSession session,
			int num
			) throws Exception{
		// ���� ���⿡�� �亯�� Ȯ�� �� ��� ���� ���·� �����
				SessionInfo info=(SessionInfo)session.getAttribute("member");
				if(info==null) {
					JSONObject job=new JSONObject();
					job.put("isLogin", "false");

					// �α����� ���� ���� ���¸� JSON���� ����
					resp.setContentType("text/html; charset=utf-8");
					PrintWriter out=resp.getWriter();
					out.print(job.toString());
					
					return;
				}
				service.updateIdentifyDay(num);
				
				JSONObject job=new JSONObject();
				job.put("isLogin", "true");
				job.put("state", "true");
				
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out=resp.getWriter();
				out.print(job.toString());
	}
}
