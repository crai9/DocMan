package com.team13.spring;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.team13.spring.db.DBManager;
import com.team13.spring.login.Encrypt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginTestController {

	@RequestMapping(value = {"/loginPage"}, method = RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("login-form");
		
		return model;
	}
	
	@RequestMapping(value = {"/login"}, method = RequestMethod.POST)
	public String process(HttpServletRequest request, @RequestParam("username") String username, @RequestParam("password") String password) {
		
		String encPass = Encrypt.encryptString(password);
		
		System.out.println("Username: " + username);
		System.out.println("Password: " + password);
		System.out.println("Password Encrypted: " + encPass);
		
		try {
			if(DBManager.login(username, password)){
				System.out.println("Success");
			} else { 
				System.out.println("Failed");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/home";
	}
	
	@RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
	public String logOut(HttpServletRequest request) {
				
			request.getSession().removeAttribute("username");
			
		return "redirect:/home";
	}
	
}
