package com.project.deal;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.member.Photo;
import com.project.member.PhotoService;
import com.project.member.SessionInfo;


import net.sf.json.JSONObject;

@Controller("deal.Controller")
public class DealController {
	
	@Autowired
	private DealService service;
	
	@Autowired
	private PhotoService pservice;
	 
	@RequestMapping(value="/deal/article",method=RequestMethod.GET)
	public ModelAndView articleInform(
			HttpSession session,
			@RequestParam(value="num") int num
			
			) throws Exception {
		ModelAndView mav=new ModelAndView(".deal.article");
		Deal dto = service.readDeal(num);
		List<Deal> graphdto = service.readDealGraph(dto.getSmillarNum());
		
		String[] image = new String[11];
		int imageCount=0;
		int imageStart=0;
		int imageEnd=0;
		
		String content=dto.getContent();
		char[] charContent = content.toCharArray();
		String[] stringContent = new String[dto.getContent().length()];

		for(int i= 0;i<dto.getContent().length();i++){
		stringContent[i]=String.valueOf(charContent[i]);
		}
		
		System.out.println();
		for(int i= 0;i<dto.getContent().length();i++){
		
		if(stringContent[i].equals("<")&&stringContent[i+1].equals("i")&&stringContent[i+2].equals("m")&&stringContent[i+3].equals("g")){
		/*System.out.println("이미지시작"+i);*/
		imageStart=i;
		}
		
		if(stringContent[i].equals("w")&&stringContent[i+1].equals("i")&&stringContent[i+2].equals("d")&&stringContent[i+3].equals("t")){
		/*System.out.println("이미지끝"+(i+11));*/
		imageEnd=i+12;
		image[imageCount]=dto.getContent().substring(imageStart, imageEnd);
				imageStart=0;
				imageEnd=0;
				imageCount++;
		}

	}
		/*Deal[] graph = new Deal[1];
		

		System.out.println(graph[0].getAvgprice());
*/
		 
/*		 for(int j=0;j<13;j++){
			 for (Deal g : graphdto) { // 배열의 내용을 출력할 때 향상된 for문으로 간단하게 출력
				 if(g.getDealmonth()==j){
					 System.out.println("avg");
					 graph[j].setAvgprice(g.getAvgprice());
				 }else{
					 System.out.println("else");
					 graph[j].setAvgprice(0);
				 }

			 }
			
		 }*/
		
		int[] graph = new int[13];
	/*	int n=0;
		for (Deal g : graphdto) {
		
			
			if(g.getDealmonth()==n){
				System.out.println("dd");
				graph[++n]=g.getAvgprice();
			}else
			{
				graph[++n]=g.getAvgprice();
			}
			
			graph[++n]=g.getDealmonth();
			System.out.print(g.getDealmonth()+"월");
			System.out.println(g.getAvgprice());
		 }*/
		int n=0;
		for(int a:graph){
			
			
			for (Deal g : graphdto) {
				
				
				if(g.getDealmonth()==n){

					graph[n]=g.getAvgprice();
	
					/*System.out.println("dd");
					graph[n]=g.getAvgprice();
					System.out.println(graph[n]);*/
					break;
				}else
				{
					/*System.out.println("ss");*/
					graph[n]=0;
					/*System.out.println("ss");
					graph[n]=0;
					System.out.println(graph[n]);*/
				}
				
				/*graph[++n]=g.getDealmonth();
				System.out.print(g.getDealmonth()+"월");
				System.out.println(g.getAvgprice());*/
			 }
			n++;
		}
		int n2=0;
		for(int a:graph){
			/*System.out.println(n2+"월-"+graph[n2]);*/
			n2++;
		}
		/* for (Deal g : graphdto) {
			 
		 if(g.getDealmonth()==1){graph[1]=g.getAvgprice();}else{graph[1]=0;}
		 if(g.getDealmonth()==2){graph[2]=g.getAvgprice();}else{graph[2]=0;}
		 if(g.getDealmonth()==3){graph[3]=g.getAvgprice();}else{graph[3]=0;}
		 if(g.getDealmonth()==4){graph[4]=g.getAvgprice();}else{graph[4]=0;}
		 if(g.getDealmonth()==5){graph[5]=g.getAvgprice();}else{graph[5]=0;}
		 if(g.getDealmonth()==6){graph[6]=g.getAvgprice();}else{graph[6]=0;}
		 if(g.getDealmonth()==7){graph[7]=g.getAvgprice();}else{graph[7]=0;}
		 if(g.getDealmonth()==8){graph[8]=g.getAvgprice();}else{graph[8]=0;}
		 if(g.getDealmonth()==9){graph[9]=g.getAvgprice();}else{graph[9]=0;}
		 if(g.getDealmonth()==10){graph[10]=g.getAvgprice();}else{graph[10]=0;}
		 if(g.getDealmonth()==11){graph[11]=g.getAvgprice();}else{graph[11]=0;}
		 if(g.getDealmonth()==12){graph[12]=g.getAvgprice();}else{graph[12]=0;}
		 }
		 */
		List<Photo> dealInPepople = pservice.listInPeople(num);
		
		

	mav.addObject("graphdto1", graph[1]);
		mav.addObject("graphdto2", graph[2]);
		mav.addObject("graphdto3", graph[3]);
		mav.addObject("graphdto4", graph[4]);
		mav.addObject("graphdto5", graph[5]);
		mav.addObject("graphdto6", graph[6]);
		mav.addObject("graphdto7", graph[7]);
		mav.addObject("graphdto8", graph[8]);
		mav.addObject("graphdto9", graph[9]);
		mav.addObject("graphdto10", graph[10]);
		mav.addObject("graphdto11", graph[11]);
		mav.addObject("graphdto12", graph[12]);
		
		
		mav.addObject("dealArticle", dto);
		mav.addObject("dealPhoto", image);
		mav.addObject("dealInPeople", dealInPepople);
		
		return mav;
	}
	
	
	@RequestMapping(value="/deal/created",method=RequestMethod.GET)
	public ModelAndView articleCreated() throws Exception {
		ModelAndView mav=new ModelAndView(".deal.created");
		
		List<DealCategory> list=service.listBigCategory();
		
	
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/deal/created", method=RequestMethod.POST)
	public ModelAndView createdSubmit(
			HttpSession session,
			Deal dto,
			@RequestParam(value="start_date", defaultValue="1") String start_date,
			@RequestParam(value="end_date", defaultValue="1") String end_date
			) throws Exception {

		dto.setStart_date(start_date.substring(0, 10));
		dto.setEnd_date(end_date.substring(0, 10));
		
/*		System.out.println(dto.getSubject());
		System.out.println(dto.getDiscountRate());
		System.out.println(dto.getInstantPrice());
		System.out.println(dto.getPeople());
		System.out.println(dto.getApproveCheck());
		System.out.println(dto.getCategory1());
		System.out.println(dto.getCategory2());
		System.out.println(dto.getStart_date());
		System.out.println(dto.getEnd_date());
		System.out.println(dto.getContent());
		System.out.println(dto.getRegion1());
		System.out.println(dto.getRegion2());
		System.out.println(dto.getTag1());
		System.out.println(dto.getTag2());*/
		
		
		
		String[] image = new String[11];
		int imageCount=0;
		int imageStart=0;
		int imageEnd=0;
		
		String content=dto.getContent();
		char[] charContent = content.toCharArray();
		String[] stringContent = new String[dto.getContent().length()];

		for(int i= 0;i<dto.getContent().length();i++){
		stringContent[i]=String.valueOf(charContent[i]);
		}
		
	
		for(int i= 0;i<dto.getContent().length();i++){
		
		if(stringContent[i].equals("<")&&stringContent[i+1].equals("i")&&stringContent[i+2].equals("m")&&stringContent[i+3].equals("g")){
		/*System.out.println("이미지시작"+i);*/
		imageStart=i;
		}
		
		if(stringContent[i].equals("w")&&stringContent[i+1].equals("i")&&stringContent[i+2].equals("d")&&stringContent[i+3].equals("t")){
		/*System.out.println("이미지끝"+(i+11));*/
		imageEnd=i+12;
		image[imageCount]=dto.getContent().substring(imageStart, imageEnd);
		if(imageCount==0)dto.setImage1(image[imageCount]);if(imageCount==1)dto.setImage2(image[imageCount]);if(imageCount==2)dto.setImage3(image[imageCount]);if(imageCount==3)dto.setImage4(image[imageCount]);if(imageCount==4)dto.setImage5(image[imageCount]);
		if(imageCount==5)dto.setImage6(image[imageCount]);if(imageCount==6)dto.setImage7(image[imageCount]);if(imageCount==7)dto.setImage8(image[imageCount]);if(imageCount==8)dto.setImage9(image[imageCount]);if(imageCount==9)dto.setImage10(image[imageCount]);
		
				imageStart=0;
				imageEnd=0;
				imageCount++;
		}
		}
		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return new ModelAndView("redirect:/member/login");
		}
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+File.separator+"uploads"+File.separator+"bbs";
		
		dto.setUserId(info.getUserId());
		dto.setUserName(info.getUserName());
	
	System.out.println(dto.getApproveCheck());
		service.insertDeal(dto, path);
		
		return new ModelAndView("redirect:/main.do");
	}
	
	
	// 댓글 및 리플별 답글 추가
		@RequestMapping(value="/deal/dealReplyCreated",method=RequestMethod.POST)
		public void replyCreated(
				HttpServletResponse resp,
				HttpSession session,
				DealReply dto) throws Exception {
		
			SessionInfo info=(SessionInfo) session.getAttribute("member");

			String state="true";
			if(info==null) { // 로그인이 되지 않는 경우
				state="loginFail";
			} else {
				dto.setUserId(info.getUserId());
				dto.setUserName(info.getUserName());
				int result=service.insertDealReply(dto);
							
				if(result==0)
					state="false";
			}
			info.setDealInNoticeCount(service.readDealJoinCount(info.getUserId()));
			info.setMyDealTotal(service.readDealJoinCount(info.getUserId()));
			
			session.setAttribute("DealInNoticeCount", info.getDealInNoticeCount());
			
			// 작업 결과를 json으로 전송
			JSONObject job=new JSONObject();
			job.put("state", state);
			job.put("DealInNoticeCount", info.getDealInNoticeCount());
			
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print(job.toString());
		}
	
		
		@RequestMapping(value="/deal/mainDealreplyList")
		public ModelAndView replyList(
				@RequestParam(value="dealNum") int dealNum
				) throws Exception {
			
		
			
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("dealNum", dealNum);
			

			List<DealReply> replyList=service.dealReplyList(map);
			
			// 엔터를 <br>
			Iterator<DealReply> it=replyList.iterator();
			int listNum, n=0;
			while(it.hasNext()) {
				DealReply dto=it.next();
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
				n++;
			}
			
			// 페이징처리(인수2개 짜리 js로 처리)

			
			ModelAndView mav=new ModelAndView("main/mainReply");

			// jsp로 넘길 데이터
			mav.addObject("replyList", replyList);

			
			return mav;
		}
	
		
		@RequestMapping(value="/deal/dealLike",method=RequestMethod.POST)
		public void replyLike(
				HttpServletResponse resp,
				HttpSession session,
				DealLike dto) throws Exception {
		
			SessionInfo info=(SessionInfo) session.getAttribute("member");
			
			String state="true";
			if(info==null) { // 로그인이 되지 않는 경우
				state="loginFail";
			} else {
				dto.setUserId(info.getUserId());
				int result=service.insertDealLike(dto);
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
		
		
		@RequestMapping(value="/deal/dealCategoryList", method=RequestMethod.POST)
		public void smallCategoryList(HttpServletResponse resp, int bcNum) throws Exception {
			List<DealCategory> list=service.listSmallCategory(bcNum);
			
			JSONObject jso=new JSONObject();
			jso.put("list", list);
			
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print(jso.toString());
		}
		
		@RequestMapping(value="/deal/smillarDealList", method=RequestMethod.POST)
		public void smillarDealList(HttpServletResponse resp, int smNum) throws Exception {
			List<DealCategory> smillarlist=service.listSmillarDeal(smNum);
			
			JSONObject jso=new JSONObject();
			jso.put("smillarlist", smillarlist);
			
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print(jso.toString());
		}
		
		@RequestMapping(value="/deal/dealIn",method=RequestMethod.POST)
		public void dealIn(
				HttpServletResponse resp,
				HttpSession session,
				@RequestParam(value="dealNum") int dealNum,
				@RequestParam(value="mode") int mode,
				Deal dto) throws Exception {

			SessionInfo info=(SessionInfo) session.getAttribute("member");
			
			String state="true";
			
			try {
				
				if(info==null) { // 로그인이 되지 않는 경우
					state="loginFail";
				} else {
					int result = 0;
					if(mode==1){
					
						dto.setNum(dealNum);
						dto.setUserId(info.getUserId());
						
		
					 result=service.updateDealIn(dto);
					}
					if(mode==0){
						dto.setNum(dealNum);
						dto.setUserId(info.getUserId());
					 result=service.updateDealOut(dto);
					}
					if(result==0)
						state="false";
				}
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			
			// 작업 결과를 json으로 전송
			JSONObject job=new JSONObject();
			job.put("state", state);
			
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print(job.toString());
		}
	
	
}
