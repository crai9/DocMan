package com.team13.spring;

import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team13.spring.db.DBManager;
import com.team13.spring.model.User;
import com.team13.spring.model.UserStatus;

@RestController
public class ApiController {
	
	@RequestMapping(value = {"/checkUser"})
	public UserStatus person(@RequestParam("username") String username, @RequestParam(value = "id", required = false) Integer id){
		
		UserStatus u = new UserStatus();
		
		if(id != null){
			User u2 = DBManager.getUserById(id);
			if(u2.getId() == 0){
				u.setValid(false);
				return u;
			}
			String un = u2.getUsername();
			if(un.equals(username)){
				u.setValid(true);
			} else {
				if(DBManager.checkIfUserExists(username)){
					u.setValid(false);
				} else {
					u.setValid(true);
				}
			}
			
			return u;
		
		}
		
		if(DBManager.checkIfUserExists(username)){
			u.setValid(false);
		} else {
			u.setValid(true);
		}

		
		return u;
	}
	
	@RequestMapping(value = {"/getAllUsers"})
	public String[] allUsers(){
		
		String[] s = DBManager.allUsersToArray();
		
		return s;
	}
	
}
//