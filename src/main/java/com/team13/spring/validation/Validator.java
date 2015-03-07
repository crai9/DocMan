package com.team13.spring.validation;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

public class Validator {

	public static void main(String[] args) {
		
		String email = "test@test.com";
		String firstName = "Test";
		String lastName = "Test";
		String username = "test12345";
		String password = "test123"; 
		
		if(checkFirstName(firstName)){
			System.out.println("First Name Valid: " + firstName);
		} else {
			System.out.println("First name Invalid");
		}
		
		if(checkFirstName(lastName)){
			System.out.println("Last Name Valid: " + lastName);
		} else {
			System.out.println("Last name Invalid");
		}
		
		if(checkEmail(email)){
			System.out.println("Email Valid: " + email);
		} else {
			System.out.println("Email Invalid");
		}
		
		
		if(usernameValidate(username)){
			System.out.println("Username Valid: " + username);
		} else {
			System.out.println("Username Invalid");
		}
		
		if(validatePassword(password)){
			System.out.println("Password Valid: " + password);
		} else {
			System.out.println("Password Invalid");
		}
		
		// added this. Checks if password matches user then it wont create a user.
		if(username == password){
			System.out.println("Password cannot match username");
		}
		else {
			System.out.println("Password is different from username");
		}
	}
	
	public static Boolean checkEmail(String email){
		   boolean result = true;
		   try {
		      InternetAddress emailAddr = new InternetAddress(email);
		      emailAddr.validate();
		   } catch (AddressException ex) {
		      result = false;
		   }
		   return result;
	}
	
	 public static boolean validatePassword(String password){

	    	String pattern = "(?=.*[0-9])(?=.*[a-z]).{6,20}";
		    return password.matches(pattern);
	    }
	
	 public static boolean usernameValidate(String username){
		
		String pattern = "(?=.*[a-z]).{6,20}";
		
		return username.matches(pattern);
	}
	
	public static Boolean checkFirstName(String firstName){
		
		String pattern = "(?=.*[a-z]).{1,99}";
		
		return firstName.matches(pattern);
	}
	
	public static Boolean checkLasttName(String lastName){
		
		String pattern = "(?=.*[a-z]).{1,99}";
		System.out.println("Last Name: " + lastName);
		return lastName.matches(pattern);
	}

}
