package com.team13.spring;

import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ExtraController {
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public @ResponseBody String bonusPage() {
		
		return "This page works!";
	}
	

	
}
