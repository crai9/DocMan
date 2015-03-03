package com.team13.spring;

import java.sql.SQLException;

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
		
		String encPass = Encrypt.crypt(password);
		
		System.out.println("Username: " + username);
		System.out.println("Password: " + password);
		System.out.println("Password Encrypted: " + encPass);
		
		//TODO Validate
		
		try {
			if(DBManager.login(username, encPass)){
				System.out.println("Success");
			} else { 
				System.out.println("Failed");
			}
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		}
		
		//TODO Implement session
		
		return "redirect:/home";
	}
	
	@RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
	public String logOut(HttpServletRequest request) {
				
			request.getSession().removeAttribute("username");
			
		return "redirect:/home";
	}
	
	// Register Page
	@RequestMapping(value = "/registerPage", method = RequestMethod.GET)
	public ModelAndView registerPage(){
		
		ModelAndView model = new ModelAndView();

		model.setViewName("add-users");
		
		return model;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(
			@RequestParam("fname") String fname, @RequestParam("lname") String lname,
			@RequestParam("email") String email, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("cpassword") String cpassword
			){
		
		//TODO Add more validation
		
		if (DBManager.checkIfUserExists(username)){
			
			System.out.println("User exists");
			
		} else {
			
			if(password == cpassword){
				System.out.println("Passwords don't match");
			} else {
			
			String encPass = Encrypt.crypt(password);
			
			DBManager.createUser(username, encPass, fname, lname, email);
			
			System.out.println(fname);
			System.out.println(lname);
			System.out.println(email);
			System.out.println(username);
			System.out.println(password + " (" + encPass + ")");
			}
		
		}
		
		
		
		
		return "redirect:/registerPage";
	}
	
	@RequestMapping(value = "/listAll")
	public String listAll(Model model){
		
		//TODO Require Admin Role
		
		model.addAttribute("list", DBManager.allUsers());
		
		return "listAll";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editPost(@RequestParam("fname") String fname, @RequestParam("lname") String lname,
			@RequestParam("email") String email, @RequestParam("username") String username, @RequestParam("id") int id){
		
		System.out.println(id);
		System.out.println(fname);
		System.out.println(lname);
		System.out.println(email);
		System.out.println(username);
		
		DBManager.updateUser(id, username, fname, lname, email);
		
		return "redirect:/user/edit/" + id;
	}
	
	@RequestMapping(value = "user/edit/{id}")
	public String editUser(Model model, @PathVariable int id){
		
		User u = DBManager.getUserById(id);
		
		model.addAttribute("user", u);
		
		return "editUser";
	}
	
	@RequestMapping(value = "/user/delete/{id}")
	public String deleteUser(@PathVariable int id){
		
		//TODO Require admin role
		
		DBManager.deleteUserById(id);
		
		System.out.println("Removed row with id " + id);
		
		return "redirect:/listAll";
	}

}
	
	