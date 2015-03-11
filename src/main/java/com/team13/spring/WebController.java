package com.team13.spring;


import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class WebController {
	
	@RequestMapping(value = {"/", "/home", "/index"}, method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "login", required = false, defaultValue = "false") Boolean login) {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("home");
		
		return model;
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard() {
		
		ModelAndView model = new ModelAndView();
		
			
		//Logged in
		model.addObject("authenticated", true);
		model.addObject("username", "Craig");
	
		
		model.setViewName("dashboard");
		
		return model;
	}
		
}
