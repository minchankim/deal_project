package com.project.admin.point;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller("admin.member.pointController")
public class PointController {
	@RequestMapping(value="/admin/point/number", method=RequestMethod.GET)
	public String number() throws Exception {
		return ".admin.point.number";
	}
	
	@RequestMapping(value="/admin/point/refund", method=RequestMethod.GET)
	public String refund() throws Exception {
		return ".admin.point.refund";
	}

}


