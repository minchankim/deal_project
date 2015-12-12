package com.project.myDeal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("myDealController")
public class MyDealController {
	 
	@RequestMapping(value="/myDeal/myDeal",method=RequestMethod.GET)
	public ModelAndView method() {
		ModelAndView mav = new ModelAndView(".myDeal.myDeal");
		System.out.println("∏∂¿ÃµÙ Ω««‡");
		return mav;
	}
}
