package com.project.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller("admin.mainController")
public class AdminMainController {
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String main() throws Exception {
		return ".adminMainLayout";
	}
}
