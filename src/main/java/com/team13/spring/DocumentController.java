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
	public String createDocument(HttpServletRequest request, Model model){
		
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		int id = (Integer) request.getSession().getAttribute("id");
		model.addAttribute("you", DBManager.getUserById(id));
		
		return "createDocument";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(
			@RequestParam("title") String title, @RequestParam("description") String description,
			@RequestParam("authorName") String authorName, @RequestParam("revNo") int revNo, @RequestParam("file") String file,
			@RequestParam("dateCreated") String dateCreated, @RequestParam("status") String status, HttpServletRequest request){
		
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		//DBManager.createDocument(title, description, authorName, revNo, fileName, dateCreated, status, userName, date);
		long documentId = DBManager.createDocument(title, description, authorName);
		DBManager.addRevision(revNo, file, documentId, dateCreated, status);

		return "redirect:/viewDoc/" + documentId;
	}
	
	@RequestMapping(value = {"/documents"}, method = RequestMethod.GET)
	public String documents(Model model, HttpServletRequest request){
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		String s = null;
		
		model.addAttribute("document", DBManager.allDocuments(s));
		return "viewDocuments";
	}
	
	@RequestMapping(value = {"/viewDoc/{id}"}, method = RequestMethod.GET)
	public String viewDocs(Model model, HttpServletRequest request, @PathVariable int id){
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		model.addAttribute("document", DBManager.getDocumentById(id));
		return "viewDoc";
	}
	
	//Delete User
	@RequestMapping(value = "/document/delete/{id}")
	public String deleteDocument(HttpServletRequest request, @PathVariable int id){
		
		if(!hasRole(request, "ROLE_USER")){
			return "403";
		}
		
		DBManager.deleteDocumentById(id);
		
		System.out.println("Removed row with id " + id);
		
		return "redirect:/dashboard";
	}
	
}
