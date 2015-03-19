package com.team13.spring;

import java.io.File;
import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import com.team13.spring.db.DBManager;
import com.team13.spring.login.Encrypt;
import com.team13.spring.model.User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DocumentController {
	
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

	@RequestMapping(value = {"/createDocument"}, method = RequestMethod.GET)
	public String createDocument(HttpServletRequest request){
		
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		return "createDocument";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(
			@RequestParam("title") String title, @RequestParam("description") String description,
			@RequestParam("authorName") String authorName,
			HttpServletRequest request){
		
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		//DBManager.createDocument(title, description, authorName, revNo, fileName, dateCreated, status, userName, date);
		DBManager.createDocument(title, description, authorName);
		

		return "redirect:/createDocument";
	}
	
	@RequestMapping(value = {"/documents"}, method = RequestMethod.GET)
	public String documents(HttpServletRequest request){
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		return "viewDocuments";
	}
	
}
