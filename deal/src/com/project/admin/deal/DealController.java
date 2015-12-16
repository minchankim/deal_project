package com.project.admin.deal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.deal.dealController")
public class DealController {
	@RequestMapping(value="/admin/deal/category", method=RequestMethod.GET)
	public String category() throws Exception {
		return ".admin.deal.category";
	}
	
	@RequestMapping(value="/admin/deal/notify", method=RequestMethod.GET)
	public String noti() throws Exception {
		return ".admin.deal.notify";
	}
	
	@RequestMapping(value="/admin/deal/side", method=RequestMethod.GET)
	public String side() throws Exception {
		return ".admin.deal.side";
	}
}
