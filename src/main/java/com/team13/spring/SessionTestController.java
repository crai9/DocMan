package com.team13.spring;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SessionTestController {

	@RequestMapping(value = {"/sessions"}, method = RequestMethod.GET)
	public ModelAndView homePage(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView();
		
		request.getSession().setAttribute("username", "Craig");
		model.addObject("message", "The username is:");	
		model.setViewName("sessions");
		
		return model;
	}
	
	@RequestMapping(value = {"/sessions2"}, method = RequestMethod.GET)
	public ModelAndView secondPage(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView();
				
		model.addObject("message", "The username is:");
		model.setViewName("sessions");
		
		return model;
	}
	
	
	@RequestMapping(value = {"/logout1"}, method = RequestMethod.GET)
	public String logOut(HttpServletRequest request) {
				
			request.getSession().removeAttribute("username");
			
		return "redirect:/home";
	}
	
}
