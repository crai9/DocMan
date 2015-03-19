package com.team13.spring;


import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class WebController {
	
	public static Boolean hasRole(HttpServletRequest request, String role){
		String[] roles = (String[])request.getSession().getAttribute("roles");
		if(roles == null){
			return false;
		} else {
			if(!Arrays.asList(roles).contains(role)){
				return false;
			}
			return true;
		}
	}
	
	@RequestMapping(value = {"/", "/home", "/index"}, method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "login", required = false, defaultValue = "false") Boolean login) {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("home");
		
		return model;
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard(HttpServletRequest request) {

		
		ModelAndView model = new ModelAndView();

			
		//Logged in
		//model.addObject("authenticated", true);
		//model.addObject("username", "Craig");
	
		
		model.setViewName("dashboard");
		
		
		if(hasRole(request, "ROLE_ADMIN")){
			model.addObject("admin", true);
		} else {
			model.addObject("admin", false);
		}
		

		
		return model;
	}
		
}
