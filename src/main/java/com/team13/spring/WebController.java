package com.team13.spring;


import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = { "/home", "/index"}, method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "login", required = false, defaultValue = "false") Boolean login) {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("home");
		
		return model;
	}
	
	@RequestMapping(value = {"/dashboard", "/"}, method = RequestMethod.GET)
	public String dashboard(Model model, HttpServletRequest request) {

		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}

		if(hasRole(request, "ROLE_ADMIN")){
			model.addAttribute("admin", true);
		} else {
			model.addAttribute("admin", false);
		}
		
		return "dashboard";
	}
		
}
