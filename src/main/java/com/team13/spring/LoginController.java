package com.team13.spring;

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
public class LoginController {

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
	
	
	@RequestMapping(value = "/showRoles")
	public @ResponseBody String showRoles(HttpServletRequest request){
		
		String[] roles = (String[])request.getSession().getAttribute("roles");
		
		for(String role : roles){
			System.out.println(role);
		}
		
		return "shown";
	}
	
	
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
			int id = DBManager.login(username, encPass);
			if(id != 0){
				System.out.println("Success");
				String[] roles = DBManager.getUserRolesById(id);
				
				request.getSession().setAttribute("roles", roles);
				request.getSession().setAttribute("id", id);
				System.out.println("Added roles to session");
				return "redirect:/listAll";
			} else { 
				System.out.println("Failed");
			}
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		}
		
		return "redirect:/loginPage";
	}
	
	@RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
	public String logOut(HttpServletRequest request) {
				
			request.getSession().removeAttribute("roles");
			
		return "redirect:/home";
	}
	
	// Register Page
	@RequestMapping(value = "/registerPage", method = RequestMethod.GET)
	public String registerPage(HttpServletRequest request){
		
		if(!hasRole(request, "ROLE_ADMIN")){
			return "403";
		}
		
		return "add-users";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(
			@RequestParam("fname") String fname, @RequestParam("lname") String lname,
			@RequestParam("email") String email, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("cpassword") String cpassword,
			HttpServletRequest request){
		
		if(!hasRole(request, "ROLE_ADMIN")){
			return "403";
		}
		
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
		
		return "redirect:/listAll";
	}
	
	
	@RequestMapping(value = "/listAll/search/{search}")
	public String listAllSearch(HttpServletRequest request, Model model, @PathVariable String search){
		
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		model.addAttribute("list", DBManager.allUsers(search));
		
		return "listAll";
	}
	
	@RequestMapping(value = "/listAll")
	public String listAll(Model model, HttpServletRequest request){
		
		//Check if admin
		
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		String s = null;
		
		model.addAttribute("list", DBManager.allUsers(s));
		
		return "listAll";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editPost(HttpServletRequest request, @RequestParam("fname") String fname,
			@RequestParam("lname") String lname, @RequestParam("email") String email,
			@RequestParam("username") String username, @RequestParam("id") int id){
		
		if(!hasRole(request, "ROLE_ADMIN")){
			return "403";
		}
		
		System.out.println(id);
		System.out.println(fname);
		System.out.println(lname);
		System.out.println(email);
		System.out.println(username);
		
		DBManager.updateUser(id, username, fname, lname, email);
		
		return "redirect:/listAll";
	}
	
	@RequestMapping(value = "user/edit/{id}")
	public String editUser(HttpServletRequest request, Model model, @PathVariable int id){
		
		if(!hasRole(request, "ROLE_ADMIN")){
			return "403";
		}
		
		User u = DBManager.getUserById(id);
		
		model.addAttribute("user", u);
		
		return "editUser";
	}
	
	//Delete User
	@RequestMapping(value = "/user/delete/{id}")
	public String deleteUser(HttpServletRequest request, @PathVariable int id){
		
		if(!hasRole(request, "ROLE_ADMIN")){
			return "403";
		}
		
		DBManager.deleteUserById(id);
		
		System.out.println("Removed row with id " + id);
		
		return "redirect:/listAll";
	}

}
	
	
