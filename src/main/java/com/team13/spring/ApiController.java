package com.team13.spring;

import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team13.spring.db.DBManager;
import com.team13.spring.model.UserStatus;

@RestController
public class ApiController {

	@RequestMapping(value = {"/checkUser"})
	public UserStatus person(@RequestParam("username") String username){
		
		UserStatus u = new UserStatus();
		
		if(DBManager.checkIfUserExists(username)){
			u.setAvailable(false);
		} else {
			u.setAvailable(true);
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