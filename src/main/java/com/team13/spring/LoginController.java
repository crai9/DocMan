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
				
				User u = DBManager.getUserById(id);
				String fn = u.getFirstName();
				
				request.getSession().setAttribute("roles", roles);
				request.getSession().setAttribute("id", id);
				request.getSession().setAttribute("username", fn);
				request.getSession().setAttribute("authenticated", true);
				System.out.println("Added roles to session");
				
				if(hasRole(request, "ROLE_ADMIN")){
					request.getSession().setAttribute("admin", true);
				}
				if(hasRole(request, "ROLE_USER")){
					request.getSession().setAttribute("user", true);
				}
				
				return "redirect:/dashboard";
			} else { 
				System.out.println("Failed");
			}
		} catch (SQLException e) {
			// 
			e.printStackTrace();
		}
		
		return "redirect:/loginPage?success=no";
	}
	
	@RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
	public String logOut(HttpServletRequest request) {
				
			request.getSession().removeAttribute("roles");
			request.getSession().removeAttribute("id");
			request.getSession().removeAttribute("username");
			request.getSession().setAttribute("authenticated", false);
			request.getSession().removeAttribute("admin");
			request.getSession().removeAttribute("user");

			
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
			@RequestParam("adminRole") String adminRole, HttpServletRequest request){
		
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
			
			DBManager.createUser(username, encPass, fname, lname, email, adminRole);


			}
		
		}
		
		return "redirect:/users/page/1";
	}
	
	@RequestMapping(value = "/users/page/{pageNo}")
	public String paginatedList(Model model, HttpServletRequest request, @PathVariable int pageNo){
		
		//Check if admin
		
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		String s = null;
		
		double total = DBManager.countUsers();
		double perPage = 10;
		int pages = (int) Math.ceil(total / perPage);
		int nextPage, prevPage;
		
		if(pages > 1){
			if(pageNo <= 1){
				pageNo = 1;
				prevPage = pageNo;
				nextPage = pageNo + 1;
			} else if(pageNo >= pages) {
				pageNo = pages;
				nextPage = pageNo;
				prevPage = pageNo - 1;
			} else {
				nextPage = pageNo + 1;
				prevPage = pageNo - 1;
			}	
		} else {
			nextPage = 0;
			prevPage = 0;
		}

		
		int start = (int) ((pageNo - 1) * (perPage));
		
		System.out.println("There will be " + pages + " pages.");
		System.out.println("You are on page:  " + pageNo);
		
		model.addAttribute("list", DBManager.allUsersPaged(s, perPage, start));
		model.addAttribute("totalPages", (int) pages);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("prevPage", prevPage);
		
		return "pagedList";
	}
	
	@RequestMapping(value = "/users/search/{search}/page/{pageNo}")
	public String paginatedListSearch(HttpServletRequest request, Model model, @PathVariable String search, @PathVariable int pageNo){
		
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		double total = DBManager.countUsers(search);
		double perPage = 10;
		int pages = (int) Math.ceil(total / perPage);
		int nextPage, prevPage;
		
		if(pages > 1){
			if(pageNo <= 1){
				pageNo = 1;
				prevPage = pageNo;
				nextPage = pageNo + 1;
			} else if(pageNo >= pages) {
				pageNo = pages;
				nextPage = pageNo;
				prevPage = pageNo - 1;
			} else {
				nextPage = pageNo + 1;
				prevPage = pageNo - 1;
			}	
		} else {
			nextPage = 0;
			prevPage = 0;
		}
		
		int start = (int) ((pageNo - 1) * (perPage));
		
		System.out.println("There will be " + pages + " pages.");
		System.out.println("You are on page:  " + pageNo);
		
		model.addAttribute("list", DBManager.allUsersPaged(search, perPage, start));
		model.addAttribute("totalPages", (int) pages);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("search", true);
		
		return "pagedList";
	}
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editPost(HttpServletRequest request, @RequestParam("fname") String fname,
			@RequestParam("lname") String lname, @RequestParam("email") String email,
			@RequestParam("username") String username, @RequestParam("id") int id,
			@RequestParam("adminRole") String adminRole, @RequestParam("originalAdminRole") String originalAdminRole){
		
		if(!hasRole(request, "ROLE_ADMIN")){
			return "403";
		}
		
		System.out.println(id);
		if(!adminRole.equals(originalAdminRole)){
			//roles don't need updated
			System.out.println("Roles need updated");
			
			if(adminRole.equals("yes")){
				//request to add the role
				DBManager.addRole(id, "ROLE_ADMIN");
			} else {
				//request to remove the role
				DBManager.removeRole(id, "ROLE_ADMIN");
			}
			
		} else {
			//something changed
			System.out.println("Roles stay the same");
		}

		
		DBManager.updateUser(id, username, fname, lname, email);
		
		return "redirect:/users/page/1";
	}
	
	@RequestMapping(value = "user/edit/{id}")
	public String editUser(HttpServletRequest request, Model model, @PathVariable int id){
		
		if(!hasRole(request, "ROLE_ADMIN")){
			return "403";
		}
		
		User u = DBManager.getUserById(id);
		
		model.addAttribute("user", u);
		
		String[] roles = DBManager.getUserRolesById(id);
		if(roles == null){
			model.addAttribute("admin", false);
		} else {
			if(!Arrays.asList(roles).contains("ROLE_ADMIN")){
				model.addAttribute("admin", true);
			} else {
			model.addAttribute("admin", false);
			}
		}
		
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
		
		return "redirect:/users/page/1";
	}

}
	
	
