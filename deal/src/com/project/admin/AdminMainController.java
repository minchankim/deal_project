package com.project.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller("admin.mainController")
public class AdminMainController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public ModelAndView main() throws Exception {
		
		ModelAndView mav = new ModelAndView(".adminMainLayout");

		
		//mav.addObject("", );
		return mav;
	}
}
