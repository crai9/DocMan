package com.team13.spring.tests;

import static org.junit.Assert.*;

import com.team13.spring.validation.*;

import org.junit.Test;

public class ValidatorTest{

	@Test
	public void testUsername(){
		
		//I don't know what I'm doing
		
		String[] usernames = {"craig", "123213", "hhh", "test1", "5"};
		
		Boolean[] results = {false, false, false, false, false};
		
		for(int i = 0; i < 5; i++){
			assertEquals("Invalid usernames", Validator.usernameValidate(usernames[i]), results[i]);
		}
		
	}
	

}


